# Project ideas

A collection of possible outlines for group projects.

Each idea comes with
* a statement of what could be formalised,
* an indication of what `Mathlib` already provides and what is missing,
* a list of milestones, ordered so that the early ones are self-contained and achievable, while
  the later ones are progressively more ambitious.

You are *not* expected to reach the last milestone!
A project that carefully formalises the first two or three steps, with a well-designed API and
clear documentation, is a much better project than one that piles up `sorry`s trying to get to
the end.

**This mode of project is fully experimental for this year.**
Running a project from a detailed outline like the ones below, rather than from a topic that you
choose yourselves, is something that we are trying out for the first time.
Expect the outlines to be adjusted as we go, and do talk to me early if the shape of one of them
is not working for your group.

---

## The Brauer--Suzuki theorem

### The statement

> **Theorem** (Brauer--Suzuki, 1959).
> Let `G` be a finite group whose Sylow 2-subgroups are generalised quaternion groups.
> If `G` has no non-trivial normal subgroup of odd order, then the centre of `G` has order 2.

The usual corollary is the reason the result is famous:

> **Corollary.** No finite simple group has generalised quaternion Sylow 2-subgroups.

Recall that the *generalised quaternion group* of order `2 ^ (k + 2)` is
```
Q_{2^(k+2)} = ⟨ a, x | a ^ (2 ^ (k + 1)) = 1, x ^ 2 = a ^ (2 ^ k), x a x⁻¹ = a⁻¹ ⟩ ,
```
which in `Mathlib` is `QuaternionGroup (2 ^ k)` (note the indexing: `QuaternionGroup n` has
`4 * n` elements, so the quaternion group `Q₈` of order `8` is `QuaternionGroup 2`).

### Why this is an interesting project

* The *statement* is short, but expressing it in Lean already requires inventing two definitions
  that `Mathlib` does not have: "generalised quaternion group" and "largest normal subgroup of odd
  order".  Designing these well, and building a usable API around them, is exactly the exercise of
  [L04_definitions.lean](https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L04_definitions.lean).
* The first milestones are honest, finite computations inside a concrete group that `Mathlib`
  already knows about, so you can start proving things on day one.
* The result sits at the boundary of what has been formalised anywhere, so the later milestones
  are genuine mathematics, not exercises.

**A warning about scope.**  The full proof is *hard*.  It goes through the theory of exceptional
characters and Suzuki's coherence method, and the infrastructure it needs (class functions,
generalised characters, induction and Frobenius reciprocity) is largely absent from `Mathlib`.
Formalising the whole theorem is a research-scale undertaking, not a term project.  Treat the
final milestone as a direction of travel, and aim to land the earlier ones properly.

### What `Mathlib` already has

* `QuaternionGroup n`, in `Mathlib/GroupTheory/SpecificGroups/Quaternion.lean`, together with
  the multiplication rules (`QuaternionGroup.a_mul_a`, `QuaternionGroup.xa_mul_xa`, ...),
  `QuaternionGroup.card`, and the orders of all the elements:
  `QuaternionGroup.orderOf_a` and `QuaternionGroup.orderOf_xa`.
* The Sylow theorems, in `Mathlib/GroupTheory/Sylow.lean`: existence
  (`IsPGroup.exists_le_sylow`), conjugacy of Sylow subgroups, normalisers, and so on.
* `IsPGroup` and the class equation, including
  `IsPGroup.card_center_eq_prime_pow`.
* The transfer homomorphism and Burnside's normal `p`-complement theorem, in
  `Mathlib/GroupTheory/Transfer.lean`: `MonoidHom.transferSylow`,
  `MonoidHom.ker_transferSylow_isComplement'` and `IsCyclic.isComplement'`.
  This is the tool that settles the *cyclic* Sylow 2-subgroup case, which is the natural warm-up
  for the quaternion case.
* Characters of finite-dimensional representations, in
  `Mathlib/RepresentationTheory/Character.lean`: `Representation.character`, `FDRep.character`,
  and the first orthogonality relation `FDRep.char_orthonormal`.

### What `Mathlib` does not have

This list is the real content of the project: each item is a piece of mathematics that has to be
built before the theorem can even be stated or proved.

* Generalised quaternion groups as a *predicate* on an abstract group.
* The `2'`-core `O(G)` (largest normal subgroup of odd order); more generally `O_p(G)` and
  `O_{p'}(G)`.
* The classification of 2-groups with a unique involution (cyclic or generalised quaternion).
* Class functions as an inner-product space, induced class functions, Frobenius reciprocity,
  generalised (virtual) characters, and the theory of exceptional characters.
  `Mathlib/RepresentationTheory/Induced.lean` induces *representations*, but there is no character
  formula for the induced representation.

### Milestones

**1. The unique involution of a quaternion group.**
Prove that for every `n ≥ 1` the group `QuaternionGroup n` has exactly one element of order 2,
namely `a n`.  Everything you need is already in `Mathlib`; the point is to organise the case
analysis on `a i` versus `xa i` cleanly.
```lean
-- sketch, not checked
theorem QuaternionGroup.orderOf_eq_two_iff {n : ℕ} [NeZero n] {g : QuaternionGroup n} :
    orderOf g = 2 ↔ g = a (n : ZMod (2 * n)) := by
  sorry
```
Deduce that the centre of `QuaternionGroup (2 ^ k)` has order 2 for `k ≥ 1`.

