#! /bin/bash

 : <<'Docs'
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

##  This is the file downloaded from Moodle with all the enrolled students.
##  Its 5th entry is the email address.
##  First name and Last name appear consecutively and separated by a comma `,`.
dataFile=end.csv

##  Read the main module file and extract group names/membership from it.
##  Output looks like `project,Name L`
extractProjNames () {
  sed -n '/^table$/, /^\/table$/ {  # process only the lines contained inside `table`-`/table`
    s=^|.\(..*\)=\1,=p              # extract group name
    s= *\* *\([A-Z].*\)=\1=p        # extract members from md lists (some allowed whitespace)
  }' ~/Matematica/Warwick/Syllabus/.src/TPwL_source.md |
    awk -F, '2 <= NF { lab=$1 }
             NF == 1 { print lab "," $0 }'
}

##  `testUniqueNames` may be fully contained in `exportGroups`.
##  It checks that the names mentioned in the Projects page uniquely identify the students and that they exist.
testUniqueNames () {
  local na count err=0
  while read -r na; do
    count="$( grep -c "$na" "${dataFile}" )"
    if [ "${count}" -ne 1 ]; then
      ( brown "$na " ; printf $'occurs %s times\n' "${count}" ; ) >&2
      err=$((err + 1))
    fi
  done < <( extractProjNames | sed 's=^[^,]*,== ; s= =[^,]*,=' ; )
  return "${err}"
}

##  `exportGroups` outputs `email,project` -- the format wanted by Moodle,
##  for the students that are part of a group.
##  `extractUngrouped` deals with the students in the module that are not yet part of a group.
exportGroups () {
  local proj na count err=0
  while IFS="," read -r proj na; do
    count="$( grep -c "$na" "${dataFile}" )"
    if [ "${count}" -ne 1 ]; then
      ( brown "$na " ; printf $'occurs %s times\n' "${count}" ; ) >&2
      err=$((err + 1))
    fi
    printf '%s,%s\n' "$( grep "$na" "${dataFile}" | awk -F, '{ print $5 }')" "${proj}"
  done < <( extractProjNames | sed 's= =[^,]*,=' ; )
  return "${err}"
}

##  `extractUngrouped <file>` complements `exportGroups` by assigning the project `TBD`
##  to all students that are not already in some group.
##  It allows to exclude some non-students who are signed up.
extractUngrouped () {
  local exclusions=',I.Capdeboscq@warwick.ac.uk,D.Testa@warwick.ac.uk,Marc.Truter@Warwick.Ac.Uk,Marc.T.Truter@warwick.ac.uk'
  awk -F, -v emails="$(
    awk -F, 'NR != 1 { printf"," } { printf($1) }' "${1}"
    printf "${exclusions}"
  )" 'BEGIN{ split(emails, emArr, ",") ; for (i in emArr) { dat[emArr[i]]=0 } }
  NR != 1 { if (!($5 in dat)) { print $5 ",TBD" } }' "${dataFile}"
}

##  `generateMoodleGroups` combines the above commands, producing a Moodle-uploadable list:
##  it produces the groups that have already formed, and
##  a single extra group with all the non-assigned students.
generateMoodleGroups () { exportGroups | tee >( extractUngrouped - ) ; }
