#! /bin/bash

# initial merge of the files, probably no longer needed.
mergeFiles () {
  local fil
  for fil in intro.md basicSyntax.md informationExtraction.md ideas_to_develop.md weekly_topics_tbc.md common_symbols.md faq.md; do
    printf $'<!-- newFile %s -->\n' "${fil}"
    cat "${fil}"
  done > source.md
}

awk -v home="${HOME}/${matONo}/Warwick/Syllabus/MA4N1/" 'BEGIN {
  mainFileNoExt="intro"
  mainFile=mainFileNoExt".md"
  ghurl="https://adomani.github.io/Syllabus/MA4N1/" mainFileNoExt
  moodleurl="https://moodle.warwick.ac.uk/course/view.php?id=58287#section-0"
  tpwlink="\n\n[Back to the `Theorem Proving with Lean` webpage](" ghurl ")"
  moodlink="\n\n[Back to Moodle](" moodleurl ")"
}
  /^<!-- newFile [^ ]* -->/  { curr=$3; content[curr]=""; fileNames[$3]++; }
  !/^<!-- newFile [^ ]* -->/ { content[curr]=content[curr] $0"\n" }
 END {
  mainFound=0
  for (fil in content) {  ## fil is the name of the file, content[fil] is its content
    if (fil == mainFile) { mainFound++; lk=""; printf("* "); } else { lk=tpwlink; printf "  "}
    print fil
    path=home fil
    printf("%s\n---%s%s\n", content[fil], lk, moodlink) > path
    close(path)
  }
  if (mainFound != 1) printf("\n** The main file `%s` was not declared! **\n", mainFile)
  for (name in fileNames)
    if (fileNames[name] >= 2) printf("\n** The file `%s` was declared %s times! **\n", name, fileNames[name])
}' ~/Matematica/Warwick/Syllabus/MA4N1/source.md




# * [Current syllabus](https://adomani.github.io/Syllabus/MA4N1)
# * [Basic Lean4 syntax](https://adomani.github.io/Syllabus/MA4N1/basicSyntax)
# * [What tools do I have to tease information out of Lean4?](https://adomani.github.io/Syllabus/MA4N1/informationExtraction)
# * [Stubs of ideas and projects](https://adomani.github.io/Syllabus/MA4N1/ideas_to_develop)
# * [Possible weekly topics &ndash; very preliminary](https://adomani.github.io/Syllabus/MA4N1/weekly_topics_tbc)
# * [Commonly used symbols](https://adomani.github.io/Syllabus/MA4N1/common_symbols)
# * [FAQ](https://adomani.github.io/Syllabus/MA4N1/faq)
