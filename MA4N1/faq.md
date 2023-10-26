#  FAQ

##  Asking questions

The [Mathlib Zulip chat](https://leanprover.zulipchat.com/) is an excellent place to ask questions about formalization of mathematics in Lean.
There is a very clear explanation of what constitutes a "good question".
This is the notion of a [minimal working example](https://leanprover-community.github.io/mwe.html), or [#mwe](https://leanprover-community.github.io/mwe.html), for short.

This is a very effective way of getting answers.
Please read the text at link above.
Formalizing mathematics is very explicit about making everything very precise.
The same precision is expected for questions!
The more you can isolate what your issue is and the more you provide all the surrounding context, the easier it will be to address your specific issue and get on with your project!

Please, take [#mwe](https://leanprover-community.github.io/mwe.html)s seriously!

Also, feel free to use the [Zulip chat](https://leanprover.zulipchat.com/) mentioned above.

##  What should I expect during the lectures

I am planning to use the 2 hours of lecture each week to
* show some interactive coding,
* highlight a variety of areas of maths,
* give some details of their current formalization in `Mathlib` (the mathematical library of `Lean`).

I am also planning to go over some project ideas and, based on the chosen project, adapt the content of the subsequent lectures.
This will make the content of the lectures more relevant to the actual projects.

##  Groups

I will try to have as little say as possible in the formation of groups.
I think that it is important that students who want to formalize the same result will naturally merge in a group.
What I am going to try to limit is the size of each group.
Ideally, groups should not contain more than 4-5 students.
At the same time, I can realistically support up to roughly 10 groups.
Of course, these two constraints may not be realisable simultaneously, but we will see how to adapt, if the need arises!

##  What is a "project"

A project is a target theorem that you want to formalise &ndash; most of the times!
The theorem could be some result from your lectures, from your second/third year essay, some fact that you like.
In some cases, even simply reaching the stage where you can *state* a formal version of a theorem is a great achievement!
Alternatives to theorems are possible: for instance, formalising a counterexample,
or writing a tactic (i.e. some meta-programming), are options as well.

Also, formalisation of a target theorem may certainly fall short of an actual full formalisation!
When formalising, it is *very* easy to over-estimate what you can achieve.
There is no problem in being ambitious in your choice, but do not stress out if you end up taking just a small step
towards your goal!

##  When should I figure out what my project is

Ideally, most students to be part of a group with a specific project relatively early, by Week 2 or 3.
The initial project may change scope, becoming more specific, if the initial plan was too ambitious,
or expand if the initial idea was easily achieved.

##  What happens in support classes

The support classes are probably going to be "coding sessions".
You should all interact and try to solve problems together.
The TA may not have expertise in Lean or formalisation (almost no one in the department currently has formalisation experience),
but will try to coordinate discussions, focus problems and also report back to me unanswered issues.

I will try to be virtually reachable during the support classes, though this depends on their actual timing.

Depending on how the lectures and projects proceed, I may suggest some targeted exercises for the support classes,
but I expect this to be less and less relevant, once the term progresses and you focus on your project.

I view the support classes as group learning and brainstorming sessions.

##  What should I write in the outline for the project

The outline is a written text that you upload to Moodle as a group (i.e. one submission per group).
I expect its length to be roughly 1-2 pages.
You can choose which format you prefer,
but producing a .pdf file using LaTeX is probably what is more flexible for writing formulas.

There are no set rules on the content,
but the outline should give me a clear idea of
* what the project is about,
* how you intend to formalise it,
* how you imagine that you will distribute the work among group members.

Possibly you may also want to comment on how much of what is already in `Mathlib` you expect to use.

Here is an itemised list of some questions that you may want to address in the outline.

* Explain what result you want to formalize.
  If it is a theorem, explain what proof you intend to formalise,
  either by writing it down or by referring to a resource that contains a detailed proof.
* Be fairly explicit about the first steps.
  Being more explicit, means committing in writing to what you intend to do,
  but does *not* mean that you will be expected to follow these steps literally.
  What you mention in the outline can be changed as you make progress and realise what is realistic and what is not.
* If you have already tried something and it failed or worked, mention successes/failures!
* If your result is already contained in `Mathlib` (I try to help with this, so do ask!),
  then think about where you want your formalisation to start.
  A good way of making this concrete is to give an estimate of what `Mathlib` files you want to import for your project.

  Keep in mind that `import Mathlib.Tactic` is already a fairly "large" import,
  so you may want to use smaller imports for your project.
* A rough splitting of the formalisation effort among group members.
  In particular, try to explain what are subproblems that you can work on independently,
  so that all group members can, potentially, be working on the project simultaneously
  without duplicating effort.

Finally, the outline is meant to be a plan of what you think that the project will look like **at the time of writing**.
In fact, the outline is marked shortly after you hand it in, and definitely *much earlier* than when you submit your final project.
If the actual development of the project requires major revisions of the outline,
that is neither a problem, nor something that will affect your final evaluation!

---

[Back to the `Theorem Proving with Lean` webpage](https://adomani.github.io/Syllabus/MA4N1/toc)

[Back to the Mathlib project for the module](https://github.com/adomani/MA4N1_2023)

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/adomani/MA4N1_2023)

[Back to Moodle](https://moodle.warwick.ac.uk/course/view.php?id=58287#section-0)
