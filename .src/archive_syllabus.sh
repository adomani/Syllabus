#! /bin/bash

##  `.src/archive_syllabus.sh <module> <academic_year> [<commit>]`
##
##  Saves a frozen copy of the syllabus page `<module>.md`, as it was at `<commit>`
##  (default `HEAD`), to `archive/<module>_<academic_year>.md` and updates the list
##  of past syllabi in `archive/index.md`.
##  For instance, running
##
##    .src/archive_syllabus.sh MA4N1 2026-27
##
##  before resetting the syllabus for the next academic year archives the final
##  version of the 2026-27 syllabus.
##
##  The archived copy differs from the original as follows.
##  * The script that reloads the page once is removed: the page no longer changes.
##  * A note below the title says that the page is archived and links to the past syllabi.
##  * The dates of the weeks include the year, taken from the `## Autumn <year>` heading,
##    as in `Week 1 (Oct 02-06, 2023)`.
##  * The link to the tentative syllabus, which is not archived, is replaced by
##    a link to the past syllabi.
##  * Links that would show later versions of what they point to are pinned to the
##    versions current at the last update of `<module>.md`, so that they keep showing
##    what they showed that year:
##    - links to files on GitHub that use a branch name, such as `.../blob/master/...`,
##      and links to raw files on GitHub point to the last commit on that branch
##      before that date;
##    - links to the home page of a GitHub repository point to the repository at its
##      last commit before that date;
##    - links to other pages of this website, which only shows their current version,
##      point to their source on GitHub at the commit that last changed `<module>.md`.
##    Links to renamed repositories use the current name of the repository.
##
##  The script warns about links to files that did not exist at the pinned commit:
##  those links were already broken that year and need fixing by hand.
##
##  `.src/archive_syllabus.sh --index` only regenerates `archive/index.md`.

set -euo pipefail

cd "$(git rev-parse --show-toplevel)"

archiveUrl='https://adomani.github.io/Syllabus/archive'

##  `write_index` prints the list of the archived syllabi in `archive/`.
##  Modules with more recent archived syllabi come first, and years are newest first.
write_index () {
  local entries mod yr latest
  entries="$(find archive -maxdepth 1 -name '*_[0-9][0-9][0-9][0-9]-[0-9][0-9].md' |
    sed 's=^archive/\(.*\)_\([0-9-]*\)\.md$=\2 \1=' | sort -r)"
  printf '# Past syllabi\n\n'
  printf 'The final versions of the syllabi of past years.\n\n'
  printf 'The current syllabus for MA4N1 Theorem Proving with Lean is [here](https://adomani.github.io/Syllabus/MA4N1).\n'
  for mod in $(awk '!seen[$2]++ { print $2 }' <<< "${entries}")
  do
    latest="$(awk -v m="${mod}" '$2 == m { print $1; exit }' <<< "${entries}")"
    printf '\n## %s\n\n' "$(sed -n '/^# /{ s=^# ==; s=^\[\([^]]*\)\].*=\1=; p; q; }' "archive/${mod}_${latest}.md")"
    for yr in $(awk -v m="${mod}" '$2 == m { print $1 }' <<< "${entries}")
    do
      printf '* [%s](%s/%s_%s) (%s)\n' "${yr}" "${archiveUrl}" "${mod}" "${yr}" \
        "$(sed -n 's=^## \(Autumn [0-9]*\)$=\1=p' "archive/${mod}_${yr}.md")"
    done
  done
  printf '\n---\n\n[Back to the syllabi](https://adomani.github.io/Syllabus)\n'
}

if [ "${1:-}" == "--index" ] && [ "$#" -eq 1 ]
then
  write_index > archive/index.md
  exit 0
fi

if [ "$#" -lt 2 ] || [ "$#" -gt 3 ]
then
  awk 'NR > 2 && !/^##/ { exit } NR > 2 { sub(/^## ?/, ""); sub(/^ /, ""); print }' "${0}" >&2
  exit 1
fi

