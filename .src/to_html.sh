#############################################################################################
#############################################################################################
######  This file converts a template file to a markdown, syllabus page                ######
######  The main function is `to_html_from <file>`                                ######
######  The generated file overwrites a possibly pre-existing one with the same name.  ######
######  This is all good, as long as the previous file was also auto-generated...      ######
#############################################################################################
#############################################################################################

# `syll_head <mytitle>` creates the "head" (really it will be at the beginning of the <body>)
# for the syllabus.  The function reads the content of the file `.body_content`, to use MathJax
# and reload the page.
# After that, it adds the user input <mytitle>, for instance `MA3J9`, the date and some html.
syll_head () {
  cat .body_content | grep -v "^  *//" | sed 's=  *//.*==g'
  echo "# $1
## Autumn 2022

<table>
  <tbody>"
}

# `syll_tail` analogous to `syll_head` except that it simply closes all open tags, taking no input.
syll_tail () {
  echo "        </ul>
      </td>
    </tr>
  </tbody>
</table>"
}

# `week_head <num>` produces the header for the table entry for week number <num>.
# The input is which week it is: the html code depends on whether it is the first week or not.
week_head () {
  if [[ $1 != 1 ]];
  then
    echo "        </ul>
      </td>
    </tr>"
  fi
  echo "<"\!"--  ##################  Week $1  ################## -->
    <tr><th></th><th align="center">Week $1</th></tr><tr>"
}

# `day_entries <day>` produces the table entries for each <day>.
# <day> could be either `pre`, meaning Recorded content, or
# it could be `mon, tue,...`, meaning the obvious day of the week.
# If the input is an actual day, `date ...` converts it to full format, e.g. `fri --> Friday`.
# And them more html.
day_entries () {
  if [[ $1 == "pre" ]]
  then
    echo '      <td>Recorded</td>'
  else
    echo '        </ul>
      </td>
    </tr>
    <tr>'
    echo "      <td>$(date -d "$1" +%A)</td>"
  fi
  echo '      <td>
        <ul>'
}

# `to_html_from <file>` converts <file> into a formatted html page.
# The <file> is intended to be the syllabus for a module.
# * Weeks are separated by a line beginning with `--`
#     Note that writing `-- Week i` actually ignores `i`: the number is simply the count of
#     how many `^--` have appeared so far in the file.
# * Lines beginning with `pre, mon, tue, .., sun` inform the converter of whether the lecture
#   is "Recorded" or of in what day it took place.
# * Finally, lines beginning with `  ` (two spaces) are items in a list that correspond to the
#   topics covered on the current day.
to_html_from () {
  nome="$1.md"
  if [[ ${1:0:5} = "MA3H5" ]];
  then
    titolo="[MA3H5 Manifolds](https://moodle.warwick.ac.uk/course/view.php?id=52238) ${1:6} syllabus"
  elif [[ ${1:0:5} = "MA3J9" ]];
  then
    titolo="[MA3J9 Historical Challenges in Mathematics](https://moodle.warwick.ac.uk/course/view.php?id=52244) ${1:6} syllabus"
  else
    titolo="$1"
  fi
  echo $nome
  wk=0
  syll_head "$titolo" > $nome
  while IFS= read -r line; do
    if [[ $line =~ ^[--] ]];
    then
      ((wk++))
      week_head $wk >> $nome
    elif [[ $line =~ ^[pmtwf] ]]
    then
      day_entries "$line" >> $nome
    elif [[ $line = "  "* ]]
    then
      echo "          <li>${line:2}</li>" >> $nome
    fi
  done < $1
  syll_tail >> $nome
}

# `cosyl <file>` converts a file to html using `to_html_from <file>` and then
# committing the generated .md file to the GitHub repository.
# This could maybe be a GitHub action?
cosyl () {
  to_html_from $1 &&
    git add -A &&
    git commit -m "$1" &&
    git push
}

for fil in MA3H5 MA3J9 MA3H5_tentative MA3J9_tentative to_html.sh
do
#  nome="$nom.md"
#  fin=${nom:6}
#  if [[ ${nom:0:5} = "MA3H5" ]];
#  then
#    titolo="[MA3H5 Manifolds](https://moodle.warwick.ac.uk/course/view.php?id=52238) $fin syllabus"
#  elif [[ ${nom:0:5} = "MA3J9" ]];
#  then
#    titolo="[MA3J9 Historical Challenges in Mathematics](https://moodle.warwick.ac.uk/course/view.php?id=52244) $fin syllabus"
#  else
#    titolo="$nom"
#  fi
#  echo "$nome è il nome"
#  echo "$titolo è il titolo"
#    ##$(echo "$fil" | sed 's/\.src$/\.md/g')
  camb=$(git diff --name-only origin/master $fil | wc -w)
  if [[ $camb != 0 ]];
  then
    echo "$fil è cambiato"
  else
    echo "$fil non è cambiato"
#    to_html_from $fil
#
#    echo "** $fil è diverso"
##  else
##    echo "-- $fil non è cambiato"
  fi
done

