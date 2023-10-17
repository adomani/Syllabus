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
  ptable ~/Matematica/Warwick/Syllabus/.src/TPwL_source.md |
  awk -v home="${HOME}/${matONo}/Warwick/Syllabus/MA4N1/" 'BEGIN {
    mainFileNoExt="toc"
    mainFile=mainFileNoExt".md"
    genericGHurl="https://adomani.github.io/Syllabus/MA4N1/"
    ghurl=genericGHurl mainFileNoExt
    toc="\n\n## Available pages\n\n* [Current syllabus](https://adomani.github.io/Syllabus/MA4N1)"
    moodleurl="https://moodle.warwick.ac.uk/course/view.php?id=58287#section-0"
    tpwlink="\n\n[Back to the `Theorem Proving with Lean` webpage](" ghurl ")"
    moodlink="\n\n[Back to the Mathlib project for the module](https://github.com/adomani/MA4N1_2023)\n\n[Back to Moodle](" moodleurl ")"
  }
    /^<!-- newFile [^ ]* -->/  { curr=$3; content[curr]=""; fileNames[$3]++; con=1; }
    con == 1 && /^##* / { toc=toc sprintf("\n* [%s](%s%s)", $0, genericGHurl, curr) }
    !/^<!-- newFile [^ ]* -->/ { con=0; content[curr]=content[curr] $0"\n" }
   END {
    gsub(/\[##*  */, "[", toc)
    gsub(/\.md)/, ")", toc)
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