module="${1}"
year="${2}"
commit="${3:-HEAD}"
target="archive/${module}_${year}.md"

##  the date of the last change to `<module>.md`, up to `<commit>`
lastDate="$(git log -1 --format=%cI "${commit}" -- "${module}.md")"
if [ -z "${lastDate}" ]
then
  printf 'There is no `%s.md` at `%s`.\n' "${module}" "${commit}" >&2
  exit 1
fi

page="$(git show "${commit}:${module}.md")"

##  `retry <cmd>` runs `<cmd>` up to three times, until it succeeds.
retry () {
  local attempt
  for attempt in 1 2 3
  do
    "$@" && return 0
    sleep "${attempt}"
  done
  return 1
}

tmp="$(mktemp -d)"
trap 'rm -rf "${tmp}"' EXIT

warnings=0
warn () {
  printf 'Warning: %s\n' "${1}" >&2
  warnings=$(( warnings + 1 ))
}

##  `pin <owner> <repo> <ref>` sets `fullName` to the current name of the GitHub repository
##  `<owner>/<repo>` and `sha` to its last commit on `<ref>` before the last update of the page.
##  If this is not possible, it warns and fails.
pin () {
  local clone="${tmp}/${1}_${2}"
  if [ ! -d "${clone}" ]
  then
    if ! retry git clone -q --bare --filter=blob:none "https://github.com/${1}/${2}.git" "${clone}"
    then
      warn "could not clone ${1}/${2}: its links are not pinned"
      return 1
    fi
    retry gh api "repos/${1}/${2}" --jq .full_name > "${clone}.name" 2>/dev/null ||
      printf '%s/%s\n' "${1}" "${2}" > "${clone}.name"
  fi
  fullName="$(< "${clone}.name")"
  sha="$(git -C "${clone}" rev-list -1 --before="${lastDate}" "${3}" -- 2>/dev/null || true)"
  if [ -z "${sha}" ]
  then
    warn "no commit on ${1}/${2} ${3} before ${lastDate}: its links are not pinned"
    return 1
  fi
}

##  `check_paths <owner> <repo> <prefix>` warns about the links starting with `<prefix>`
##  to files or directories that do not exist in `<owner>/<repo>` at the commit `sha`.
check_paths () {
  local path
  for path in $(grep -oE "${3}[^\"#?)]*" <<< "${page}" | sed "s|^${3}||" | sort -u)
  do
    [ -n "$(git -C "${tmp}/${1}_${2}" ls-tree "${sha}" -- "${path%/}")" ] ||
      warn "${path} does not exist in ${fullName} at ${sha:0:10}"
  done
}

