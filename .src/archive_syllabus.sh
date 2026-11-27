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
##  * Links to files on GitHub that use a branch name, such as `.../blob/master/...`,
##    are pinned to the last commit on that branch before the last update of
##    `<module>.md`, so that they keep showing the files as they were that year.
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

##  pin the links to GitHub files and directories that use a branch name
for repoRef in $(grep -oE 'https://github.com/[^/"]+/[^/"]+/(blob|tree)/[^/"]+/' <<< "${page}" | sort -u)
do
  IFS=/ read -r _ _ _ owner repo kind ref _ <<< "${repoRef}"
  [[ "${ref}" =~ ^[0-9a-f]{40}$ ]] && continue
  clone="${tmp}/${owner}_${repo}"
  if [ ! -d "${clone}" ] &&
    ! retry git clone -q --bare --filter=blob:none "https://github.com/${owner}/${repo}.git" "${clone}"
  then
    warn "could not clone ${owner}/${repo}: its links are not pinned"
    continue
  fi
  sha="$(git -C "${clone}" rev-list -1 --before="${lastDate}" "${ref}" -- 2>/dev/null || true)"
  if [ -z "${sha}" ]
  then
    warn "no commit on ${owner}/${repo} ${ref} before ${lastDate}: its links are not pinned"
    continue
  fi
  fullName="$(retry gh api "repos/${owner}/${repo}" --jq .full_name 2>/dev/null || printf '%s/%s' "${owner}" "${repo}")"
  pinned="https://github.com/${fullName}/${kind}/${sha}/"
  page="${page//"${repoRef}"/"${pinned}"}"
  printf 'Pinned %s to %s\n' "${repoRef}" "${pinned}"
  for path in $(grep -oE "${pinned}[^\"#?)]*" <<< "${page}" | sed "s|^${pinned}||" | sort -u)
  do
    if [ -z "$(git -C "${clone}" ls-tree "${sha}" -- "${path%/}")" ]
    then
      warn "${path} does not exist in ${fullName} at ${sha:0:10}"
    fi
  done
done

##  the year of the term, to add to the dates of the weeks
autumn="$(sed -n 's=^## Autumn \([0-9]\{4\}\)$=\1=p' <<< "${page}" | head -1)"
[ -n "${autumn}" ] || warn 'there is no `## Autumn <year>` heading: the dates of the weeks do not include the year'
grep -q '>Week [0-9]* ([^)]*Jan' <<< "${page}" &&
  warn "some weeks are in January: check that they show the right year, not ${autumn}"

banner="> **Archived syllabus**: the final version of the syllabus for the academic year ${year}.
> Links to files on GitHub point to the versions current at the last update of this page.
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
