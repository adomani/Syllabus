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


# MA3J9 Historical Challenges in Mathematics
##  Autumn 2022

<table>
  <tbody>'
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
  elif [[ $1 == "tue" ]]
  then
    echo '        </ul>
      </td>
    </tr>
    <tr>
      <td>Tuesday</td>'
  elif [[ $1 == "thu" ]]
  then
    echo '        </ul>
      </td>
    </tr>
    <tr>
      <td>Thursday</td>'
  fi
  echo '      <td>
        <ul>'
}

table_entries () {
  echo "          <li>$1</li>"
}

produce_html_from () {
  wk=0
  syll_head > prova.md
  while IFS= read -r line; do
    if [[ $line == "--" ]];
    then
      ((wk++))
      week_head $wk >> prova.md
    elif [[ $line =~ ^[pt] ]]
    then
      echo $line
      day_entries "$line" >> prova.md
    else
      table_entries "$line" >> prova.md
    fi
  done < syll.src
  syll_tail >> prova.md
}

# MA3J9 Historical Challenges in Mathematics
##  Autumn 2022

<table>
  <tbody>


wk=0
while IFS= read -r line; do
  if [[ $line == "--" ]];
  then
    ((wk++))
    echo $wk
  fi
done < syll.src
