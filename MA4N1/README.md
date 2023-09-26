# Introduction to formalizing mathematics using Lean

---

## Available pages

* [Current syllabus](https://adomani.github.io/Syllabus/MA4N1)
* [Basic Lean4 syntax](https://adomani.github.io/Syllabus/MA4N1/basicSyntax)
* [What tools do I have to tease information out of Lean4?](https://adomani.github.io/Syllabus/MA4N1/informationExtraction)
* [Stubs of ideas and projects](https://adomani.github.io/Syllabus/MA4N1/ideas_to_develop)
* [Possible weekly topics &ndash; very unstable](https://adomani.github.io/Syllabus/MA4N1/weekly_topics_tbc)

---

Since their invention, computers have been used as an aid to performing long and tedious calculations.
Besides basic arithmetic, computers have also been useful in theoretical and applied situations, giving the possibility of "running experiments" to gather evidence (or disprove) conjectures.
More recently, with the rapid development of machine learning and artificial intelligence, they have been used in more abstract contexts as well, such as recognizing handwriting, playing games, driving cars,...

This module will focus on using computers to help mathematicians prove theorems.
The way this is achieved is via a computer program (Lean 3, for this specific module) that has a systematic framework for formalizing the foundational rules of mathematics.
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

[This link](https://adomani.github.io/Syllabus/ideas_to_develop) contains some sample ideas that could turn into projects.

For more examples, Freek Wiedijk's webpage [Formalizing 100 Theorems](https://www.cs.ru.nl/~freek/100/) has a list of theorems of varying difficulty.

An indispensable prerequisite is the willingness to work using the computer program Lean.
You can use the [online version](https://lean.math.hhu.de/) (or [here](https://leanprover-community.github.io/lean-web-editor/)),
directly from a browser -- no installation required.
While this is possible, it may be hard to develop a long-term project with this version.
The program can be freely installed on your own computer, following [these instructions](https://leanprover-community.github.io/get_started.html).
There are also web-based versions that can be used.

To get a flavour of what the module entails, you can take a look at the [Natural Numbers Game](https://adam.math.hhu.de/#/g/hhu-adam/NNG4).
The link takes you to the Lean 4 version.
The original [Natural Numbers Game (Lean 3)](https://www.ma.imperial.ac.uk/~buzzard/xena/natural_number_game/) was developed by Kevin Buzzard and Mohammad Pedramfar.
In fact, you are encouraged to play with it to see if this module might be a good choice for you!

[Back to Moodle](https://moodle.warwick.ac.uk/course/view.php?id=58287#section-0)
