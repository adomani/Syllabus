## Update instructions

These are the instructions to reset the teaching repositories at the start of the year.

Useful commands
* `scatterTPwL` -- reads the file `Syllabus/.src/TPwL_source.md` and splits it up
* `both` -- builds `MA4N1` and `MA3H5` (composed of `mani` and `tpwl`)

---

###  Modifications

* In `.src/moving_parts.txt` update all variables:
  * the term start date to the Monday of the week before the start of term
  * the moodle id for `MA3H5 Manifolds`
  * the moodle id for `MA4N1 Theorem Proving with Lean`
  * the days of the support classes for `MA3H5` and `MA4N1`

* Set the `_tentative` flag in `.src/MAXXX` just *below* the first Monday
  ```bash
  (
    syllabus="$(grep "Syllabus/" ~/Setup/allgits.txt)"
    for fil in ~/"${syllabus}".src/MA*
    do
      sed '/_tentative/d' "${fil}" | sed -z 's=\(\nmon\n\)=\1_tentative\n=1' > "${fil}.tmp"
      mv "${fil}.tmp" "${fil}"
    done
  )
  ```

* In the `MA4N1_Theorem_proving_with_Lean` repo, update the webpage for `MA4N1`
  ```bash
  # changes the `MA4N1` repo -- make sure that the `allgits.txt` file is up to date!
  (
    syllabus="$(grep "Syllabus/" ~/Setup/allgits.txt)"
    ma4n1_repo="$(grep "MA4N1_Theorem_proving_with_Lean/" ~/Setup/allgits.txt)README.md"
    . ~/"${syllabus}".src/moving_parts.txt
    sed -i 's|\(https://moodle.warwick.ac.uk/course/view.php?id=\)[0-9]*|\1'"${ma4n1_id}"'|' ~/"${ma4n1_repo}"
  )
  ```

### I'm feeling lucky

```bash
(
  syllabus="$(grep "Syllabus/" ~/Setup/allgits.txt)"

  # set the `_tentative` flag in `.src/MAXXX` just *below* the first Monday
  for fil in ~/"${syllabus}".src/MA*
  do
    sed '/_tentative/d' "${fil}" | sed -z 's=\(\nmon\n\)=\1_tentative\n=1' > "${fil}.tmp"
    mv "${fil}.tmp" "${fil}"
  done

  # in the `MA4N1_Theorem_proving_with_Lean` repo, update the webpage for `MA4N1`
  ma4n1_repo="$(grep "MA4N1_Theorem_proving_with_Lean/" ~/Setup/allgits.txt)README.md"
  . ~/"${syllabus}".src/moving_parts.txt
  sed -i 's|\(https://moodle.warwick.ac.uk/course/view.php?id=\)[0-9]*|\1'"${ma4n1_id}"'|' ~/"${ma4n1_repo}"
)
```
