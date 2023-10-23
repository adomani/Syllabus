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

---

[Back to the `Theorem Proving with Lean` webpage](https://adomani.github.io/Syllabus/MA4N1/toc)

[Back to the Mathlib project for the module](https://github.com/adomani/MA4N1_2023)

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/adomani/MA4N1_2023)

[Back to Moodle](https://moodle.warwick.ac.uk/course/view.php?id=58287#section-0)
