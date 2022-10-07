#  This file converts a template file to a markdown, syllabus page
#  The main function is `produce_html_from`
##  generates the code for using MathJax in the file prova
##  erasing a pre-existing file prova
syll_head () {
  echo '<head>
<script type="text/javascript" id="MathJax-script" async
  src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js">
</script>
<script>
  MathJax = {
    tex: {
      inlineMath: [['\''$'\'', '\''$'\'']]
    }
  };
</script>
</head>

'
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
    elif [[ $1 == "thu" ]]
    then
      echo '      <td>Thursday</td>'
    fi
  fi
  echo '      <td>
        <ul>'
}

produce_html_from () {
  if [[ $1 = "hcim.src" ]]
  then
    nome="MA3J9.md"
    titolo="MA3J9 Historical Challenges in Mathematics"
  elif [[ $1 = "mani.src" ]]
  then
    nome="MA3H5.md"
    titolo="MA3H5 Manifolds"
  else
    echo "Sorry, the only supported files are
mani.src
hcim.src"
    return 1
  fi
  echo $nome
  wk=0
  syll_head "$titolo" > $nome
  while IFS= read -r line; do
    if [[ $line =~ ^[--] ]];
    then
      ((wk++))
      week_head $wk >> $nome
    elif [[ $line =~ ^[mpt] ]]
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
