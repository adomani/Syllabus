# MA4N1 Theorem Proving with Lean

| Lectures |           | Room  |-| Support classes |          | Room  |
| :-       | :-:       | -     |-| :-              | :-:      | -     |
| Mondays  | 5pm-6pm   | MS.05 |-| Tuesdays  | 4pm-5pm  | D1.07 |
| Tuesdays | 11am-noon | MS.03 |-|                 |          |       |

##  Assessment

The assessment for the module is 100% coursework, based on group projects.

Two submissions are during Term 1.

The final submission is at the end of January, in Term 2.

All deadlines are on Thursdays at noon of the specified weeks.

| Assessment                                        | Submission type | Deadline       | Weighting |
| -                                                 | :-              | :-             | :-:       |
| Outline of formalization                          | Group           | Week 5         | 10%       |
| Video of personal contribution (up to 4 minutes)  | Individual      | Week 9         | 20%       |
| Final formalization                               | Group           | Term 2, Week 3 | 70%       |

<!-- `echo 'markdown table' | column -s'|' -o'|' -t` -->

You can find some ideas for what might constitute a "toy project" [here](ideas_to_develop).

The Lean 4 project containing the Lean files for the lectures is [here](https://github.com/adomani/MA4N1_Theorem_proving_with_Lean).

---

The module is based on the proof assistant [Lean 4](https://lean-lang.org/).
We will use [Mathlib](https://leanprover-community.github.io/), the mathematical library of Lean 4.

You can find ways to interact with Lean and Mathlib on the [Mathlib webpage](https://leanprover-community.github.io/).

<hr style="border:2px solid gray">

#### Note: `Lean 3` vs `Lean 4`
Lean 4 is the latest version of Lean.

Most online resources use Lean 4.
Very few may still talk about Lean 3.
In this module, we will only work with Lean 4.

---

## Available pages

* [Current syllabus](https://adomani.github.io/Syllabus/MA4N1)
* [MA4N1 Theorem Proving with Lean](https://adomani.github.io/Syllabus/MA4N1/toc#ma4n1-theorem-proving-with-lean)
  * [Assessment](https://adomani.github.io/Syllabus/MA4N1/toc#assessment)
* [Introduction to `Theorem Proving with Lean`](https://adomani.github.io/Syllabus/MA4N1/intro#introduction-to-theorem-proving-with-lean)
* [Initial tactic, brackets and basic logic symbols](https://adomani.github.io/Syllabus/MA4N1/syntaxSummary#initial-tactic,-brackets-and-basic-logic-symbols)
  * [Some tactics](https://adomani.github.io/Syllabus/MA4N1/syntaxSummary#some-tactics)
  * [Brackets](https://adomani.github.io/Syllabus/MA4N1/syntaxSummary#brackets)
* [Commonly used symbols](https://adomani.github.io/Syllabus/MA4N1/syntaxSummary#commonly-used-symbols)
* [Basic Lean4 syntax](https://adomani.github.io/Syllabus/MA4N1/basicSyntax#basic-lean4-syntax)
  * [Text that Lean4 does not parse](https://adomani.github.io/Syllabus/MA4N1/basicSyntax#text-that-lean4-does-not-parse)
  * [Text that Lean4 parses](https://adomani.github.io/Syllabus/MA4N1/basicSyntax#text-that-lean4-parses)
  * [Dot-notation](https://adomani.github.io/Syllabus/MA4N1/basicSyntax#dot-notation)
* [What tools do I have to tease information out of Lean4?](https://adomani.github.io/Syllabus/MA4N1/informationExtraction#what-tools-do-i-have-to-tease-information-out-of-lean4)
  * [Infoview](https://adomani.github.io/Syllabus/MA4N1/informationExtraction#infoview)
  * [Error messages](https://adomani.github.io/Syllabus/MA4N1/informationExtraction#error-messages)
  * [Hover](https://adomani.github.io/Syllabus/MA4N1/informationExtraction#hover)
  * [Go to Definition](https://adomani.github.io/Syllabus/MA4N1/informationExtraction#go-to-definition)
  * [`#check`](https://adomani.github.io/Syllabus/MA4N1/informationExtraction#check)
  * [`#eval`](https://adomani.github.io/Syllabus/MA4N1/informationExtraction#eval)
* [Sample Lean file](https://adomani.github.io/Syllabus/MA4N1/sample_lean_file#sample-lean-file)
* [Projects and stubs of ideas](https://adomani.github.io/Syllabus/MA4N1/ideas_to_develop#projects-and-stubs-of-ideas)
  * [Past projects](https://adomani.github.io/Syllabus/MA4N1/ideas_to_develop#past-projects)
  * [Mathematically oriented projects](https://adomani.github.io/Syllabus/MA4N1/ideas_to_develop#mathematically-oriented-projects)
  * [External repositories and books for inspiration](https://adomani.github.io/Syllabus/MA4N1/ideas_to_develop#external-repositories-and-books-for-inspiration)
  * [Computer science oriented projects](https://adomani.github.io/Syllabus/MA4N1/ideas_to_develop#computer-science-oriented-projects)
  * [Orphaned projects](https://adomani.github.io/Syllabus/MA4N1/ideas_to_develop#orphaned-projects)
* [Creating a new project depending on `Mathlib`](https://adomani.github.io/Syllabus/MA4N1/instructions_for_new_project#creating-a-new-project-depending-on-mathlib)
  * [Using the VSCode `Lean 4` extension](https://adomani.github.io/Syllabus/MA4N1/instructions_for_new_project#using-the-vscode-lean-4-extension)
  * [Unix-based installation from the command-line](https://adomani.github.io/Syllabus/MA4N1/instructions_for_new_project#unix-based-installation-from-the-command-line)
* [Possible weekly topics &ndash; outdated](https://adomani.github.io/Syllabus/MA4N1/weekly_topics_tbc#possible-weekly-topics-&ndash;-outdated)
* [FAQ](https://adomani.github.io/Syllabus/MA4N1/faq#faq)
  * [Asking questions](https://adomani.github.io/Syllabus/MA4N1/faq#asking-questions)
  * [What should I expect during the lectures](https://adomani.github.io/Syllabus/MA4N1/faq#what-should-i-expect-during-the-lectures)
  * [Groups](https://adomani.github.io/Syllabus/MA4N1/faq#groups)
  * [What is a "project"](https://adomani.github.io/Syllabus/MA4N1/faq#what-is-a-project)
  * [When should I figure out what my project is](https://adomani.github.io/Syllabus/MA4N1/faq#when-should-i-figure-out-what-my-project-is)
  * [What happens in support classes](https://adomani.github.io/Syllabus/MA4N1/faq#what-happens-in-support-classes)
  * [What should I write in the outline for the project](https://adomani.github.io/Syllabus/MA4N1/faq#what-should-i-write-in-the-outline-for-the-project)
  * [What is the video presentation](https://adomani.github.io/Syllabus/MA4N1/faq#what-is-the-video-presentation)
  * [What is the project](https://adomani.github.io/Syllabus/MA4N1/faq#what-is-the-project)

---

[Back to the Mathlib project for the module](https://github.com/adomani/MA4N1_Theorem_proving_with_Lean)

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/adomani/MA4N1_Theorem_proving_with_Lean)

[Back to Moodle](https://moodle.warwick.ac.uk/course/view.php?id=71736#section-0)
