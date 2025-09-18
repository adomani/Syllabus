<!-- newFile toc.md -->
# MA4N1 Theorem Proving with Lean

| Lectures |           | Room  |-| Support classes |          | Room  |
| :-       | :-:       | -     |-| :-              | :-:      | -     |
| Mondays  | 5pm-6pm   | MS.05 |-| suppDay_ma4n1s  | 4pm-5pm  | D1.07 |
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

[This link](ideas_to_develop) contains some sample ideas that could turn into projects.

For more examples, Freek Wiedijk's webpage [Formalizing 100 Theorems](https://www.cs.ru.nl/~freek/100/) has a list of theorems of varying difficulty.
You can find the current progress on their formalization in Lean [here](https://leanprover-community.github.io/100.html).
There is also the more ambitious [1000+ theorems project](https://leanprover-community.github.io/1000.html).

An indispensable prerequisite is the willingness to work using the computer program Lean.
You can use one of the online versions at
* [live.lean-lang.org](https://live.lean-lang.org/),
* [lean.math.hhu.de](https://lean.math.hhu.de/),
* [leanprover-community](https://leanprover-community.github.io/lean-web-editor/),

directly from a browser -- no installation required.
While this is possible, it may be hard to develop a long-term project with this version.
The program can be freely installed on your own computer, following [these instructions](https://leanprover-community.github.io/get_started.html).
There are also web-based versions that can be used.

To get a flavour of what the module entails, you can take a look at the [Natural Numbers Game](https://adam.math.hhu.de/#/g/hhu-adam/NNG4).
The link takes you to the Lean4 version.
The original [Natural Numbers Game (Lean 3)](https://www.ma.imperial.ac.uk/~buzzard/xena/natural_number_game/) was developed by Kevin Buzzard and Mohammad Pedramfar.
In fact, you are encouraged to play with it to see if this module might be a good choice for you!
<!-- newFile syntaxSummary.md -->
# Initial tactic, brackets and basic logic symbols

##  Some tactics

* `constructor`, splits a goal such as `a ∧ b` into two separate goals.
* `cases h`, splits assumption `h` into its constituents.
* `exact h`, closes a goal if `h` is the same as the goal.
* `exact?`, searches for a lemma that might close the goal.
* `assumption`, closes the goal, if one of the assumptions is the goal.

##  Brackets

There are four kinds of brackets for arguments of functions/assumptions of theorems.

* `(a b : ℕ)`: round brackets introduce *explicit* arguments -- Lean expects you to provide these arguments.
* `{a b : ℕ}`: braces introduce *implicit* arguments -- Lean expects to fill these arguments automatically.
* `⦃a b : ℕ⦄`: braces introduce *strict implicit* arguments -- Lean expects to fill these arguments automatically
  (see below for some details on the difference between `{}` and `⦃⦄`).
* `[Group G]`: square brackets introduce *typeclass* assumptions -- Lean has a special mechanism, called typeclass inference, to fill in these arguments implicitly.

###  Difference between implicit brackets `{}` and strict implicit brackets `⦃⦄`
```lean
--  `fe` takes two explicit natural numbers
def fe (m : ℕ) (n : ℕ) := m + n

--  `fi` takes an explicit natural number and an implicit one
def fi (m : ℕ) {n : ℕ} := m + n

--  `fs` takes an explicit natural number and a strict implicit one
def fs (m : ℕ) ⦃n : ℕ⦄ := m + n

/-
When we supply to `fi` or `fs` its first (explicit) argument, there is a potential ambiguity:
are we left with a function of the remaining (strict or not implicit) argument,
or does Lean expect to have filled that argument already?

Here is a way of checking!
-/

/-  if we have two explicit arguments, we pass the first, then
we are left with a function of one explicit argument
-/
#check fe 0  -- fe 0 : ℕ → ℕ

/-  if we have an explicit and an implicit one, we pass the first, we are left with a natural number:
Lean expects to have filled in the implicit argument already
-/
#check fi 0  -- fi 0 : ℕ

/-  if we have an explicit and a strict implicit one, we pass the first, we are left with a function:
Lean *waits* to fill in the left-over strict implicit and thus tells that we still have a function
-/
#check fs 0  -- fs 0 : ⦃n : ℕ⦄ → ℕ
```
Summarising, Lean
* tries to fill in implicit arguments as quickly as it can, while
* it waits to fill in strict implicit arguments longer.

In fact, if our function has further arguments beyond a strict implicit,
Lean will try to fill in the strict implicit only after we pass the next explicit argument.
The distinction between implicit and strict implicit arguments is not too important and you can safely ignore it!

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

You can find a cheat-sheet with commonly used symbols and tactics
[here](https://github.com/madvorak/lean4-cheatsheet/blob/main/lean-tactics.pdf) and also
[here](https://github.com/madvorak/lean4-tactics).
A more comprehensive guide to the `Mathlib` tactics is [here](https://leanprover-community.github.io/mathlib-manual/html-multi/).

These page are externally maintained -- let me know if they stop working.
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
You can copy it into the [online Lean 4 server](https://lean.math.hhu.de/) or in your own computer, if you have installed Lean 4 and downloaded a copy of `Mathlib`.

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
#  Projects and stubs of ideas

|Project title|Comments and possible Mathlib reference|
|-|-|
|[Properties of Trees](https://github.com/ElliotJoyce09/lean_trees)|The definition of a [tree](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/SimpleGraph/Acyclic.html#SimpleGraph.IsTree) in Mathlib|
|[The Isomorphism Theorem](https://github.com/Oeggy123/LEAN-ISO)|Various isomorphism theorems are in [this file](https://leanprover-community.github.io/mathlib4_docs/Mathlib/GroupTheory/QuotientGroup/Basic.html#QuotientGroup.quotientKerEquivRange)|
|[Green’s Theorem](https://github.com/RisingStar111/Lean4-Greens-Theorem)|I don't think that this is in Mathlib|
|[Liouville’s Theorem](https://github.com/invertedpi18/Liouville)|[Liouville Theorem in Mathlib](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/Complex/Liouville.html)|
|[Post’s Functional Completeness Theorem](https://github.com/SushiKebab17/MA4N1_TPwL_Posts_Theorem)|I don't think that this is in Mathlib|
|[Jordan Normal Form](https://github.com/devluhar26/MA4N1)|[Generalized eigenspaces](https://leanprover-community.github.io/mathlib4_docs/Mathlib/LinearAlgebra/Eigenspace/Basic.html#Module.End.genEigenspace)|
|[The Halting Problem](https://github.com/raemundo5/halting)|The definition of a [Turing machine](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Computability/TMComputable.html) in Mathlib|

## Past projects

<details><summary>Click to expand</summary>

<table>
  <thead>
    <tr>
      <th>Project title</th>
      <th>Comments and possible Mathlib reference</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="https://github.com/EdwardWatine/MA4N1">Cauchy’s Theorem (Complex Analysis)</a></td>
      <td><a href="wiki#Cauchy%27s_integral_formula">Cauchy’s Integral Formula</a> in <a href="docs#Complex.two_pi_I_inv_smul_circleIntegral_sub_inv_smul_of_differentiable_on_off_countable">Mathlib</a></td>
    </tr>
    <tr>
      <td><a href="https://github.com/tom-corley/syl_thm_env">Sylow’s Theorems</a></td>
      <td><a href="wiki#Sylow_theorems">Sylow’s Theorems</a> in <a href="docs#Sylow.exists_subgroup_card_pow_prime_le">Mathlib</a> Most of the file <a href="mlfile#GroupTheory/Sylow.html">Sylow</a> is relevant.</td>
    </tr>
    <tr>
      <td><a href="https://github.com/tomdaboom/ma4n1_perfect_graphs">Perfect Graphs</a></td>
      <td><a href="wiki#Perfect_graph">Perfect graphs</a> and examples. There is a folder <code class="language-plaintext highlighter-rouge">Mathlib/Combinatorics/SimpleGraph/</code>, but I do not think that perfect graphs are in Mathlib.</td>
    </tr>
    <tr>
      <td><a href="https://github.com/AadamHaq/MA4N1-Theorem-Proving-with-Lean">Lusin’s Theorem</a></td>
      <td> </td>
    </tr>
    <tr>
      <td><a href="https://github.com/justmayself/Ostrowski-th-in-Lean">Ostrowski’s Theorem</a></td>
      <td><a href="wiki#Ostrowski%27s_theorem">Ostrowski’s Theorem</a>. As far as I can tell, it is not in Mathlib, but there are some (possible) formalizations. Relevant Zulip chats:<a href="zulip#116395-maths/topic/Seminar.20--.20London.20Learning.20Lean/near/362025148">Link to LLL</a> and <a href="zulip#217875-Is-there-code-for-X.3F/topic/Ostrowski's.20theorem">Ostrowski’s Theorem thread</a></td>
    </tr>
    <tr>
      <td><a href="https://github.com/J-Atfield/ma4n1-dirichlet-project">A Special Case of Dirichlet’s Theorem on Arithmetic Progression</a></td>
      <td>Special case of <a href="wiki#Dirichlet%27s_theorem_on_arithmetic_progressions">Dirichlet’s Theorem on arithmetic progressions</a>.</td>
    </tr>
    <tr>
      <td><a href="https://github.com/Gumbah/LagrangeProject">Fermat’s Little Theorem</a></td>
      <td><a href="wiki#Fermat%27s_little_theorem">Fermat’s Little Theorem</a> in <a href="docs#ZMod.pow_card">Mathlib</a>. <a href="wiki#Euler%27s_theorem">Euler’s Theorem</a> in <a href="docs#FiniteField.pow_card_sub_one_eq_one">Mathlib</a></td>
    </tr>
    <tr>
      <td><a href="https://github.com/MichaelCavaliere/MA4N1-Project">Lagrange’s Theorem</a></td>
      <td><a href="wiki#Lagrange%27s_theorem_(group_theory)">Lagrange’s Theorem</a> in <a href="docs#Subgroup.card_subgroup_dvd_card">Mathlib</a></td>
    </tr>
    <tr>
      <td><a href="https://github.com/grhkm21/LakeSeave">Sieve Theory</a></td>
      <td>Some results in analytic number theory.</td>
    </tr>
    <tr>
      <td><a href="https://github.com/mgsium/102_comb_lean">Combinatorial Problems</a></td>
      <td>Problems taken or inspired by IMO problems.</td>
    </tr>
  </tbody>
</table>

</details>

##  Orphaned projects

* [Hall subgroups](https://en.wikipedia.org/wiki/Hall_subgroup) and their existence in soluble groups

  I could not find Hall's theorem in Mathlib, the file on Sylow's Theorems is relevant.
* [Cap set problem](https://en.wikipedia.org/wiki/Cap_set)
* [Cantor's Theorem](https://en.wikipedia.org/wiki/Cantor%27s_theorem)
* [Group cohomology](https://en.wikipedia.org/wiki/Group_cohomology)
* [Transcendence of &pi;](https://en.wikipedia.org/wiki/Lindemann%E2%80%93Weierstrass_theorem)
* [Ramsey Theory](https://en.wikipedia.org/wiki/Ramsey_theory)
* Probability theory and game theory
* Matrix analysis and QR decompositions
* [The Basel problem](https://en.wikipedia.org/wiki/Basel_problem) in [Mathlib](https://leanprover-community.github.io/mathlib4_docs/find/?pattern=hasSum_zeta_two#doc)
* For material on sums of two squares, look at [SumTwoSquares](https://leanprover-community.github.io/mathlib4_docs/Mathlib/NumberTheory/SumTwoSquares.html).

---

##  Mathematically oriented projects

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

##  External repositories and books for inspiration

The `.pdf`s in Keith Conrad's [blurbs page](https://kconrad.math.uconn.edu/blurbs/) contain plenty of ideas.

Besides using Lean to prove theorems, you can also use it to verify counterexamples!
Two books that contain lots of inspiration are
* [Counterexamples in Topology](https://link.springer.com/book/10.1007/978-1-4612-6290-9),
* [Counterexamples in Analysis](https://faculty.ksu.edu.sa/sites/default/files/_olmsted_1.pdf).

##  Computer science oriented projects

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

For instructions on how to create a project depending on Mathlib, look at [this page](instructions_for_new_project).

For browsing the documentation for Mathlib, go to the excellent [documentation pages](https://leanprover-community.github.io/mathlib4_docs/).
<!-- newFile instructions_for_new_project.md -->
#  Creating a new project depending on `Mathlib`

##  Using the VSCode `Lean 4` extension

The Lean4 VSCode extension takes care of most of the steps that would require using the command-line!
Here is a sequence of steps that should get Lean installed on your computer and
a project depending on `Mathlib` running.

* Install [VSCode](https://code.visualstudio.com/).
* Within VSCode, install the [`Lean4` extension](https://marketplace.visualstudio.com/items?itemName=leanprover.lean4).
* (Possibly opening a new file called `<someName>.lean` or simply assigning it `lean` as language): you should see a `∀` on the top right corner of an open Lean-tab.
* Clicking on the `∀`, should open a menu, that will allow you to perform several actions:
  * install `lean`/`lake`;
  * create a new project using Mathlib as a dependency;
  * download the Mathlib build cache;
  * ...

I do not use the `∀` menu too often, so let me know if the information above is out of date or confusing!

If the previous steps did not work for you, continue reading!

##  Unix-based installation from the command-line

Below are instructions on creating a new project using the command-line on Unix-based systems.
They may also work for MacOS or Windows, assuming that you have access to a terminal.

[Source: Mathlib](https://leanprover-community.github.io/install/project.html#creating-a-lean-project)

These instructions should work on Unix-based systems, assuming that you have already installed successfully `Lean` and `lake`.
These instructions *might* also work on MacOs/Windows, when typed in a terminal.

`proj` is the name of the project
```bash
proj='MA4N1_Theorem_proving_with_Lean'
```

Initialize the new project &ndash; takes some time
```bash
lake +leanprover/lean4:nightly-2023-02-04 new "${proj}" math
```

Go inside the newly created folder, that has the same name as the project
```bash
cd "${proj}"
```

Download `mathlib` and its dependencies (`batteries`, `quote4`, `aesop`, `ProofWidgets4`, `lean4-cli`, `import-graph`, `LeanSearchClient`)
```bash
lake update "${proj}"
```

Get the mathlib cache, so you do not have to build it locally
```bash
lake exe cache get
```

Create a new directory with the same name as the repo
```bash
mkdir "${proj}"
```

Open the *current* folder with VSCode

**This is important:** you should open the *folder* containing the project
not a file or an inner folder!
```bash
code .
```

All your files should be created inside the `proj` folder that *you* created,
not the one that was automatically created when you initialized your project

You folder structure should look more or less like this:
```
proj --|-- Proj -------------- | <your_files_here>
       |
       |-- lakefile.lean
       |
       |-- lake-manifest.json
       |
       |-- lean-toolchain
       |
       |-- proj.lean
       |
       |-- .lake/
```

In case you are curious, this is what the files above do.
* `lakefile.lean`: configuration of options and what gets built with `lake build`.
* `lake-manifest.json`: information about depedencies of your project.
* `lean-toolchain`: which version of the `Lean4` language you are using (this is still evolving quickly and roughly every month there is an update).
* `.lake/`: a hidden folder containing the information that Lean produces once it builds a file.
* `proj.lean`: it is common for this file to simply consist of lines of the form `import XXX`,
  where `XXX` ranges among the files in the `Proj` folder that you want Lean to build when running `lake build`.

You will likely not have to look at any of these files.
The only possible exception is `lakefile.lean`, in case you want to set some special options (I will talk about this during the lectures).

For ease of copy-pasting, here are all the commands in a single code-block
```bash
proj=MA4N1_Theorem_proving_with_Lean
lake +leanprover/lean4:nightly-2023-02-04 new "${proj}" math
cd "${proj}"
lake update "${proj}"
lake exe cache get
mkdir "${proj}"
code .
```
<!-- newFile weekly_topics_tbc.md -->
#  Possible weekly topics &ndash; outdated

This is a week-by-week breakdown of possible topics for the [MA4N1 Theorem Proving with Lean](toc).
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

##  What is the video presentation

The video presentation is a short video of at most 4 minutes.

In the video, you should describe what you personally contributed to the formalisation project on which you are working.
Of course, everyone will probably contribute on several different aspects.
Your contribution will likely also change over time.
However, try to be specific, isolate where you feel that you really made a difference, and describe your contribution *at the time of submission*!

Due to the nature of formalisation, contributions come in many forms and the final result is a coherent mix of combined efforts.
Below are a few examples, but these are just some ideas!

* **Container infrastructure**: set up a working project, provide and manage tools for dealing with version control, planning, development and deployment.
* **Focus**: find a suitable topic, adjust to constraints and strengths of group members, re-orient if needed.
* **Mathematics**: lay out a careful mathematical proof to simplify the actual formalisation.
* **Exploration**: try out various possible approaches, before settling on "the one that works".
* **Divide-and-conquer**: produce a network of `sorry`ed out *statements* that, together, form the initial canvas for the formalisation.
* **Fill in `sorry`s**: writing proofs in Lean to prove statements, highlighting which ones came easily, which ones required more effort.
* **Formalisation infrastructure**: maintain and streamline existing proofs, develop ergonomical API lemmas, code review, speed-ups.

As I said, the list above is just a sample of possible contributions.
You may very well feel that you helped your group in a different way: the video presentation is your chance of explaining what it is that you did!

The final success of a project results from a mix of different types of contributions.
In assessing your contribution, make sure that you explain which specific questions you were facing and how your work addressed and (hopefully!) solved the issue.

Do mention how effective your solution has been and whether you expect it to require further "maintenance" or it settled completely the problem.
Be honest about it: being unsuccessful at solving a problem is a very common situation!
You will be assessed on your attempt, regardless of whether you completed it or not.
Partially failing at solving a difficult problem, may still count as a great success!
