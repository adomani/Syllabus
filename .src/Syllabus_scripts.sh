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
  ##  strip out comments from `.src/body_content`
  grep -v "^  *//" body_content | sed 's=  *//.*==g'
  printf $'# %s\n## Autumn %s\n\n<table>\n  <tbody>\n' "${1}" "$( date +"%Y")"
}

alias close_stuff='printf "        </ul>\n      </td>\n    </tr>\n"'

# `page_tail <file>` analogous to `page_head` except that it closes all open tags and
# uses the input file name to make an educated guess of whether to include a link to the
# tentative syllabus or not.
page_tail () {
  close_stuff
  printf $'  </tbody>\n</table>\n<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>\n'
  if [ "${1:6}" ];
  then
    printf $'What we have done so far: [current syllabus](%s)\n' "${1:0:5}"
  else
    printf $'What we may be doing in the coming lectures: [tentative syllabus](%s_tentative)\n' "${1}"
  fi
  echo "<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
<div style=\"text-align: right\">Last modified: $(date +"%A, %b %d %Y")</div>"
}

exweek () {
  ini=($(date -d "Sep 25 2023 +$1 weeks" '+%b %d'))
  fin=($(date -d "Sep 25 2023 +$1 weeks + 4 days" '+%b %d'))
  if [ $ini == $fin ]; then mid=""; else mid="${fin[0]} "; fi
  echo "${ini[0]} ${ini[1]}-$mid${fin[1]}"
}

# `new_week <num> <is_tent>` produces the header for the table entry for week number <num>,
# with a slight difference in html depending on whether
# * it is the entry just after the tentative syllabus begins -- `<is_tent> = true`;
# * it is not the entry just after the tentative syllabus begins -- `<is_tent> = false`.
# The input is which week it is: the html code depends on whether it is the first week or not.
new_week () {
  if [[ "${1}" != 1 ]]; then close_stuff; fi
  if ($2);
  then
    printf $'    <tr><td class="divider"><hr/></td><td class="divider"><hr/></td></tr>\n'
    is_tent=false
  fi
  printf $'<!--  ##################  Week %s  ################## -->
    <tr><th></th><th style=\"text-align: center\">Week %s (%s)</th></tr>\n' "${1}" "${1}" "$( exweek "${1}" )"
}

# `new_day <day> <two_le> <is_tent> <file>` produces the table entries for each <day>,
# with a slight difference in html depending on whether
# * it is the first entry of the current week -- `<two_le> = false`;
# * it is the not the first entry of the current week -- `<two_le> = true`;
# * it is the entry just after the tentative syllabus begins -- `<is_tent> = true`;
# * it is not the entry just after the tentative syllabus begins -- `<is_tent> = false`.
# if <day> receives
# * 'mon,..., sun --> Monday,...,Sunday'
# * 'sup --> newDay\n(support class)' -- for the support class, change the `newDay`!
# * 'week --> TBD' -- for the weeks where the breakdown into days is unclear
# * 'anything_else --> Recorded'
# And then, more html.
new_day () {
  if ($2); then close_stuff; fi
  if ($3);
  then
    printf $'    <tr><td class="divider"><hr/></td><td class="divider"><hr/></td></tr>\n'
    is_tent=false
  fi

  if [ "${1}" == "sup" ]
  then
    local suppDay=TBA
    if [ "${4}" == "MA3H5" ]; then suppDay=Thursday; fi
    if [ "${4}" == "MA4N1" ]; then suppDay=Friday; fi
    printf $'    <tr><td><p style="margin-bottom:0;">%s</p><p style="margin : 0; padding-top:0;">(support class)</p></td>\n' "${suppDay}"
  elif [ "${1}" == "week" ]
  then
    printf $'    <tr><td>TBD</td>\n'
  else
    printf $'    <tr><td>%s</td>\n' "$(date -d $1 +%A 2>&- || echo Recorded)"
  fi
  echo "      <td>
        <ul>"
}

