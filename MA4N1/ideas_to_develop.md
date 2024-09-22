#  Projects and stubs of ideas

##  Past projects

|Project title|Comments and possible Mathlib reference|
|-|-|
|[Cauchy’s Theorem (Complex Analysis)](https://github.com/EdwardWatine/MA4N1)|[Cauchy's Integral Formula](wiki#Cauchy%27s_integral_formula) in [Mathlib](docs#Complex.two_pi_I_inv_smul_circleIntegral_sub_inv_smul_of_differentiable_on_off_countable)|
|[Sylow’s Theorems](https://github.com/tom-corley/syl_thm_env)|[Sylow's Theorems](wiki#Sylow_theorems) in [Mathlib](docs#Sylow.exists_subgroup_card_pow_prime_le) Most of the file [Sylow](mlfile#GroupTheory/Sylow.html) is relevant.|
|[Perfect Graphs](https://github.com/tomdaboom/ma4n1_perfect_graphs)|[Perfect graphs](wiki#Perfect_graph) and examples. There is a folder `Mathlib/Combinatorics/SimpleGraph/`, but I do not think that perfect graphs are in Mathlib.|
|[Lusin’s Theorem](https://github.com/AadamHaq/MA4N1-Theorem-Proving-with-Lean)||
|[Ostrowski’s Theorem](https://github.com/justmayself/Ostrowski-th-in-Lean)|[Ostrowski's Theorem](wiki#Ostrowski%27s_theorem). As far as I can tell, it is not in Mathlib, but there are some (possible) formalizations. Relevant Zulip chats:[Link to LLL](zulip#116395-maths/topic/Seminar.20--.20London.20Learning.20Lean/near/362025148) and [Ostrowski's Theorem thread](zulip#217875-Is-there-code-for-X.3F/topic/Ostrowski's.20theorem)|
|[A Special Case of Dirichlet’s Theorem on Arithmetic Progression](https://github.com/J-Atfield/ma4n1-dirichlet-project)|Special case of [Dirichlet's Theorem on arithmetic progressions](wiki#Dirichlet%27s_theorem_on_arithmetic_progressions).|
|[Fermat’s Little Theorem](https://github.com/Gumbah/LagrangeProject)|[Fermat's Little Theorem](wiki#Fermat%27s_little_theorem) in [Mathlib](docs#ZMod.pow_card). [Euler's Theorem](wiki#Euler%27s_theorem) in [Mathlib](docs#FiniteField.pow_card_sub_one_eq_one)|
|[Lagrange’s Theorem](https://github.com/MichaelCavaliere/MA4N1-Project)|[Lagrange's Theorem](wiki#Lagrange%27s_theorem_(group_theory)) in [Mathlib](docs#Subgroup.card_subgroup_dvd_card)|
|[Sieve Theory](https://github.com/grhkm21/LakeSeave)|Some results in analytic number theory.|
|[Combinatorial Problems](https://github.com/mgsium/102_comb_lean)|Problems taken or inspired by IMO problems.|

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

---

[Back to the `Theorem Proving with Lean` webpage](https://adomani.github.io/Syllabus/MA4N1/toc)

[Back to the Mathlib project for the module](https://github.com/adomani/MA4N1_2023)

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/adomani/MA4N1_2023)

[Back to Moodle](https://moodle.warwick.ac.uk/course/view.php?id=67222#section-0)
