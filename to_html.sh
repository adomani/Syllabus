#  This file converts a template file to a markdown, syllabus page
#  The main function is `produce_html_from`
##  generates the code for using MathJax in the file prova
##  erasing a pre-existing file prova
syll_head () {
  cat .body_content | grep -v "^  *//" | sed 's=  *//.*==g'
  echo "# $1
## Autumn 2022

<table>
  <tbody>"
}

syll_tail () {
  echo "        </ul>
      </td>
    </tr>
  </tbody>
</table>"
}

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

day_entries () {
  if [[ $1 == "pre" ]]
  then
    echo '      <td>Recorded</td>'
  else
    echo '        </ul>
      </td>
    </tr>
    <tr>'
    if [[ $1 == "mon" ]]
    then
      echo '      <td>Monday</td>'
    elif [[ $1 == "tue" ]]
    then
      echo '      <td>Tuesday</td>'
    elif [[ $1 == "wed" ]]
    then
      echo '      <td>Wednesday</td>'
    elif [[ $1 == "thu" ]]
    then
      echo '      <td>Thursday</td>'
    elif [[ $1 == "fri" ]]
    then
      echo '      <td>Friday</td>'
    fi
  fi
  echo '      <td>
        <ul>'
}

produce_html_from () {
  if [[ $1 = "hcim.src" ]]
  then
    nome="MA3J9.md"
    titolo="[MA3J9 Historical Challenges in Mathematics](https://moodle.warwick.ac.uk/course/view.php?id=52244)"
  elif [[ $1 = "mani.src" ]]
  then
    nome="MA3H5.md"
    titolo="[MA3H5 Manifolds](https://moodle.warwick.ac.uk/course/view.php?id=52238)"
  else
    nome=$(echo $1 | sed 's/\....//g')".md"
    titolo="Tentative Syllabus"
##     echo "Sorry, the only supported files are
## mani.src
## hcim.src"
##     return 1
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
    elif [[ $line = " "* ]]
    then
      echo "          <li>$line</li>" >> $nome
    fi
  done < $1
  syll_tail >> $nome
}

cosyl () {
  produce_html_from $1 &&
    git add -A &&
    git commit -m "$1" &&
    git push
}