**2. A definition, and its API.**
Introduce
```lean
-- sketch, not checked
/-- A group is *generalised quaternion* if it is isomorphic to `QuaternionGroup (2 ^ k)`
for some `k ≥ 1`. -/
def IsGeneralisedQuaternion (G : Type*) [Group G] : Prop :=
  ∃ k : ℕ, 1 ≤ k ∧ Nonempty (G ≃* QuaternionGroup (2 ^ k))
```
and prove the lemmas that make it usable without ever unfolding it again: such a group is a
2-group, its cardinality is `2 ^ (k + 2)`, it has a unique involution, its centre has order 2,
and the property transfers along group isomorphisms.
Think about the alternatives before you commit: a presentation, an inductive predicate, or a
characterisation ("a non-cyclic 2-group with a unique involution") each make different lemmas easy
and different lemmas painful.

**3. One class of involutions.**
If a Sylow 2-subgroup of `G` has a unique involution `t`, then every involution of `G` is
conjugate to `t`.
```lean
-- sketch, not checked
theorem exists_conj_eq {G : Type*} [Group G] [Finite G] (P : Sylow 2 G) (t : G) (htP : t ∈ P)
    (hP : ∀ g ∈ P, orderOf g = 2 → g = t) {u : G} (hu : orderOf u = 2) :
    ∃ x : G, x * u * x⁻¹ = t := by
  sorry
```
The proof is a genuine, but short, application of the Sylow theorems: `Subgroup.zpowers u` is a
2-subgroup, so it lies inside some Sylow 2-subgroup, which is conjugate to `P`.
Note that `G` itself need *not* have a unique involution -- work out an example to see why.

**4. The odd core `O(G)`.**
Define the largest normal subgroup of odd order and set up its API: it exists, it is normal, it
has odd order, it contains every normal subgroup of odd order, and it is preserved by every
automorphism (in particular it is characteristic).
The mathematical content is that the subgroup generated by two normal subgroups of odd order again
has odd order.
With this in hand, the theorem can finally be *stated*:
```lean
-- sketch, not checked
proof_wanted brauer_suzuki {G : Type*} [Group G] [Finite G] (P : Sylow 2 G)
    (hP : IsGeneralisedQuaternion P) (hO : oddCore G = ⊥) :
    Nat.card (Subgroup.center G) = 2
```
Getting to a statement that you are confident says what you mean -- and that you can sanity-check
against small examples -- is already a respectable outcome for a project.

**5. The corollary, assuming the theorem.**
Deduce from milestone 4 that a finite simple group has no generalised quaternion Sylow
2-subgroup.  This is a short argument (a simple group has trivial odd core; a centre of order 2 in
a simple group forces the group to be abelian, hence cyclic of prime order, which has no
quaternion Sylow 2-subgroup) and it is a good example of proving a real corollary from a
`proof_wanted` statement.

**6. Warm-ups and neighbours, in increasing order of ambition.**
* A finite group with a *cyclic* Sylow 2-subgroup has a normal 2-complement, and hence is not
  simple unless it has order 2.  `Mathlib` has `IsCyclic.isComplement'` for the smallest prime, so
  this is mostly a matter of assembling existing pieces -- and it is the exact analogue of what
  Brauer--Suzuki does for the quaternion case.
* A 2-group with a unique involution is cyclic or generalised quaternion.  This is a classical,
  purely group-theoretic theorem, it is not in `Mathlib`, and it is a fine project in its own
  right.
* Build the missing character theory: class functions with their inner product, induction,
  Frobenius reciprocity.  This is the honest prerequisite for any attempt at the real proof, and
  it is useful far beyond this theorem.

### Practical remarks

* Milestones 1--3 are independent of milestone 4, so a group of three or four can split the work
  from the start and merge later.
* Keep `IsGeneralisedQuaternion` and `oddCore` behind their APIs: as discussed in
  [BreatherWeek.lean](https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/BreatherWeek.lean), if you find yourself needing to `unfold` a
  definition outside its own "standard library" file, a lemma is missing.
* Use `proof_wanted` for the statements you are not going to prove.  A file full of `proof_wanted`
  declarations that all typecheck is a genuine contribution: it is a formal specification.
* Small concrete cases (`QuaternionGroup 2`, i.e. `Q₈`, and `SL(2, 3)`, `SL(2, 5)`) are worth
  writing down as sanity checks on your definitions.

### References

* R. Brauer and M. Suzuki, *On finite groups of even order whose 2-Sylow group is a quaternion
  group*, Proc. Nat. Acad. Sci. U.S.A. **45** (1959), 1757--1759.
* D. Gorenstein, *Finite Groups*, Harper & Row, 1968 -- the chapter on exceptional characters
  contains a full proof.
* M. Suzuki, *Group Theory II*, Springer, 1986.
* G. Glauberman, *Central elements in core-free groups*, J. Algebra **4** (1966), 403--420 -- the
  `Z*`-theorem, which has Brauer--Suzuki as a corollary.
* [Brauer--Suzuki theorem](https://en.wikipedia.org/wiki/Brauer%E2%80%93Suzuki_theorem) on
  Wikipedia, for a quick overview.

---

[Back to the `Theorem Proving with Lean` webpage](https://adomani.github.io/Syllabus/MA4N1/toc)

[Back to the Mathlib project for the module](https://github.com/adomani/MA4N1_Theorem_proving_with_Lean)

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/adomani/MA4N1_Theorem_proving_with_Lean)

[Back to Moodle](https://moodle.warwick.ac.uk/course/view.php?id=71736#section-0)
