#! /bin/bash

##  initial merge of the files, probably no longer needed.
mergeFiles () {
  local fil
  for fil in intro.md basicSyntax.md informationExtraction.md ideas_to_develop.md weekly_topics_tbc.md common_symbols.md faq.md; do
    printf $'<!-- newFile %s -->\n' "${fil}"
    cat "${fil}"
  done > source.md
}

##  `scatterTPwL` reads information from `~/Matematica/Warwick/Syllabus/.src/TPwL_source.md`
##  splits it into files, creates the table of contents and puts them in the `MA4N1/` dir.
scatterTPwL () {
  # read the `ma4n1_id` variable from moving_parts
  local ma4n1_id="$(sed -n 's|^ma4n1_id=\(.*\)|\1|p' .src/moving_parts.txt)"

  ptable ~/Matematica/Warwick/Syllabus/.src/TPwL_source.md |
  awk -v home="${HOME}/${matONo}/Warwick/Syllabus/MA4N1/" -v ma4n1_id="${ma4n1_id}" 'BEGIN {
    mainFileNoExt="toc"
    mainFile=mainFileNoExt".md"
    genericGHurlNS="https://adomani.github.io/Syllabus/MA4N1"
    genericGHurl=genericGHurlNS "/"
    ghurl=genericGHurl mainFileNoExt
    moduleurl="https://github.com/adomani/MA4N1_2023"
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

getcloneProjectsCmds () {
  grep -A1 "·" ~/Matematica/Warwick/Syllabus/.src/TPwL_source.md |
    sed -n 's=.*(https://github.com/\([^)]*\))=git clone git@github.com:\1.git=p'
}

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
