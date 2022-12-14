#############################################################################################
#############################################################################################
######  This file converts a template file to a markdown, syllabus page                ######
######  The main function is `to_html_from <file>`                                     ######
######  The generated file overwrites a possibly pre-existing one with the same name.  ######
######  This is all good, as long as the previous file was also auto-generated...      ######
#############################################################################################
#############################################################################################

# `page_head <mytitle>` creates the "head" (really it will be at the beginning of the <body>)
# for the syllabus.  The function reads the content of the file `.src/body_content`,
# to use MathJax and reload the page.
# After that, it adds the user input <mytitle>, for instance `MA3J9`, the date and some html.
page_head () {
  grep -v "^  *//" body_content | sed 's=  *//.*==g'
  printf "# $1\n## Autumn 2022\n\n<table>\n  <tbody>\n"
}

alias close_stuff='printf "        </ul>\n      </td>\n    </tr>\n"'

# `page_tail <file>` analogous to `page_head` except that it closes all open tags and
# uses the input file name to make an educated guess of whether to include a link to the
# tentative syllabus or not.
page_tail () {
  close_stuff
  printf "  </tbody>\n</table>\n<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>\n"
  if [ "${1:6}" ];
  then
    echo "What we have done so far: [current syllabus](${1:0:5})"
  else
    echo "What we may be doing in the coming lectures: [tentative syllabus]($1_tentative)"
  fi
  echo "<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
<div style=\"text-align: right\">Last modified: $(date +"%A, %b %d %Y")</div>"
}

exweek () {
  ini=($(date -d "Sep 26 2022 +$1 weeks" '+%b %d'))
  fin=($(date -d "Sep 26 2022 +$1 weeks + 4 days" '+%b %d'))
  if [ $ini == $fin ]; then mid=""; else mid="${fin[0]} "; fi
  echo "${ini[0]} ${ini[1]}-$mid${fin[1]}"
}

# `new_week <num> <is_tent>` produces the header for the table entry for week number <num>,
# with a slight difference in html depending on whether
# * it is the entry just after the tentative syllabus begins -- `<is_tent> = true`;
# * it is not the entry just after the tentative syllabus begins -- `<is_tent> = false`.
# The input is which week it is: the html code depends on whether it is the first week or not.
new_week () {
  if [[ $1 != 1 ]]; then close_stuff; fi
  if ($2);
  then
    echo "    <tr><td class="divider"><hr/></td><td class="divider"><hr/></td></tr>"
    is_tent=false
  fi
  echo "<!--  ##################  Week $1  ################## -->
    <tr><th></th><th style=\"text-align: center\">Week $1 ($(exweek $1))</th></tr>"
}

# `new_day <day> <two_le> <is_tent>` produces the table entries for each <day>,
# with a slight difference in html depending on whether
# * it is the first entry of the current week -- `<two_le> = false`;
# * it is the not the first entry of the current week -- `<two_le> = true`;
# * it is the entry just after the tentative syllabus begins -- `<is_tent> = true`;
# * it is not the entry just after the tentative syllabus begins -- `<is_tent> = false`.
# <day> is parsed as 'mon,..., sun --> Monday,...,Sunday' (except for Friday,
# which also produces a line with "(support class)") and 'anything_else --> Recorded'.
# And then, more html.
new_day () {
  if ($2); then close_stuff; fi
  if ($3);
  then
    echo "    <tr><td class="divider"><hr/></td><td class="divider"><hr/></td></tr>"
    is_tent=false
  fi

  if [ $1 == "fri" ]
  then
    echo '    <tr><td><p style="margin-bottom:0;">Friday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>'
  else
    echo "    <tr><td>$(date -d $1 +%A 2>&- || echo Recorded)</td>"
  fi
  echo "      <td>
        <ul>"
}

# `to_html_from <file>` converts <file> into a formatted html page.
# The <file> is intended to be the syllabus for a module.
# * Weeks are separated by a line beginning with `--`
#     Note that writing `-- Week i` actually ignores `i`: the number is simply the count of
#     how many `^--` have appeared so far in the file.
# * Lines consisting of exactly one of `mon, tue, .., sun, pre`, preceded by any number
#   of spaces, inform the converter of the day in which the lecture took place, or whether
#   the lecture is "Recorded".
# * Finally, the remaining lines beginning with `  ` (two spaces) are items in a list that
#   correspond to the topics covered on the current day.
to_html_from () {
  nome="$1.md"           # the name of the file that the program will produce
  modd="${1:0:5}"        # the module code, as well as the name of the file with the info
  if [[ ${1:6} = "tentative" ]]; then tent=" tentative syllabus"; else tent=""; fi;
  if [[ $modd = "MA3H5" ]];
  then
    page_head "[MA3H5 Manifolds](https://moodle.warwick.ac.uk/course/view.php?id=52238)$tent"
  elif [[ $modd = "MA3J9" ]];
  then
    page_head "[MA3J9 Historical Challenges in Mathematics](https://moodle.warwick.ac.uk/course/view.php?id=52244)$tent"
  else
    page_head "$1"
  fi > $nome
  echo $nome
  wk=0
  con=true
  is_tent=false
  while IFS= read -r line || [ -n "$line" ]; do
    if [[ $line =~ ^-- ]];
    then
      ((wk++))
      con=false
      new_week $wk "$is_tent" >> $nome
    elif [[ $line =~ ^\ *(pre|mon|tue|wed|thu|fri|sat|sun)$ ]]
    then
      new_day "$line" "$con" "$is_tent" >> $nome
      con=true
    elif [[ $line = "  "* ]]
    then
      echo "          <li>${line:2}</li>" >> $nome
    elif [[ $line = "_tentative" ]]
    then
      is_tent=true
    fi
  done < <(if [ "$tent" ]; then cat $modd; else sed '/^_tentative/Q' $modd; fi)
  page_tail $1 >> $nome
}

make_md () {
  here=$PWD
  mypth=$(pwd | sed -E 's=(Syllab[iu][s]?).*=\1/.src/=g')
  cd "$mypth"
  to_html_from $1
  diffe="$(diff $1.md ../$1.md | grep -v "Last modified" | grep -vc "^---$")"
  echo "$diffe different lines"
  if [ "$diffe" -gt 1 ]
  then
    brown "muovo\n"
    mv -f "$1.md" ../"$1.md"
  else
    brown "non muovo\n"
    rm -f "$1.md"
  fi
  cd "$here"
}

alias mani='make_md MA3H5; make_md MA3H5_tentative'
alias hcim='make_md MA3J9; make_md MA3J9_tentative'
alias both='lblue "Manifolds\n"; mani; lblue "\nHCiM\n"; hcim'
