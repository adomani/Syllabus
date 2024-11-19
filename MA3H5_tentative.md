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
# [MA3H5 Manifolds](https://moodle.warwick.ac.uk/course/view.php?id=67177) tentative syllabus
## Autumn 2024

<table>
  <tbody>
<!--  ##################  Week 1  ################## -->
    <tr><th></th><th style="text-align: center">Week 1 (Sep 30-Oct 04)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Example: projective space.</li>
          <li>Definition of pseudo-group of transformations.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>Definition of a manifold.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Wednesday</td>
      <td>
        <ul>
          <li>Introduction to tensor products.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 2  ################## -->
    <tr><th></th><th style="text-align: center">Week 2 (Oct 07-11)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Examples.</li>
          <li>Open submanifolds, product manifolds, submanifolds.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>More on submanifolds, manifolds defined by equations in another manifold.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Wednesday</td>
      <td>
        <ul>
          <li>Universal properties, tensor algebra.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Friday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Definition of a manifold, smooth maps and diffeomorphisms.</li>
          <li>Problems 1 and 4.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 3  ################## -->
    <tr><th></th><th style="text-align: center">Week 3 (Oct 14-18)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Quotient manifolds.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>Tangent vectors.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Wednesday</td>
      <td>
        <ul>
          <li>Symmetric algebra.</li>
          <li>Introduction to exterior algebra.</li>
          <li>Interpretation of exterior algebra via multilinear, alternating maps.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Friday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Tensor products, local charts of manifolds.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 4  ################## -->
    <tr><th></th><th style="text-align: center">Week 4 (Oct 21-25)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Tangent spaces, vector fields, bracket (beginning).</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>Differential, beginning of definition of immersion, submersion, embedding.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Wednesday</td>
      <td>
        <ul>
          <li>Immersions, submersions, embeddings.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Friday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Review of tangent vectors and vector fields, commuting vector fields and P2-2.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 5  ################## -->
    <tr><th></th><th style="text-align: center">Week 5 (Oct 28-Nov 01)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>(Local) 1-parameter subgroups of (local) diffeomorphisms.</li>
          <li>Flows.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>Local flows and vector fields.</li>
          <li>Complete vector fields.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Wednesday</td>
      <td>
        <ul>
          <li>Cotangent space (definition).</li>
          <li>Smooth 1-forms, total differential, tangent bundle.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Friday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Problem Sheet 2.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 6  ################## -->
    <tr><th></th><th style="text-align: center">Week 6 (Nov 04-08)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Partitions of unity, part 1.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>Partitions of unity, part 2.</li>
          <li>Digression on analytic functions vs smooth functions.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Wednesday</td>
      <td>
        <ul>
          <li>Ehresmann's Theorem. <!--</li>
          <li>Go over definition of tensor, exterior and symmetric algebra.</li>
          <li>Informal motivation for $k$-forms.</li>
          <li>Informal motivation for vector bundles.</li>
          <li>Go over some parts of an exam question.</li>
          <li>Complements and Q&A during breather week.</li>
          <li>--></li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Friday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Tangent vectors to surfaces in $\mathbb{R}^3$. <!-- Partitions of unity, PS2 P4. Tensor products and multilinear maps. --></li>
          <li>Riemannian metrics and pull-backs.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 7  ################## -->
    <tr><th></th><th style="text-align: center">Week 7 (Nov 11-15)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Vector bundles.</li>
          <li>Rank 1 bundles on $S^1$. <!-- Digression on tangent bundle to $S^2$.--></li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>Differential $r$-forms. <!-- Cocycles. --></li>
          <li>Beginning of pull-backs of differential forms.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Wednesday</td>
      <td>
        <ul>
          <li>Pull-backs of differential forms.</li>
          <li>Orientability.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Friday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>"Baby Pre-image theorem".</li>
          <li>Tensor products and exterior squares.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 8  ################## -->
    <tr><th></th><th style="text-align: center">Week 8 (Nov 18-22)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Integrals and Orientability.</li>
        </ul>
      </td>
    </tr>
    <tr><td class="divider"><hr/></td><td class="divider"><hr/></td></tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>Exterior differentiation.</li>
          <li>Stokes' Theorem for manifolds without boundary.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Wednesday</td>
      <td>
        <ul>
          <li>Stokes' Theorem for manifolds without boundary.</li>
          <li>Manifolds with boundary.</li>
          <li>An orientation on $M$ induces an orientation on $\partial M$.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Friday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Differential 2-forms and higher order forms.</li>
          <li>Exterior derivative and $d \circ d = 0$.</li>
          <li>PS3 P3.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 9  ################## -->
    <tr><th></th><th style="text-align: center">Week 9 (Nov 25-29)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Stokes' Theorem for manifolds without boundary.</li>
          <li>Manifolds with boundary.</li>
          <li>An orientation on $M$ induces an orientation on $\partial M$.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Wednesday</td>
      <td>
        <ul>
          <li>Orientation on $\partial [0,1]$.</li>
          <li>Stokes' Theorem.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Friday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Pull-back and differentials.</li>
          <li>PS3 P3.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 10  ################## -->
    <tr><th></th><th style="text-align: center">Week 10 (Dec 02-06)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Brouwer’s fixed point theorem.</li>
          <li>Q&A: germs vs functions, quotient manifolds, remarks about invariance of domain.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Wednesday</td>
      <td>
        <ul>
          <li>Q&A: partitions of unity, immersions, differentials,...</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Friday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Orientability and examples.</li>
          <li>Classical notation for integrals.</li>
          <li>Interior product.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>
<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
What we have done so far: [current syllabus](MA3H5)
<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
<div style="text-align: right">Last modified: Tuesday, Nov 19 2024</div>