# `to_html_from <file>` converts <file> into a formatted html page.
# The <file> is intended to be the syllabus for a module.
# * Weeks are separated by a line beginning with `--`
#     Note that writing `-- Week i` actually ignores `i`: the number is simply the count of
#     how many `^--` have appeared so far in the file.
# * Lines consisting of exactly one of `pre, mon, tue, .., sun, sup, week`, preceded by any number
#   of spaces, inform the converter of the day in which the lecture took place, or whether
#   the lecture is `pre`-Recorded, a `sup`port class or just a generic `week` entry.
# * Finally, the remaining lines beginning with `  ` (two spaces) are items in a list that
#   correspond to the topics covered on the current day.
to_html_from () {
  nome="${1}.md"     # the name of the file that the program will produce
  echo $nome
  modd="${1:0:5}"    # the module code, as well as the name of the file with the info
  { if [[ "${1:6}" = "tentative" ]]; then tent=" tentative syllabus"; else tent=""; fi;
    case "${modd}" in
      MA3H5)
        page_head "[MA3H5 Manifolds](https://moodle.warwick.ac.uk/course/view.php?id=60813)$tent"
        ;;
      MA3J9)
        page_head "[MA3J9 Historical Challenges in Mathematics](https://moodle.warwick.ac.uk/course/view.php?id=52244)$tent"
        ;;
      MA4N1)
        page_head "[MA4N1 Theorem Proving with Lean](https://adomani.github.io/Syllabus/MA4N1/toc)$tent"
        ;;
      *)
        page_head "${1}"
        ;;
    esac
    wk=0
    con=true
    is_tent=false
    while IFS= read -r line || [ -n "$line" ]; do
      if [[ $line =~ ^-- ]];
      then
        ((wk++))
        con=false
        new_week $wk "$is_tent"
      elif [[ $line =~ ^\ *(pre|mon|tue|wed|thu|fri|sat|sun|sup|week)$ ]]
      then
        new_day "$line" "$con" "$is_tent" "${modd}"
        con=true
      elif [[ $line = "  "* ]]
      then
        echo "          <li>${line:2}</li>"
      elif [[ $line = "_tentative" ]]
      then
        is_tent=true
      fi
    done < <(if [ "$tent" ]; then cat $modd; else sed '/^_tentative/Q' $modd; fi)
    page_tail "${1}" ; } > $nome
}

##  `ptable <file>` parses a file and converts to an HTML table each block beginning with
##  `table` and ending with `/table`.
ptable () {
  awk 'BEGIN{ con=0 }
    /^table$/   { con++; thd="th"; gsub(/.*/, "<table><tbody>"); }
    /^\/table$/ { con=0;           gsub(/.*/, "  </td>\n</tr>\n</tbody></table>"); }
    con == "0" { print }
    con != "0" {
      gsub(/·\|·/, "  </" thd ">\n  <" thd ">")
      gsub(/^\|·/, "<tr>\n  <" thd " align=\"center\">")
      n=gsub(/·\|$/, "  </" thd ">\n</tr>\n")
      if (n != 0) { thd="td" }
      print
    }' "${1}" |
    sed '/<table><tbody>/, /<\/tbody><\/table>/ {         # within the created tables, replace md to html
      s,\[\([^]]*\)\](\([^)]*)*\)),<a href="\2">\1</a>,g  # process the links -- it should match a final `)`
      s=`\([^`]*\)`=<code>\1</code>=g                     # process code
      s|"docs#\([^"]*\)"|"https://leanprover-community.github.io/mathlib4_docs/find/?pattern=\1#doc"|g
      s|"wiki#\([^"]*\)"|"https://en.wikipedia.org/wiki/\1"|g
      s|"zulip#\([^"]*\)"|"https://leanprover.zulipchat.com/#narrow/stream/\1"|g
      s|"mlfile#\([^"]*\)"|"https://leanprover-community.github.io/mathlib4_docs/Mathlib/\1"|g
      s=^\* \(.*\)=    <ul>\n      <li>\1</li>\n    </ul>=
    }' |
    sed "$( htmllify )" |
    sed -z 's=\n    </ul>\n    <ul>\n=\n=g'
}

make_md () {
  here=$PWD
  mypth=$(pwd | sed -E 's=(Syllab[iu][s]?).*=\1/.src/=g')
  cd "$mypth"
  to_html_from "${1}"
  if [ -f "../${1}.md" ]; then
    diffe="$(diff "${1}".md ../"${1}".md | grep -v "Last modified" | grep -vc "^---$")"
    echo "$diffe different lines"
  else
    diffe=2
    brown 'Creating file ' ; printf $'%s\n' "${1}.md"
  fi
  if [ "$diffe" -gt 1 ]
  then
    brown $'muovo\n'
    mv -f "${1}.md" ../"${1}.md"
  else
    brown $'non muovo\n'
    rm -f "${1}.md"
  fi
  cd "$here"
}

alias mani='make_md MA3H5; make_md MA3H5_tentative'
alias hcim='make_md MA3J9; make_md MA3J9_tentative'
alias tpwl='make_md MA4N1; make_md MA4N1_tentative'
alias both="lblue $'Manifolds\n'; mani; lblue $'\nTPwL\n'; tpwl"
