#  Stubs of ideas and projects

##  Groups

<table><tbody>
<tr>
  <td> Group members </td>
  <td> Comments and possible Mathlib reference </td>
</tr>

<tr>
  <td> Josh R, Ed W, Jaime, Juan </td>
  <td> <ul><li>[The Basel problem](https://en.wikipedia.org/wiki/Basel_problem) in [Mathlib](https://leanprover-community.github.io/mathlib4_docs/find/?pattern=hasSum_zeta_two#doc)</li><li>[Cauchy's Integral Formula](https://en.wikipedia.org/wiki/Cauchy%27s_integral_formula) in [Mathlib](https://leanprover-community.github.io/mathlib4_docs/find/?pattern=Complex.two_pi_I_inv_smul_circleIntegral_sub_inv_smul_of_differentiable_on_off_countable#doc)</li></ul> </td>
</tr>
<tr>
  <td> Antonina, Tom C, Roshan </td>
  <td> [Sylow's Theorems](https://en.wikipedia.org/wiki/Sylow_theorems) in [Mathlib]([Sylow](https://leanprover-community.github.io/mathlib4_docs/find/?pattern=Sylow.exists_subgroup_card_pow_prime_le#doc)). Most of the file `Mathlib/GroupTheory/Sylow.lean` is relevant.  </td>
</tr>
<tr>
  <td> Susie G, Alex C, Tom D, Dan S </td>
  <td> [Perfect graphs](https://en.wikipedia.org/wiki/Perfect_graph) and examples. There is a folder `Mathlib/Combinatorics/SimpleGraph/`, but I do not think that perfect graphs are in Mathlib. </td>
</tr>
<tr>
  <td> Ameer S, Aadam H, Louis G, Giovanni C </td>
  <td> Measure Theory folder `Mathlib/MeasureTheory/` </td>
</tr>
<tr>
  <td> Tommaso F, Mayo </td>
  <td> [Ostrowski's Theorem](https://en.wikipedia.org/wiki/Ostrowski%27s_theorem). As far as I can tell, it is not in Mathlib, but there are some (possible) formalizations. Relevant Zulip chats: [Link to LLL](https://leanprover.zulipchat.com/#narrow/stream/116395-maths/topic/Seminar.20--.20London.20Learning.20Lean/near/362025148) and [Ostrowski's Theorem thread](https://leanprover.zulipchat.com/#narrow/stream/217875-Is-there-code-for-X.3F/topic/Ostrowski's.20theorem) </td>
</tr>
<tr>
  <td> Florence, Michael C </td>
  <td> Number Theory/Group Theory <ul><li>[Lagrange's Theorem](https://en.wikipedia.org/wiki/Lagrange%27s_theorem_(group_theory)) in [Mathlib](https://leanprover-community.github.io/mathlib4_docs/find/?pattern=Subgroup.card_subgroup_dvd_card#doc)</li><li>[Fermat's Little Theorem](https://en.wikipedia.org/wiki/Fermat%27s_little_theorem) in [Mathlib](https://leanprover-community.github.io/mathlib4_docs/find/?pattern=ZMod.pow_card#doc)</li><li>[Euler's Theorem](https://en.wikipedia.org/wiki/Euler%27s_theorem) in [Mathlib](https://leanprover-community.github.io/mathlib4_docs/find/?pattern=FiniteField.pow_card_sub_one_eq_one#doc)</li></ul> </td>
</tr>
<tr>
  <td> Gareth M </td>
  <td> Combinatorics/Analytic Number Theory? </td>
</tr>
<tr>
  <td> Musab, Kit L, (mystery person) </td>
  <td> Combinatorial Problems? </td>
</tr>
</tbody></table>

###  Orphaned projects

* [Hall subgroups](https://en.wikipedia.org/wiki/Hall_subgroup) and their existence in soluble groups

  I could not find Hall's theorem in Mathlib, the file on Sylow's Theorems is relevant.
* [Cap set problem](https://en.wikipedia.org/wiki/Cap_set)
* [Cantor's Theorem](https://en.wikipedia.org/wiki/Cantor%27s_theorem)
* [Group cohomology](https://en.wikipedia.org/wiki/Group_cohomology)
* [Transcendence of &pi;](https://en.wikipedia.org/wiki/Lindemann%E2%80%93Weierstrass_theorem)
* [Ramsey Theory](https://en.wikipedia.org/wiki/Ramsey_theory)
* Probability theory and game theory
* Matrix analysis and QR decompositions

---

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

Also, the `.pdf`s in Keith Conrad's [blurbs page](https://kconrad.math.uconn.edu/blurbs/) contain plenty of ideas.

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

For instructions on how to create a project depending on Mathlib, look at [this page](instructions_for_new_project).

For browsing the documentation for Mathlib, go to the excellent [documentation pages](https://leanprover-community.github.io/mathlib4_docs/).

---

[Back to the `Theorem Proving with Lean` webpage](https://adomani.github.io/Syllabus/MA4N1/toc)

[Back to the Mathlib project for the module](https://github.com/adomani/MA4N1_2023)

[Back to Moodle](https://moodle.warwick.ac.uk/course/view.php?id=58287#section-0)
