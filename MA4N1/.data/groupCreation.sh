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

##  Use `extractHeaders` from `awkStuff.sh`
. ~/Setup/awkStuff.sh

dataFile='Matematica/Warwick/Syllabus/MA4N1/.data/end.csv'
inactiveFile='Matematica/Warwick/Syllabus/MA4N1/.data/inactive.csv'
guests='Damiano,Marc Truter,Inna'

ma4n1_id="$(sed -n 's|^ma4n1_id=\(.*\)|\1|p' .src/moving_parts.txt)"

brown $'From the participants list on Moodle ('
  printf 'https://moodle.warwick.ac.uk/user/index.php?id=%s' "${ma4n1_id}"
brown $')
* select them all
* download to'
  printf ' %s' "${dataFile}"
brown $'
* also download all `inactive` students to'
  printf ' %s' "${inactiveFile}"
brown $'
* make sure that
  * there are consecutive `First,Last name` fields
  * the 5th field contains the email addresses
'
[ ! -f ~/"${inactiveFile}" ] &&
  { lcyan $'Inactive file' ; printf ' %s ' ~/"${inactiveFile}" ; lcyan $'not found.\n' ; }

##  This is the file downloaded from Moodle with all the enrolled students.
##  Its 5th entry is the email address.
##  First name and Last name appear consecutively and separated by a comma `,`.
extractHeaders 'First,Last,Email' ~/"${dataFile}" > /dev/null
if [ "$( awk -F, '(2 <= NR) && !($5 ~ /@/) { print }' ~/"${dataFile}" )" != "" ]; then
  lcyan $'Does the 5th column of the file' ; printf ' %s ' ~/"${dataFile}"
  lcyan $'contain the email address?\n'
fi

##  Read the main module file and extract group names/membership from it.
##  Also create a group from the file `inactive.csv`, if one is present.
##  Output looks like `project,Name L`
extractProjNames () {
  { printf "Guest,\n${guests//,/\\n}\n";
    sed -n '/^table$/, /^\/table$/ {  # process only the lines contained inside `table`-`/table`
      s=^|.\(..*\)=\1,=p              # extract group name
      s= *\* *\([A-Z].*\)=\1=p        # extract members from md lists (some allowed whitespace)
    }' ~/Matematica/Warwick/Syllabus/.src/TPwL_source.md
  } |
    awk -F, '2 <= NF { lab=$1 }
             NF == 1 { print lab "," $0 }'
  if [ -f ~/"${inactiveFile}" ]; then
    extractHeaders 'First,Last,Email' ~/"${inactiveFile}" | sed 's=,= = ; s=,.*== ; s=^=Inactive,='
  else
    >&2 brown $'Inactive file' ; printf ' %s ' ~/"${inactiveFile}" ; brown $'not found.\n'
  fi
}

##  `exportGroups` outputs `email,project` -- the format wanted by Moodle,
##  for the students that are part of a group.
##  `extractUngrouped` deals with the students in the module that are not yet part of a group.
exportGroups () {
  local proj na count err=0
  while IFS="," read -r proj na; do
    count="$( grep -c "$na" ~/"${dataFile}" )"
    if [ "${count}" -ne 1 ]; then
      ( brown "$na " ; printf $'occurs %s times\n' "${count}" ; ) >&2
      err=$((err + 1))
    fi
    printf '%s,%s\n' "$( grep "$na" ~/"${dataFile}" | awk -F, '{ print $5 }')" "${proj}"
  done < <( extractProjNames | sed 's= =[^,]*,=' ; )
  return "${err}"
}

##  `extractUngrouped <file>` complements `exportGroups` by assigning the project `TBD`
##  to all students that are not already in some group.
##  It allows to exclude some non-students who are signed up.
extractUngrouped () {
  awk -F, -v emails="$(
    awk -F, 'NR != 1 { printf"," } { printf($1) }' "${1}"
  )" 'BEGIN{ split(emails, emArr, ",") ; for (i in emArr) { dat[emArr[i]]=0 } }
  NR != 1 { if (!($5 in dat)) { print $5 ",TBD" } }' ~/"${dataFile}"
}

##  `generateMoodleGroups` combines the above commands, producing a Moodle-uploadable list:
##  it produces the groups that have already formed, and
##  a single extra group with all the non-assigned students.
generateMoodleGroups () { exportGroups | tee >( extractUngrouped - ) | sort -t, -k2 ; }

##  on-screen printing of the output of `generateMoodleGroups`
viewGroups () { generateMoodleGroups | column -s, -t ; }
tallyGroups () {
  generateMoodleGroups |
    awk -F, '{ tally[$2]++ } END{ for (gp in tally) { printf("%s (%s)\n", gp, tally[gp]) } }' | sort
}

##  `testUniqueNames` may be fully contained in `exportGroups`.
##  It checks that the names mentioned in the Projects page uniquely identify the students and that they exist.
testUniqueNames () {
  local na count err=0
  while read -r na; do
    count="$( grep -c "$na" ~/"${dataFile}" )"
    if [ "${count}" -ne 1 ]; then
      ( brown "$na " ; printf $'occurs %s times\n' "${count}" ; ) >&2
      err=$((err + 1))
    fi
  done < <( extractProjNames | sed 's=^[^,]*,== ; s= =[^,]*,=' ; )
  return "${err}"
}