##  `replace_link <url> <new>` replaces the links to exactly `<url>`, possibly followed by
##  `/`, an anchor or a query, with links to `<new>`.
replace_link () {
  local end
  for end in '"' '#' '?' ')' '/"' '/#' '/?' '/)'
  do
    page="${page//"${1}${end}"/"${2}${end#/}"}"
  done
  printf 'Pinned %s to %s\n' "${1}" "${2}"
}

##  pin the links to files and directories on GitHub that use a branch name
for prefix in $(grep -oE 'https://github\.com/[^/"]+/[^/"]+/(blob|tree)/[^/"]+/' <<< "${page}" | sort -u)
do
  IFS=/ read -r _ _ _ owner repo kind ref _ <<< "${prefix}"
  [[ "${ref}" =~ ^[0-9a-f]{40}$ ]] && continue
  pin "${owner}" "${repo}" "${ref}" || continue
  pinned="https://github.com/${fullName}/${kind}/${sha}/"
  page="${page//"${prefix}"/"${pinned}"}"
  printf 'Pinned %s to %s\n' "${prefix}" "${pinned}"
  check_paths "${owner}" "${repo}" "${pinned}"
done

##  pin the links to raw files on GitHub that use a branch name
for prefix in $(grep -oE 'https://raw\.githubusercontent\.com/[^/"]+/[^/"]+/[^/"]+/' <<< "${page}" | sort -u)
do
  IFS=/ read -r _ _ _ owner repo ref _ <<< "${prefix}"
  [[ "${ref}" =~ ^[0-9a-f]{40}$ ]] && continue
  pin "${owner}" "${repo}" "${ref}" || continue
  pinned="https://raw.githubusercontent.com/${fullName}/${sha}/"
  page="${page//"${prefix}"/"${pinned}"}"
  printf 'Pinned %s to %s\n' "${prefix}" "${pinned}"
  check_paths "${owner}" "${repo}" "${pinned}"
done

##  pin the links to the home pages of GitHub repositories
for url in $(grep -oE 'https://github\.com/[^/"#?)]+/[^/"#?)]+/?["#?)]' <<< "${page}" |
  sed 's=/\{0,1\}["#?)]$==' | sort -u)
do
  IFS=/ read -r _ _ _ owner repo <<< "${url}"
  pin "${owner}" "${repo}" HEAD || continue
  replace_link "${url}" "https://github.com/${fullName}/tree/${sha}"
done

##  pin the links to the pages of this website, which only shows their current version,
##  to their source on GitHub when `<module>.md` was last changed
siteUrl='https://adomani.github.io/Syllabus'
siteSha="$(git rev-list -1 "${commit}" -- "${module}.md")"
for url in $(grep -oE 'https://adomani\.github\.io/Syllabus(/[^"#?)]*)?' <<< "${page}" | sed 's=/$==' | sort -u)
do
  path="${url#"${siteUrl}"}"
  path="${path#/}"
  [[ "${path}" == archive || "${path}" == archive/* ]] && continue
  file=''
  for candidate in "${path}.md" "${path}/index.md" "${path}"
  do
    candidate="${candidate#/}"
    if [ "$(git cat-file -t "${siteSha}:${candidate}" 2>/dev/null)" == blob ]
    then
      file="${candidate}"
      break
    fi
  done
  if [ -z "${file}" ]
  then
    warn "${url} has no source in this repository at ${siteSha:0:10}: it is not pinned"
    continue
  fi
  replace_link "${url}" "https://github.com/adomani/Syllabus/blob/${siteSha}/${file}"
done

##  the year of the term, to add to the dates of the weeks
autumn="$(sed -n 's=^## Autumn \([0-9]\{4\}\)$=\1=p' <<< "${page}" | head -1)"
[ -n "${autumn}" ] || warn 'there is no `## Autumn <year>` heading: the dates of the weeks do not include the year'
grep -q '>Week [0-9]* ([^)]*Jan' <<< "${page}" &&
  warn "some weeks are in January: check that they show the right year, not ${autumn}"

banner="> **Archived syllabus**: the final version of the syllabus for the academic year ${year}.
> Links to GitHub and to other pages of this website point to their versions at the last update of this page.
> [All past syllabi](${archiveUrl})"

mkdir -p archive
printf '%s\n' "${page}" |
  sed '/how-to-reload-page-only-once/,/<\/script>/d' |
  BANNER="${banner}" awk '
    { print }
    (! done) && /^## / { print ""; print ENVIRON["BANNER"]; done = 1 }' |
  sed "s|^What we may be doing in the coming lectures: \[tentative syllabus\](.*)$|[All past syllabi](${archiveUrl})|" |
  sed "${autumn:+s|\(>Week [0-9]* ([^)]*\))<|\1, ${autumn})<|}" > "${target}"

grep -q 'location.reload' "${target}" && warn 'the script that reloads the page is still there'
grep -q 'tentative syllabus' "${target}" && warn 'the link to the tentative syllabus is still there'
grep -q '^> \*\*Archived syllabus\*\*' "${target}" || warn 'the note about the archived syllabus was not added'

write_index > archive/index.md

printf '\nArchived `%s.md` as of %s (last updated %s) to `%s`.\n' \
  "${module}" "$(git rev-parse --short "${commit}")" "${lastDate}" "${target}"
[ "${warnings}" -eq 0 ] || printf '%s warning(s): see above.\n' "${warnings}"
