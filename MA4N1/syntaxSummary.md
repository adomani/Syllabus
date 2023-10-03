
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
When we supply to `fi` or `fs` its first implicit argument, there is a potential ambiguity:
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

---

[Back to the `Theorem Proving with Lean` webpage](https://adomani.github.io/Syllabus/MA4N1/toc)

[Back to the Mathlib project for the module](https://github.com/adomani/MA4N1_2023)

[Back to Moodle](https://moodle.warwick.ac.uk/course/view.php?id=58287#section-0)
