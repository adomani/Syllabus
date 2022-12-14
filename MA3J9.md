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
# [MA3J9 Historical Challenges in Mathematics](https://moodle.warwick.ac.uk/course/view.php?id=52244)
## Autumn 2022

<table>
  <tbody>
<!--  ##################  Week 1  ################## -->
    <tr><th></th><th style="text-align: center">Week 1 (Oct 03-07)</th></tr>
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
          <li>Overview of Hilbert’s problems.</li>
          <li>Hilbert’s 3rd problem.</li>
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
    <tr><th></th><th style="text-align: center">Week 2 (Oct 10-14)</th></tr>
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
    <tr><th></th><th style="text-align: center">Week 3 (Oct 17-21)</th></tr>
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
          <li>The tensor product of $\mathbb{R}$ with rotations by a rational multiple of $\pi$: the subgroup $\mathbb{R} \otimes 2\pi \mathbb{Q}/2\pi\mathbb{Z}$ of $\mathbb{R} \otimes \mathbb{R}/2\pi\mathbb{Z}$.</li>
          <li>Answer to Hilbert’s 3rd problem, using Dehn invariant and explicit computations.</li>
          <li>Comments on non-vanishing of the Dehn invariant of the regular tetrahedron.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 4  ################## -->
    <tr><th></th><th style="text-align: center">Week 4 (Oct 24-28)</th></tr>
    <tr><td>Recorded</td>
      <td>
        <ul>
          <li>No recording this week.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>(Online lecture) Overview of Hilbert’s 17th problem.</li>
          <li>Motzkin’s example.</li>
          <li>Formally real fields.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Thursday</td>
      <td>
        <ul>
          <li>(Online lecture) Sums of squares, preorders, orders, initial properties.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 5  ################## -->
    <tr><th></th><th style="text-align: center">Week 5 (Oct 31-Nov 04)</th></tr>
    <tr><td>Recorded</td>
      <td>
        <ul>
          <li>Newton polytopes, in general.</li>
          <li>Newton polygons, for polynomials in two variables.</li>
          <li>Newton polygons and squares of polynomials.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>Artin-Schreier Theorem.</li>
          <li>Orders and order relations, totally positive elements.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Thursday</td>
      <td>
        <ul>
          <li>Quadratic fields.</li>
          <li>Orders on $\mathbb{Q}(\sqrt{d})$ (to be finished).</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 6  ################## -->
    <tr><th></th><th style="text-align: center">Week 6 (Nov 07-11)</th></tr>
    <tr><td>Recorded</td>
      <td>
        <ul>
          <li>Eisenstein’s Criterion and Newton Polygons</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>Orders on $\mathbb{Q}(\sqrt{d})$ (conclusion).</li>
          <li>Complements and Q&A during breather week:<ul><li>$\mathbb{Q} \otimes \mathbb{Z}/6\mathbb{Z} \simeq 0$,</li><li>$\mathbb{Z} \otimes A \simeq A$,</li><li>any rectangle is scissor congruent to a rectangle with an edge of length 1,</li><li>order relations, and</li><li>sums of squares in $\mathbb{Q}\left(\sqrt{d}\right)$.</li></ul></li>
        </ul>
      </td>
    </tr>
    <tr><td>Thursday</td>
      <td>
        <ul>
          <li>Quadratic fields.</li>
          <li>Extending a formally real field by adding a square root of an element in a preorder.</li>
          <li>Definition of an $\mathbb{R}$-algebra.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 7  ################## -->
    <tr><th></th><th style="text-align: center">Week 7 (Nov 14-18)</th></tr>
    <tr><td>Recorded</td>
      <td>
        <ul>
          <li>Motzkin’s polynomial is not a sum of squares.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>Revise some questions from Quiz 2.</li>
          <li>The Artin-Lang homomorphism theorem (statement only).</li>
          <li>Using the Artin-Lang homomorphism theorem to answer Hilbert’s 17th problem.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Thursday</td>
      <td>
        <ul>
          <li>Overview of Hilbert’s 10th problem.</li>
          <li>Diophantine equations, Diophantine sets, algorithms, listable sets.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 8  ################## -->
    <tr><th></th><th style="text-align: center">Week 8 (Nov 21-25)</th></tr>
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
          <li>Existence of non-listable sets.</li>
          <li>More on Diophantine equations, converting a Diophantine equation into an algorithm.</li>
          <li>Diophantine sets are listable.</li>
          <li>Beginning of Diophantine encoding of listable sets.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Thursday</td>
      <td>
        <ul>
          <li>Examples: $a \le b, a \equiv b \pmod{c}$.</li>
          <li>More examples of listable/Diophantine sets: unions and intersections.</li>
          <li>A Diophantine equation for the primes.</li>
          <li>Lagrange’s four square theorem (statement only).</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 9  ################## -->
    <tr><th></th><th style="text-align: center">Week 9 (Nov 28-Dec 02)</th></tr>
    <tr><td>Recorded</td>
      <td>
        <ul>
          <li>Composite numbers and non-powers of two are Diophantine sets.</li>
          <li>Putnam’s trick.</li>
          <li>Discussion about the complements of composite numbers and non-powers of two being Diophantine.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>Algorithmic equivalence of solving Diophantine equations over $\mathbb{Z}$ or over $\mathbb{N}$.</li>
          <li>Hilbert’s 10th problem over rings other than $\mathbb{Z}$.</li>
          <li>Diophantine equations for <code>and</code>, <code>or</code>.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Thursday</td>
      <td>
        <ul>
          <li>Diophantine equations for <code>min</code>, squares and non-squares.</li>
          <li>Davis paper (Pell's equation, exponentials, recursive functions) -- not examinable.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 10  ################## -->
    <tr><th></th><th style="text-align: center">Week 10 (Dec 05-09)</th></tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>Converting an algorithm into a Diophantine equation: statement of the Davis-Putnam-Robinson-Matiyasevich Theorem.</li>
          <li>Using equivalence of Diophantine and listable to resolve Hilbert’s 10th problem.</li>
          <li>Rule 110.</li>
          <li><a href="https://en.wikipedia.org/wiki/Hydra_game">Hercules and the Hydra</a>.</li>
          <li><a href="https://en.wikipedia.org/wiki/Goodstein%27s_theorem">Goodstein's Theorem</a>.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Thursday</td>
      <td>
        <ul>
          <li>Q&A: Overview of Hilbert's 10th problem.</li>
          <li>Number of elements of $\mathbb{Q} \otimes \mathbb{Z}/n\mathbb{Z}$.</li>
          <li>Newton polygons and proof that Motzkin's polynomial is not a sum of squares.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Recorded</td>
      <td>
        <ul>
          <li>Conclusions: relations among the three Hilbert problems that we studied and undecidability more in general.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>
<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
What we may be doing in the coming lectures: [tentative syllabus](MA3J9_tentative)
<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
<div style="text-align: right">Last modified: Friday, Dec 09 2022</div>
