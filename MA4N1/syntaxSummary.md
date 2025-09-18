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

---

[Back to the `Theorem Proving with Lean` webpage](https://adomani.github.io/Syllabus/MA4N1/toc)

[Back to the Mathlib project for the module](https://github.com/adomani/MA4N1_Theorem_proving_with_Lean)

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/adomani/MA4N1_Theorem_proving_with_Lean)

[Back to Moodle](https://moodle.warwick.ac.uk/course/view.php?id=71736#section-0)
