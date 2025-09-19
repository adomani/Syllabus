#! /bin/bash

##  `scatterTPwL` reads information from `~/Matematica/Warwick/Syllabus/.src/TPwL_source.md`
##  splits it into files, creates the table of contents and puts them in the `MA4N1/` dir.
scatterTPwL () {
  # read the `ma4n1_id` variable from moving_parts
  local ma4n1_id="$(sed -n 's|^ma4n1_id=\(.*\)|\1|p' .src/moving_parts.txt)"
  local suppDay_ma4n1="$(sed -n 's|^suppDay_ma4n1=\(.*\)|\1|p' .src/moving_parts.txt)"
  ptable ~/Matematica/Warwick/Syllabus/.src/TPwL_source.md |
  sed "s=suppDay_ma4n1=${suppDay_ma4n1}=g" |
  awk -v home="${HOME}/Matematica/Warwick/Syllabus/MA4N1/" -v ma4n1_id="${ma4n1_id}" 'BEGIN {
    mainFileNoExt="toc"
    mainFile=mainFileNoExt".md"
    genericGHurlNS="https://adomani.github.io/Syllabus/MA4N1"
    genericGHurl=genericGHurlNS "/"
    ghurl=genericGHurl mainFileNoExt
    moduleurl="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean"
    toc="\n\n## Available pages\n\n* [Current syllabus](" genericGHurlNS ")"
    moodleurl="https://moodle.warwick.ac.uk/course/view.php?id=" ma4n1_id "#section-0"
    gitpodurl="[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#" moduleurl ")"
    tpwlink="\n\n[Back to the `Theorem Proving with Lean` webpage](" ghurl ")"
    moodlink="\n\n[Back to the Mathlib project for the module](" moduleurl ")\n\n" gitpodurl "\n\n[Back to Moodle](" moodleurl ")"
  }
    /^<!-- newFile [^ ]* -->/  { curr=$3; content[curr]=""; fileNames[$3]++; con=1; }
    #con == 1 &&
    /^##* / {
      linkAnchor=$0
      hashes=0; indents=""
      for (i=1; i<=3; i++) { new=gsub(/^#/, "", linkAnchor); hashes+=new ; if (new == 1) indents=indents "  "; }
      gsub(/  $/, "* ", indents)
      gsub(/"/, "", linkAnchor)
      gsub(/\?/, "", linkAnchor)
      gsub(/`/, "", linkAnchor)
      gsub(/  */, "-", linkAnchor)
      gsub(/##*/, "", linkAnchor)
#      gsub(/\.md$/, ")", linkAnchor)
      if (hashes <= 2) toc=toc sprintf("\n%s[%s](%s%s#%s)", indents, $0, genericGHurl, curr, tolower(linkAnchor))
    }
    !/^<!-- newFile [^ ]* -->/ { con=0; content[curr]=content[curr] $0"\n" }
   END {
    gsub(/\[##*  */, "[", toc)
    gsub(/\.md)/, ")", toc)
    gsub(/\.md#-*/, "#", toc)
    mainFound=0
    for (fil in content) {  ## fil is the name of the file, content[fil] is its content
      if (fil == mainFile) { mainFound++; lk=toc "\n\n---"; printf("* "); } else { lk=tpwlink; printf "  "}
      print fil
      path=home fil
      printf("%s\n---%s%s\n", content[fil], lk, moodlink) > path
      close(path)
    }
    if (mainFound != 1) printf("\n** The main file `%s` was not declared! **\n", mainFile)
    for (name in fileNames)
      if (fileNames[name] >= 2) printf("\n** The file `%s` was declared %s times! **\n", name, fileNames[name])
  }'
}

######################
####  Processing  ####
######################

## scrapes the Git-paths of the projects from the file `TPwL_source.md`
## and outputs an `eval`-ready list of `git clone` commands.
getcloneProjectsCmds () {
  grep -A1 "·" ~/Matematica/Warwick/Syllabus/.src/TPwL_source.md |
    sed -n 's=.*(https://github.com/\([^)]*\))=git clone git@github.com:\1.git=p'
}

## uses `getcloneProjectsCmds` to clone all the repositories found.
cloneProjects () {
  (
    IFS=$'\n'
    for i in $( getcloneProjectsCmds )
    do
      brown "${i}"$'\n'
      eval "$i"
      if [ "${?}" -ne 0 ]; then failed+=("${i}"); fi
    done
    if [ "${#failed[@]}" -ne 0 ]
    then
      brown $'\nFailed clones:\n'
      for i in ${failed[@]}
      do
        printf $'%s\n' "${i}"
      done
    fi
  )
}

## returns the latest commit time of directory in the current dir,
## highlighting the ones whose latest commit is past the deadline.
commitTimes () {
  (
    dl=2024-02-04
    printf $'\n'
    warn='!!'
    for i in */
    do
      glog="$(
        cd "${i}"
        git log -1 --no-patch --format=%ci
      )"
      glog="${glog} $( brown "${i}" )"
      [[ "${dl}" < "${glog/% */}" ]] &&
        lcyan "${warn} " || printf '   '
      printf '%s  %s\n' "${glog}"
    done
    printf $'\n%s: does not meet the deadline %s\n' "$( lcyan "${warn}" )" "${dl}"
  )
}

##  finds `require` statements in the lakefiles.
##(
##  for i in */
##  do
##    brown "${i} "
##    grep require "${i}"/lakefile.lean
##    [ "${?}" -ne 0 ] && printf $'\n'
##  done
##) | column -t

##  Applies a heuristic to extract the tactics used in a file.
##  It is based on the first word on each line, with some filtering.
getFirstWords () {
  sed -n '
    s= rw\[= rw \[=g
    s=^  *\([a-zA-Z][^ ][^ ]*\).*=\1=p
  ' "${1}" |
    grep -v ",$" |
    sort | uniq -c | sort -k1 -n
}

## `getAuthors` is based on this command:
#git log --numstat --format="" "$@" |
#  awk '{files += 1}{ins += $1}{del += $2} END{print "total: "files" files, "ins" insertions(+) "del" deletions(-)"}' #
# source:
# https://stackoverflow.com/questions/2528111/how-can-i-calculate-the-number-of-lines-changed-between-two-commits-in-git

## `getAuthors` in a Git-managed repository returns the list of people
##  who committed to the repository
getAuthors () { git log --pretty="%an" | sort -u ; }

## `gitContributedLinesRaw` in a Git-managed repository returns, for each contributor,
## the number of files, insertions and deletions that they committed.
## for a formatted version, use `gitContributedLines`
gitContributedLinesRaw () {
  (
    IFS=$'\n'
    for au in $( getAuthors )  #Gareth\ Ma neil\ mukerji
    do
      brown "${au// /_}: "
      git log --numstat --format="" "$@" --author="${au}" |
        awk 'BEGIN{ files=0; ins=0; del=0 } {files += 1}{ins += $1}{del += $2} END{
          print "total: "files" files, "ins" insertions(+) "del" deletions(-)"
        }' #
    done
  )
}

## formats the output of `gitContributedLinesRaw`
gitContributedLines () {
  gitContributedLinesRaw | sed 's/^/a\t/' | rev | column -t | rev | cut -c3-
}

##  `inprojs <cmd>` executes `<cmd>` in all the dirs in the current dir.
inprojs () {
  local repo
  for repo in */
  do
    lcyan "${repo}"$'\n'
    (
      cd "${repo}" || exit 1
      $1
    )
  done
}

## `summaryContributions` produces a right-justified output of contributions-by-author
## for each project.
summaryContributions () {
  ( inprojs gitContributedLinesRaw ) |
    sed 's/^/a\t/' | rev | column -t | rev | cut -c3- |
    sed 's=^  *a  *=\n=; s=  *\(deletions(-)\)$=  \1=' |
    awk 'BEGIN{saw=0} (saw == 1) {saw=0; printf "   "} /\// {saw=1} {print $0}'
}

## appends `<----` to lines of contributions that added fewer than 1000 lines
## appends `!!!!!` to lines of contributions that added and substracted fewer than 1000 lines
flagSmallContributions () {
  summaryContributions |
    awk '
      ((5 <= NF) && ($5 < 1000)) { worry=" <----" }
      ((5 <= NF) && ($5 + $7 < 1000)) { worryMore=" !!!!!" }
      { print $0 worry worryMore; worry=""; worryMore="" }'
}

##  source: https://stackoverflow.com/a/23297950
##  `commonSubstring <s> <t>` returns the largest common substring between `<s>` and `<t>`.
commonSubstring () {
  local long short lshort score sub subfound
  if ((${#1}>${#2})); then
     long=$1 short=$2
  else
     long=$2 short=$1
  fi

  lshort=${#short}
  score=0
  for ((i=0;i<lshort-score;++i)); do
     for ((l=score+1;l<=lshort-i;++l)); do
        sub=${short:i:l}
        [[ $long != *$sub* ]] && break
        subfound=$sub score=$l
     done
  done

  if ((score)); then
     echo "$subfound"
  fi
}

## `getLine <i> <file>` prints the `<i>`-th line of `<file>`.
getLine () { awk -v ind="${1}" '(NR == ind) { printf $0 }' "${2}" ; }

wasLiveCode () {
(
  tots=$( wc -l < allAuths )
  for (( fir=1; fir<=${tots}; fir++))
  do
    if ! [[ "${matched[@]}" =~ "${fir}" ]]
    then
      matched+=("${fir}")
      firName="$( getLine "${fir}" allAuths )"
      printf '%s' "${firName}"
      ip=$((fir+1))
      for (( sec=${ip}; sec<=${tots}; sec++))
      do
        cos="$(commonSubstring "${firName}"  "$( getLine "${sec}" allAuths )")"
        if [ ${#cos} -ge 3 ]
        then
          matched+=("${sec}")
          printf ',%s' "$( getLine "${sec}" allAuths )"
        fi
      done
      printf $'\n'
    fi
  done
)
}
