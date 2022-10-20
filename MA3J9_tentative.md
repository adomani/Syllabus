<script type="text/javascript" id="MathJax-script" async
  src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js">
</script>
<script>
  MathJax = {
    tex: {
      inlineMath: [['$', '$']]
    }
  };
</script>

<!-- https://www.geeksforgeeks.org/how-to-reload-page-only-once-in-javascript/ -->
<script type='text/javascript'>
  (() => {
      if (window.localStorage) {
          if (!localStorage.getItem('reload')) {
              localStorage['reload'] = true;
              window.location.reload();
          } else {
              localStorage.removeItem('reload');
          }
      }
  })();
</script>

# [MA3J9 Historical Challenges in Mathematics](https://moodle.warwick.ac.uk/course/view.php?id=52244) tentative syllabus
## Autumn 2022

<table>
  <tbody>
<!--  ##################  Week 1  ################## -->
    <tr><th></th><th align="center">Week 1 (Oct 03-07)</th></tr>
    <tr><td>Recorded</td>
      <td>
        <ul>
          <li>Statement and proof of Wallace-Bolyai-Gerwien Theorem.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>Overview of Hilbert's problems.</li>
          <li>Hilbert's 3rd problem.</li>
          <li>Initial introduction to free abelian groups and tensor products.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Thursday</td>
      <td>
        <ul>
          <li>Tensor products.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 2  ################## -->
    <tr><th></th><th align="center">Week 2 (Oct 10-14)</th></tr>
    <tr><td>Recorded</td>
      <td>
        <ul>
          <li>Rotation group.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>$\mathbb{Z}/2\mathbb{Z} \otimes \mathbb{Z}/3\mathbb{Z} \simeq (0)$.</li>
          <li>$\mathbb{Z}/m\mathbb{Z} \otimes \mathbb{Z}/n\mathbb{Z} \simeq (0)$ with $m, n$ coprime.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Thursday</td>
      <td>
        <ul>
          <li>$\mathbb{Z}/2\mathbb{Z} \otimes \mathbb{Z}/2\mathbb{Z}$ &mdash; an example computed via passage to the quotient.</li>
          <li>Dihedral angles.</li>
          <li>Definition of the Dehn invariant.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 3  ################## -->
    <tr><th></th><th align="center">Week 3 (Oct 17-21)</th></tr>
    <tr><td>Recorded</td>
      <td>
        <ul>
          <li>Proof of invariance of the Dehn invariant under scissor congruence.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>Computation of Dehn invariants for the cube and for the regular tetrahedron.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Thursday</td>
      <td>
        <ul>
          <li>The group $\mathcal{D} = \mathbb{R} \otimes S^1$ and the Axiom of Choice.</li>
          <li>The tensor product of $\mathbb{R}$ with rotations by a rational multiple of $\pi$: the subgroup $\mathbb{R} \otimes 2\pi \mathbb{Q}/2\pi\mathbb{Z}$ of $\mathbb{R} \otimes \mathbb{R}/2\pi\mathbb{Z}$</li>
          <li>Answer to Hilbert's 3rd problem, using Dehn invariant and explicit computations.</li>
          <li>Comments on non-vanishing of the Dehn invariant of the regular tetrahedron.</li>
          <tr><td class=divider><hr /></td><td class=divider><hr /></td></tr>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 4  ################## -->
    <tr><th></th><th align="center">Week 4 (Oct 24-28)</th></tr>
    <tr><td>Recorded</td>
      <td>
        <ul>
          <li>Newton polytopes, in general.</li>
          <li>Newton polygons, for polynomials in two variables.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>Overview of Hilbert's 17th problem.</li>
          <li>Motzkin's example.</li>
          <li>Sums of squares.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Thursday</td>
      <td>
        <ul>
          <li>Formally real fields, preorders, orders, initial properties.</li>
          <li>Artin-Schreier Theorem.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 5  ################## -->
    <tr><th></th><th align="center">Week 5 (Oct 31-Nov 04)</th></tr>
    <tr><td>Recorded</td>
      <td>
        <ul>
          <li>Newton polygons and squares of polynomials.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>Orders and order relations, totally positive elements.</li>
          <li>Fields of rational functions.</li>
          <li>Quadratic fields.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Thursday</td>
      <td>
        <ul>
          <li>Orders on $\mathbb{Q}(\sqrt{d})$.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 6  ################## -->
    <tr><th></th><th align="center">Week 6 (Nov 07-11)</th></tr>
    <tr><td>Recorded</td>
      <td>
        <ul>
          <li>TBA</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>Complements and Q&A during breather week.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Thursday</td>
      <td>
        <ul>
          <li>Complements and Q&A during breather week.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 7  ################## -->
    <tr><th></th><th align="center">Week 7 (Nov 14-18)</th></tr>
    <tr><td>Recorded</td>
      <td>
        <ul>
          <li>Motzkin's polynomial is not a sum of squares.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>Extending a formally real field by adding a square root of an element in a preorder.</li>
          <li>The Artin-Lang homomorphism theorem (statement only).</li>
        </ul>
      </td>
    </tr>
    <tr><td>Thursday</td>
      <td>
        <ul>
          <li>Using the Artin-Lang homomorphism theorem to answer Hilbert's 17th problem.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 8  ################## -->
    <tr><th></th><th align="center">Week 8 (Nov 21-25)</th></tr>
    <tr><td>Recorded</td>
      <td>
        <ul>
          <li>A listable set with non-listable complement.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>Overview of Hilbert’s 10th problem.</li>
          <li>Diophantine equations, Diophantine sets, algorithms, listable sets.</li>
          <li>First examples: unions, intersections,\ldots</li>
        </ul>
      </td>
    </tr>
    <tr><td>Thursday</td>
      <td>
        <ul>
          <li>Lagrange's four square theorem (statement only).</li>
          <li>Algorithmic equivalence of solving Diophantine equations over $\mathbb{Z}$ or over $\mathbb{N}$.</li>
          <li>More on Diophantine equations, converting a Diophantine equation into an algorithm.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 9  ################## -->
    <tr><th></th><th align="center">Week 9 (Nov 28-Dec 02)</th></tr>
    <tr><td>Recorded</td>
      <td>
        <ul>
          <li>Putnam's trick.</li>
          <li>Composite numbers and non-powers of two are Diophantine sets.</li>
          <li>Discussion about their complements being Diophantine.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>Diophantine equations for <code>and</code>, <code>or</code>, less-than-or-equal, divisibility, min.</li>
          <li>A Diophantine equation for the primes.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Thursday</td>
      <td>
        <ul>
          <li>Converting an algorithm into a Diophantine equation: statement of the Davis-Putnam-Robinson-Matiyasevich Theorem.</li>
          <li>Using equivalence of Diophantine and listable to resolve Hilbert's 10th problem.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 10  ################## -->
    <tr><th></th><th align="center">Week 10 (Dec 05-09)</th></tr>
    <tr><td>Recorded</td>
      <td>
        <ul>
          <li>TBA</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>Hilbert's 10th problem over rings other than $\mathbb{Z}$.</li>
          <li>Rule 110 and cellular automata.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Thursday</td>
      <td>
        <ul>
          <li>G&ouml;del's Theorem from the perspective of Hilbert's 10th problem, more undecidability.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>
<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
What we have done so far: [current syllabus](MA3J9)
<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
<div style="text-align: right">Last modified: Thursday, Oct 20 2022</div>
