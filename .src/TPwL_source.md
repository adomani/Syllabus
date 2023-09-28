<!-- newFile toc.md -->
# MA4N1 Theorem Proving with Lean

| Lectures |           | Room  |-| Support classes |     | Room |
| :-       | :-:       | -     |-| :-              | :-: | -    |
| Mondays  | 5pm-6pm   | MS.05 |-| TBA             |     | TBA  |
| Tuesdays | 11am-noon | MS.03 | |                 |     |      |

##  Assessment

The assessment for the module is 100% coursework, based on group projects.

Two submissions are during Term 1.

The final submission is at the end of January, in Term 2.

| Assessment                                        | Submission type | Deadline       |
| -                                                 | :-              | -              |
| Outline of formalization                          | Group           | Week 4         |
| Video of personal contribution (up to 4 minutes)  | Individual      | Week 8         |
| Final formalization                               | Group           | Term 2, Week 3 |

<!-- `echo 'markdown table' | column -s'|' -o'|' -t` -->

You can find some ideas for what might constitute a "toy project" [here](MA4N1/ideas_to_develop).

The module is based on the proof assistant [Lean 4](https://lean-lang.org/).
We will use [Mathlib](https://leanprover-community.github.io/), the mathematical library of Lean 4.

You can find ways to interact with Lean and Mathlib on the [Mathlib webpage](https://leanprover-community.github.io/).

#### Note: `Lean 3` vs `Lean 4`
Lean 4 is the latest version of Lean.
Switching from Lean 3 to Lean 4 means rewriting all the code, all the supporting information and all the webpages.
This process is completed for `Mathlib`, however there are still online resources that talk about Lean and mean Lean 3.
In this module, we will only work with Lean 4.
<!-- newFile intro.md -->
# Introduction to `Theorem Proving with Lean`

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
<!-- newFile basicSyntax.md -->
# Basic Lean4 syntax

This page contains generic information about basic Lean4 syntax.
It is intended as a very quick introduction, just to get you started.
It is in no way meant to be comprehensive, but is mostly so that you can follow along some of the code.
In my opinion, the best way to learn is to play yourself with the code, modify it, stretch it to its limits, try to make it do weird things!

## Text that Lean4 does not parse

* Single comments, beginning with `--` and ending at the following line break.

  ```lean
  -- I am a comment
  ```

* Comment blocks, beginning with `/-` and ending with `-/`, possibly spanning several lines.

  ```lean
  /-
  I am a longer comment.
  I may span multiple lines.
  -/
  ```

* Doc-strings, beginning with `/--` and ending with `-/`, possibly spanning several lines.
  They produce "hover information" about the declaration that follows them.

  ```lean
  /-- I usually say something meaningful about the function that follows me.
  I appear when you hover over the definition that follows me. -/
  ```

* Doc-modules, beginning with `/-!` and ending with `-/`, possibly spanning several lines.
  For the purpose of this repository, they behave just like comments.
  In more automated projects, such as `mathlib`, doc-module strings appear in the autogenerated documentation pages, while regular comments do not.

  ```lean
  /-! I usually say something meaningful about the overall structure or declarations in a file.
  I do not appear on hover and I am essentially indistinguishable from a comment in this repository. -/
  ```

## Text that Lean4 parses

* The bulk of each file consists of definitions.

  ```lean
  def myFn <inputs> : <target> := <whatTheFunctionDoes>
  ```

* Usually once per file, you will find `namespace <name>` (and `<name>` is often `Day<number>`, though `List`, `String` and `Array` are also common).
  This indicates that if the remaining code defines a function `myFn`, then its actual full name is `Day<number>.myFn`.
  Within the `namespace`, you can simply call `myFn` and Lean4 will add `Day<number>.` for you automatically (unless, of course, there is some ambiguity that it cannot resolve).
  `namespace <name>` ends with the line `end <name>` or with the end of the file.

* The command `open <name>` means that you can refer to `<name>.myFn` simply as `myFn`, even if you are not within `namespace <name>`.

  Thus, in the following code, the second `def fn` defines `fn`.
  Note that, if the first `fn` had not been inside a namespace, then there would have been a clash of names and Lean4 would have complained.

  ```lean
  namespace myName

  /-- I describe `myName.fn`. -/
  def fn := 0
  -- this definition really created `myName.fn`

  end myName

  /-- I describe `fn`. -/
  def fn := 1
  -- this definition created `fn`, without namespace

  #eval fn  -- 1

  open myName

  /-
  #eval fn
  causes an error, since Lean4 cannot know whether we mean `myName.fn` or `fn` with no namespace.
  We disambiguate this as follows.
  -/

  -- if you hover over `myName.fn`, you will see "I describe `myName.fn`."
  #eval myName.fn -- 0

  -- if you hover over `_root_.fn`, you will see "I describe `fn`."
  #eval _root_.fn -- 1
  /- `_root_.` is a way of letting Lean4 know that what follows is the full name,
  even if we are inside a `namespace`-block. -/
  ```
* `set_option profiler true` instructing Lean4 to provide some further information, usually in the form of evaluation time of declarations, `#eval`s,...

## Dot-notation

As we have seen, namespaces allow us to "repeat" names of declarations.
They also allow us to organize names into common groups, by naming similar definitions in the same namespace.

An interesting feature of namespaces is what is called "dot-notation".
Let us begin with an example.

Suppose that we define a function `List.twice` as follows.

```lean
def List.twice (L : List Nat) : List Nat := L ++ L

#eval List.twice [1,2,3] -- [1,2,3,1,2,3]
```

Thus, `List.twice L` creates a list twice as long as `L` consisting of two copies of `L`, one after the other.
Observe that there is a coincidence: the *Type* of `L` is `List ...` and the *name* of the declaration is `List.[...]`.
In this situation, we can replace the *namespace* `List` with the term `L` and obtain that `List.twice L = L.twice`.
Of course, this trick cannot work always: there is the need of the coincidence of an argument of a function having a Type that is the namespace of the function itself.
Nevertheless, since we choose the namespace, we can get "dot-notation" to work fairly often.
This is a further reason why definitions and theorems about `List`s are very often in the `List` namespace: since they apply to `List`s, they likely take a term of type `List ...` as an argument and then dot-notation can be used.
In case you are wondering, the shortening can happen also if the function has several arguments: dot-notation allows you to merge the first explicit argument of the correct Type with the namespace of the declaration.

Here is a situation where we can use dot-notation twice.
We first generalize the definition of `List.twice` above to work for lists of arbitrary Types.
Next, we take a term of Type `String` and we apply `String.toList` to it, converting a `String` to a list of characters.
Finally, we apply `List.twice` to the resulting list of characters.

```lean
/-- For an arbitrary Type `α`, and a list `L : List α`, `List.twice L = L.twice` is the
list obtained by concatenating `L` with itself. -/
def List.twice (L : List α) : List α := L ++ L

#eval String.toList "abc" -- ['a', 'b', 'c'], the list of characters `'a', 'b', 'c'`

#eval "abc".toList -- ['a', 'b', 'c'], same as above, using dot-notation "with `String`"

#eval "abc".toList.twice -- ['a', 'b', 'c', 'a', 'b', 'c'], dot-notation twice!
#eval List.twice (String.toList "abc") -- same as above
```

Let's go over the expression `"abc".toList.twice` again.
First, `"abc".toList` is dot-notation for `String.toList "abc"` (we know this, since `"abc"` is a `String`).
Moreover, `"abc".toList` produces a `List`, as the name suggests!
Thus, if we want to apply `List.twice` to `"abc".toList`, we can again take advantage of dot-notation:
we can compress it to `"abc".toList.twice`.

You can find a more extended example [here](stringProcessing.lean)
<!-- newFile informationExtraction.md -->
# What tools do I have to tease information out of Lean4?

When I first started using Lean, I felt that I was dealing with a computer program that would
complain when I was doing something *wrong*, but would give me almost no insight about what I
could do *right*!

With time, I learned how to read Lean's error messages and also several tricks to tease out
information from Lean about its inner workings.
As time progresses, I find that Lean tries very hard to guide me in the right
direction.
This page is dedicated to some of the tools that I use, when I am exploring parts of Lean
code that I do not know.

__Note.__  I use VSCode as an editor.
Some of the tricks that I mention below may not work with different editors.
As I have not tried using Lean with a different editor, I do not know what the differences will be.
I do know that there is support for Emacs and (Neo)vim.
There are probably more editors out there as well.

## Infoview

Probably, the first feedback that I look at, is what is written in the Infoview.
There is a great deal of information compressed there.
Types, names of terms/hypothesis, what we are trying to prove, instances, coercions,...
Moreover, when something goes wrong, errors are also written there.

*__Learn to read the error messages!__*

It is not easy at the beginning, but it pays off immensely.
Lean has such a rich Typing system that it is aware enough to know what went wrong.
And it constantly tries to tell you what rubbed it the wrong way.
Most error messages become transparent after you have seen them a few times.
Others remain mysterious, even to the experts, but they still provide a lot of insight
into the inner workings of Lean.

## Error messages

Let me say this again:

*__Learn to read the error messages!__*

Lean is constantly playing a game of Tetris, where it is trying to fit all the Types of all
the terms in sight so that they match leaving no ambiguity and no clashes.
Whenever something does not match, there are very good chances that Lean knows the supposed hole
that the piece was supposed fill and the shape of the piece.
This means that it can usually give very precise information about what should have happened.
It is then up to us to figure out what caused the jigsaw to mismatch.
Here are a few common errors that show up all the time and what they often mean.
* `function expected at ...` -- this normally means that Lean thinks that you have given
  too many inputs to a function.
  Maybe you have forgotten a parenthesis?
  Example:
    ```lean
    #check (1 2)
  /-
  function expected at
    1
  term has type
    ?m.2721
  -/
  ```
  oops, I forgot a comma!  I meant
  ```lean
  #check (1, 2)
  /-
  (1, 2) : Nat × Nat
  -/
  ```
  Or an argument that you thought was explicit was implicit?
* `application type mismatch <continueReading!>` -- Lean was expecting a Term of some Type,
  but you gave it a Term of a different Type.
  ```lean
  #check List.drop 2 "abcdef"
  /-
  application type mismatch
    List.drop 2 "abcdef"
  argument
    "abcdef"
  has type
    String : Type
  but is expected to have type
    List ?m.8151 : Type ?u.8150
  List.drop 2 (sorryAx (List ?m.8151) true) : List ?m.8151
  -/
  ```
  oops, I meant
  ```lean
  #check List.drop 2 "abcdef".toList
  /-
  List.drop 2 (String.toList "abcdef") : List Char
  -/
  ```
  or maybe
  ```lean
  #check String.drop "abcdef" 2
  /-
  String.drop "abcdef" 2 : String
  -/
  ```
  If you continue reading the error message beyond `type mismatch`, you will see that Lean actually
  goes through the trouble of telling you exactly what it is that you passed
  and what it was expecting.
  This is incredibly useful!
* `failed to synthesize instance` -- this can be hit or miss.
  It might really be that you forgot a typeclass assumption:
  ```lean
  #check ∀ α, ∀ a b : α, if a = b then True else False
  /-
  failed to synthesize instance
    Decidable (a = b)
  ∀ (α : Sort u_1), α → α → sorryAx Prop true : Prop
  -/
  ```
  Lean tells us that it does not know how to handle `a = b`,
  since it does not know that the Type `α` has a `Decidable (a = b)` instance
  (and `α` need not have decidable equality after all!).
  A possible solution is to simply add `[DecidableEq α]` as an assumption:
  ```lean
  #check ∀ α, [DecidableEq α] → ∀ a b : α, if a = b then True else False
  /-
  ∀ (α : Sort u_1) [inst : DecidableEq α] (a b : α), if a = b then True else False : Prop
  -/
  ```
  However, other times, Lean tries hard to guess what you wanted to do,
  but your error may not be a missing typeclass assumption:
  ```lean
  #check [1] + [2]
  /-
  failed to synthesize instance
    HAdd (List Nat) (List Nat) ?m.21819
  [1] + [2] : ?m.21819
  -/
  ```
  Lean is looking for an instance of addition on lists of natural numbers,
  whereas I simply forgot an extra `+`-symbol:
  ```lean
  #check [1] ++ [2]
  /-
  [1] ++ [2] : List Nat
  -/
  ```
  Here is another one:
  ```lean
  #check [1] :: [2]
  /-
  failed to synthesize instance
    OfNat (List ?m.27405) 2
  [[1], sorryAx (List Nat) true] : List (List Nat)
  -/
  ```
  Lean wants an `OfNat (List ??) 2` instance, whereas I really meant
  ```lean
  #check 1 :: [2]
  /-
  [1, 2] : List Nat
  -/
  ```
  the list `[1,2]`.
  Let's humour Lean, though, and see where we land.
  ```lean
  instance : OfNat (List Nat) 2 where ofNat := [37]

  #check [1] :: [2]
  /-
  [[1], 2] : List (List Nat)
  -/
  ```
  Ok, so now `[[1], 2]` is a list of lists of natural numbers... what list?
  ```lean
  #eval [1] :: [2]
  /-
  [[1], [37]]
  -/
  ```
  This makes sense, of course.  Our instance instructed Lean that, if it needed it,
  it could convert the natural number `2` into the list `[37]`.
  Thus `[1] :: [2]` now acquires the meaning of `[1] :: [[37]]`, which is itself meaningful:
  we are creating a list of lists of natural numbers, by appending the list `[1]` to
  the list of lists `[[37]]`!
  Esoteric, but correct!
  It is a solution to the Typing jigsaw that Lean is trying to prove, although not maybe
  the first one that a human would think of!

There are *many* more mistakes that you can make and Lean will have an error message
for each one of them: learn to understand how Lean is trying to nudge you in the right direction!

## Hover

If you see a theorem or definition that you do not know, you can hover your
mouse over it and you may get some additional information.
If someone was kind enough to write a doc-string for the declaration,
then this is when you will see it.
Mathlib has an almost inescapable convention that *all* its definitions must have doc-string.
Theorems need not have one, but definitions must be documented.
That's something: a human is explaining to another human what this definition is supposed to mean!

## Go to Definition

If you right-click on a declaration,
VSCode will show you a menu whose first option is `Go to Definition`.
This will take you to the location in the code where the declaration was defined.
You can then read the code and try to make sense of what you are seeing!

## `#check`

As we already saw above, `#check <whatever>` gets Lean to see if what you are trying
to check is a Term of some Type and will report the parent Type
(or error if you failed to pass a Term!).

## `#eval`

Again, we already used this above: `#eval` triggers a "computation".
For instance:
```lean
#eval 3 + 5
/-
8
-/
```
```lean
#eval if 3 + 5 == 4 then true else false
/-
false
-/
```
```lean
#eval if 3 + 5 == 4 then IO.println "Hi!" else IO.println "Hello"
/-
Hello
-/
```
```lean
#eval do
  for i in [0:5] do
    IO.print f!"{i} "
/-
0 1 2 3 4
-/
```
```lean
#eval do
  let mut first := ""
  let mut second := ""
  for i in [0:5] do
    first := first ++ (⟨Nat.toDigits 10 i⟩: String) ++ " "
    second := second ++ " " ++ (⟨Nat.toDigits 10 (4 - i)⟩ : String)
  let shifted := first ++ "\n" ++ second ++ "\n"
  IO.println (shifted ++ shifted ++ shifted)
/-
0 1 2 3 4
 4 3 2 1 0
0 1 2 3 4
 4 3 2 1 0
0 1 2 3 4
 4 3 2 1 0

-/
```
<!-- newFile sample_lean_file.md -->
#  Sample Lean file

This is a sample Lean file, using `Mathlib`.
You can copy it into the [online Lean4 server](https://lean.math.hhu.de/) or in your own computer, if you have installed Lean 4 and downloaded a copy of `Mathlib`.

We will also go over this file during the first lectures.

```lean
import Mathlib.Tactic

namespace TPwL

#check Bool   -- Bool : Type

#check Prop   -- Prop : Type
#check Sort   -- Prop : Type

#check Type   -- Type : Type 1
#check Sort 1 -- Type : Type 1

#check Type 1 -- Type 1 : Type 2
#check Sort 2 -- Type 1 : Type 2
/-  and so on. -/

#check and  -- and (x y : Bool) : Bool
#check or   -- or  (x y : Bool) : Bool
#check Or   -- and (x y : Prop) : Prop
#check And  -- or  (x y : Prop) : Prop

#check (· ∧ ·)  -- fun x x_1 ↦ x ∧ x_1 : Prop → Prop → Prop

/-  Easy template for a `lemma`

lemma name_of_lemma assumptions : statement := by
  tactics ...
  done

* `lemma` instructs Lean that we are stating a lemma,
* `name_of_lemma` assigns a name to the lemma that we are about to state,
* `assumptions` is a (finite) sequence, possibly empty, of statements like
  `(n : ℕ) {z : ℤ} (h : n + n = n + 1)`,
* `statement` is what we actually want to prove, e.g. `n = 1` or `∃ k : ℕ, n = 2 * k`
  or whatever we want to prove,
* `tactics` are the steps that we communicate to Lean to guide it through the proof.

If we do not want to re-use our result, then we may not want to even give it a name.
In that case, we can use `example`.
The syntax is similar to the one of `lemma`,
except that we begin with `example` and we cannot give it a name:

example assumptions : statement := by
  tactics ...
  done

_A comment about `done`_
Technically, writing `done` at the end of a proof is not needed.
However, since Lean does a fair amount of second-guessing about what you might be trying to say,
informing it explicitly where the proof should finish helps it to produce more meaningful error messages.
In turn, producing better error messages means that you will find it easier to find your mistakes!
-/

example (p q : Prop) (hpq : p ∧ q) : q ∧ p := by
  sorry
  ---- this lemma exists and `exact?` finds it for us
  --constructor  -- splits the `and` in the goal into two separate goals
  --· cases hpq  -- place the cursor at the end of `hpq`, wait for 💡 to appear and click on it!
  --  assumption
  --· sorry  -- left to you!
  done

example (p q : Prop) (hpq : p → q) (hp : p) : q := by
  sorry
  --apply hpq
  --assumption
  done

example (p q r : Prop) (hpq : p → q) (hqr : q → r) (hp : p) : r := by
  sorry
  --apply hqr
  --apply hpq
  --assumption
  ---- "alternative" proofs
  --apply hqr (hpq hp)
  --exact hqr (hpq hp)
  --solve_by_elim
  --exact?
  done

/-
Often, proof assistants make us aware of concepts that we were using unconsciously.
One of these may be the different role that *assumption* and *conclusions* play in a proof.
For instance, if one of your *assumptions* is `a + b = 0 ∧ a - b = 0`,
then we should have access to both statements `a + b = 0` and `a - b = 0`.
However, if our *conclusion* is `a + b = 0 ∧ a - b = 0`,
then, effectively, we have to prove two equalities
* `a + b = 0`, and
* `a - b = 0`.

You can think of the conjunction `and` among the *assumptions* as giving you two assumptions
within the same proof.
You can think of the conjunction `and` among the *conclusions* as requiring you two *separate*
proofs with the same assumptions.

Exercise.
What changes if we replace `and` for `or` in the previous discussion?

Consequently, the tactics that we use may be different, based on whether "similar looking"
statements are assumptions or conclusions.

For instance, when we have an `and` assumption, we can use the `cases` tactic.
When we have an `and` conclusion, we can use the `constructor` tactic.
-/

example {n : ℕ} (h : n + n = n + 1) : n = 1 := by
  sorry
  ---- this lemma (or rather a more general version of it) exists and `exact?` finds it for us
  --have := add_right_inj (G := ℕ)
  ---- apply this.mp  -- fails, try to understand the error!
  --apply (this ?_).mp
  ---- look at the state now
  --· exact h
  ---- where did the other goal go?
  done

lemma zero_eq_zero : 0 = 0 := by
  rfl
  done

lemma zero_ne_one : 0 ≠ 1 := by
  exact?
  done
```
<!-- newFile ideas_to_develop.md -->
#  Stubs of ideas and projects

###  Mathematically oriented projects

* Sums of squares of a field are a group with zero
* The non-zero sums of squares of a field form a multiplicative group
* Derivatives of polynomials are continuous
* In a semiring, 0 is odd if and only if 2 has a multiplicative inverse and 1 has an additive opposite
* Characterise semirings in which 1 is even
* Sums and products of continuous functions are continuous
* Polynomials over an integral domain are an integral domain
* Irrational numbers exist
* Find infinite subsets of the natural numbers containing no 3-term arithmetic progression
* Your favourite theorem!

Besides using Lean to prove theorems, you can also use it to verify counterexamples!
Two books that contain lots of inspiration are
* [Counterexamples in Topology](https://link.springer.com/book/10.1007/978-1-4612-6290-9),
* [Counterexamples in Analysis](https://faculty.ksu.edu.sa/sites/default/files/_olmsted_1.pdf).

###  Computer science oriented projects

* Automating proofs:
  * write a tactic to dispatch "junk values"
  * write a tactic to compute degrees of multivariate polynomials
  * write a tactic to split and progress on `Nat.sub`
* Tooling for statistical analysis of Mathlib:
  * proof lengths (extract the number of lines of the proofs of all declarations)
  * tactic in a declaration (find which tactics are used in a given declaration)
  * tactic usage (frequency distribution of tactics)
  * finishing tactics (frequency distribution of the last tactic in a proof)
* Come up with your meta-programming goal!
<!-- newFile weekly_topics_tbc.md -->
#  Possible weekly topics &ndash; very preliminary

This is a week-by-week breakdown of possible topics for the [MA4N1 Theorem Proving with Lean](https://adomani.github.io/Syllabus/MA4N1/intro).
It is a highly susceptible to changes!

A more stable, periodically updated, syllabus is [here](https://adomani.github.io/Syllabus/MA4N1).

###  Week 1 &mdash; Introduction to Lean

* Accessing Lean
  * installing on a personal computer,
  * online GitPod setup,
  * online Lean server.
* Resolve potential issues
  * installation,
  * downloading course material.
* Basic introduction to Lean
  * syntax,
  * the tactic state,
  * what are tactics,
  * structuring proofs.

---

###  Week 2 &mdash; Logic in Lean

* `and`, `or`, `not`, implications, `iff`,
* using tactics in proofs.

---

###  Week 3 &mdash; Sets I

* Encoding of sets,
* relation to Type theory,
* proving basic facts about sets,
* more tactics.

---

###  Week 4 &mdash; Real numbers

* Simple identities,
* basic manipulations,
* more complicated identities,
* introduction to absolute values.

---

###  Week 5 &mdash; Inequalities and absolute values

* Dealing with inequalities in Lean,
* initial equivalences,
* mixing inequalities and absolute values.

---

###  Week 6 &mdash; Formalising limits

* First properties,
* limits of sums, differences, products...

---

###  Week 7 &mdash; Functions

* Injectivity and surjectivity,
* contrasting Type theory and Set theory.

---

###  Week 8 &mdash; Sets II

* Subsets, membership, complements,
* unions, intersections,
* images and inverse images.

---

###  Week 9 &mdash; Finite sets

* Induction,
* using finite sets classically.

---

###  Week 10 &mdash; Project-related questions

Addressing specific issues arising from working on the projects.
<!-- newFile common_symbols.md -->
#  Commonly used symbols

<!--
echo 'Name | Symbol
- | :-:
`and` `∧`
`or` `∨`
`not` `¬`
`iff` `↔`
`implies` `→`
`for all` `∀`
`there exists` `∃`
`goal` `⊢`' |
  sed 's=` `=` | `= ; s=^=| =; s=$= |=' |
  column -s'|' -o'|' -t | copy
-->

| Name           | Symbol |
| -              | :-:    |
| `and`          | `∧`    |
| `or`           | `∨`    |
| `not`          | `¬`    |
| `iff`          | `↔`    |
| `implies`      | `→`    |
| `for all`      | `∀`    |
| `there exists` | `∃`    |
| `goal`         | `⊢`    |

You can find a cheat-sheet with commonly used symbols and tactic [here](https://github.com/madvorak/lean4-cheatsheet/blob/main/lean-tactics.pdf) (this page is externally maintained -- let me know if it stops working).
<!-- newFile faq.md -->
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
