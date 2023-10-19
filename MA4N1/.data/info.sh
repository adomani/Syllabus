#! /bin/bash

 : <<Docs
Create a csv-file containing
```
email1@x.com,team1
email2@x.com,team2
...
```
and import the file from
* `Participants`
* `Enrolled Users`
* `Import group members`, selecting
  * `Email address`
  * `Student` (pre-selected)
  * `Yes` -- assign to groups
  * `Use file data` -- Use group
  * `Yes` -- Create groups

Docs

##  Read the main module file and extract group names/membership from it.
extractProjNames () {
  sed -n '/^table$/, /^\/table$/ {   # process only the lines contained inside `table`-`/table`
    s=^|.\(..*\)=\1,=p       #\n\(.*\)=\1=p
  #  s=^[^* ].*==p                    # print a blank line on lines that do not begin with a space or a `*`
    s= *\* *\([A-Z].*\)=\1=p         # print `text` on lines beginning with `* text` (some allowed whitespace)
  }' ~/Matematica/Warwick/Syllabus/.src/TPwL_source.md |
    awk -F, '2 <= NF { lab=$1 }
      NF == 1 { print lab "," $0 }'
# |
#  sed -z '
#    s=^[\n]*==          ## trim beginning line-breaks
#    s=[\n]*$=\n=        ## trim ending line-breaks
#    s=\n\n[\n]*=\n\n=g  ## trim multiple line-breaks into simple separations
#  '
}

testUniqueNames () {
  local na count err=0
  while read -r na; do
    count="$( grep -c "$na" end.csv )"
    if [ "${count}" -ne 1 ]; then
      ( brown "$na " ; printf $'occurs %s times\n' "${count}" ; ) >&2
      err=$((err + 1))
    fi
  done < <( extractProjNames | sed 's=^[^,]*,== ; s= =[^,]*,=' ; echo "Ed" ; echo "Anfi" )
  return "${err}"
}

exportGroups () {
  local proj na count err=0
  while IFS="," read -r proj na; do
    count="$( grep -c "$na" end.csv )"
    if [ "${count}" -ne 1 ]; then
      ( brown "$na " ; printf $'occurs %s times\n' "${count}" ; ) >&2
      err=$((err + 1))
    fi
    printf '%s,%s\n' "$( grep "$na" end.csv | awk -F, '{ print $5 }')" "${proj}"
  done < <( extractProjNames | sed 's= =[^,]*,=' ; ) #echo "pr1,Ed" ; echo "pr2,Anfi" )
  return "${err}"
}

exclusions=',I.Capdeboscq@warwick.ac.uk,D.Testa@warwick.ac.uk,Marc.Truter@Warwick.Ac.Uk,Marc.T.Truter@warwick.ac.uk'

extractUngrouped () {
  awk -F, -v emails="$(
    awk -F, 'NR != 1 { printf"," } { printf($1) }' MA4N1_2023_groups.csv
    printf "${exclusions}"
  )" 'BEGIN{ split(emails, emArr, ",") ; for (i in emArr) { dat[emArr[i]]=0 } }
  NR != 1 { if (!($5 in dat)) { print $5 ",TBD" } }' end.csv
}
