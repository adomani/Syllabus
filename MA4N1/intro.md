# Introduction to `Theorem Proving with Lean`

| Lectures |           | Room  |-| Support classes |     | Room |
| :-       | :-:       | -     |-| :-              | :-: | -    |
| Mondays  | 5pm-6pm   | MS.05 |-| TBA             |     | TBA  |
| Tuesdays | 11am-noon | MS.03 | |                 |     |      |

<!-- `echo 'markdown table' | column -s'|' -o'|' -t` -->

---

## Available pages

* [Current syllabus](https://adomani.github.io/Syllabus/MA4N1)
* [Basic Lean4 syntax](https://adomani.github.io/Syllabus/MA4N1/basicSyntax)
* [What tools do I have to tease information out of Lean4?](https://adomani.github.io/Syllabus/MA4N1/informationExtraction)
* [Stubs of ideas and projects](https://adomani.github.io/Syllabus/MA4N1/ideas_to_develop)
* [Possible weekly topics &ndash; very preliminary](https://adomani.github.io/Syllabus/MA4N1/weekly_topics_tbc)
* [Commonly used symbols](https://adomani.github.io/Syllabus/MA4N1/common_symbols)
* [FAQ](https://adomani.github.io/Syllabus/MA4N1/faq)

---

### Introduction

Since their invention, computers have been used as an aid to performing long and tedious calculations.
Besides basic arithmetic, computers have also been useful in theoretical and applied situations, giving the possibility of "running experiments" to gather evidence (or disprove) conjectures.
More recently, with the rapid development of machine learning and artificial intelligence, they have been used in more "human-like" contexts, such as recognizing handwriting, playing games, driving cars,...

Using computers to help mathematicians prove theorems is older than computers themselves!
The mechanization of thought in general and of mathematics in particular has always attracted a lot of interest.

In this area, it is important to introduce two different but interrelated tools:
* *interactive* theorem provers;
* *automated* theorem provers.

*Interactive* theorem provers provide a mean to verify that a proof is correct, with a substantial amount of human intervention.
The interactive part is represented by the constant guidance that the human provides to the computer.
This is what we will be doing in this module.

*Automated* theorem provers simply take a statement and try to come up with a proof, with no further human interaction.
Even more, you might even hope that they come up with the statement on their own!
This is *not* what this module is about!

Currently, there are very sophisticated and well-developed *interactive* theorem provers.
To some extent, each one of them implements some internal mechanism to take care automatically of trivialities, making them a "hybrid" between an interactive and an automated theorem prover.
However, my personal opinion is that currently proof automation is still in its infancy and still has a lot of room to grow.

### MA4N1 Theorem Proving with Lean

This module focuses on using computers to help mathematicians prove theorems.
The way this is achieved is via a computer program (Lean4, for this specific module) that has a systematic framework for formalizing the foundational rules of mathematics.
Thus, Lean "knows" the basic logical inference rules and has a version of the foundations of mathematics, based on (dependent) Type theory, rather than the more familiar Zermelo-Fraenkel theory.

This is the starting point.
What this module will cover are the basics of Type theory, including propositions, implications, deductions.
We will also see how to work with sets, the natural numbers, induction, groups, rings,...

What this means concretely is that we will learn how to provide the definitions of these mathematical objects to the computer.
We will formulate statements about these definitions and we will make sure that the statements follow from the definitions, using the computer program Lean as a help.

Currently, a good proportion of undergraduate level mathematics has already been formalized and checked by various computer programs.
We will use some of the available formalizations, but will also develop our own.

The module is going to be project-based, in small groups (exact sizes to be determined depending on participation).
The lectures will help with getting started and provide tools for making progress with proving theorems with a computer.
Each group will decide on a result to formalize and will work towards producing their definitions and proving lemmas.

[This link](https://adomani.github.io/Syllabus/MA4N1/ideas_to_develop) contains some sample ideas that could turn into projects.

For more examples, Freek Wiedijk's webpage [Formalizing 100 Theorems](https://www.cs.ru.nl/~freek/100/) has a list of theorems of varying difficulty.

An indispensable prerequisite is the willingness to work using the computer program Lean.
You can use the [online version](https://lean.math.hhu.de/) (or [here](https://leanprover-community.github.io/lean-web-editor/)),
directly from a browser -- no installation required.
While this is possible, it may be hard to develop a long-term project with this version.
The program can be freely installed on your own computer, following [these instructions](https://leanprover-community.github.io/get_started.html).
There are also web-based versions that can be used.

To get a flavour of what the module entails, you can take a look at the [Natural Numbers Game](https://adam.math.hhu.de/#/g/hhu-adam/NNG4).
The link takes you to the Lean4 version.
The original [Natural Numbers Game (Lean 3)](https://www.ma.imperial.ac.uk/~buzzard/xena/natural_number_game/) was developed by Kevin Buzzard and Mohammad Pedramfar.
In fact, you are encouraged to play with it to see if this module might be a good choice for you!

---

[Back to Moodle](https://moodle.warwick.ac.uk/course/view.php?id=58287#section-0)
