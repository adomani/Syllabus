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
# [MA3H5 Manifolds](https://moodle.warwick.ac.uk/course/view.php?id=60813) tentative syllabus
## Autumn 2023

<table>
  <tbody>
<!--  ##################  Week 1  ################## -->
    <tr><th></th><th style="text-align: center">Week 1 (Oct 02-06)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Example: projective space.</li>
          <li>Definition of pseudo-group of transformations.</li>
          <li>Definition of a manifold.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Wednesday</td>
      <td>
        <ul>
          <li>Symmetric algebra.</li>
          <li>Tensor algebra.</li>
          <li>Introduction to tensor products.</li>
          <li>Introduction to exterior algebra.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 2  ################## -->
    <tr><th></th><th style="text-align: center">Week 2 (Oct 09-13)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Examples.</li>
          <li>Product manifolds, submanifolds, manifolds defined by equations in another manifold.</li>
          <li>Quotient manifolds.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Wednesday</td>
      <td>
        <ul>
          <li>More on the tensor and exterior algebra.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Thursday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Definition of a manifold, smooth maps and diffeomorphisms.</li>
          <li>Problems 1 and 4.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 3  ################## -->
    <tr><th></th><th style="text-align: center">Week 3 (Oct 16-20)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Tangent vectors, tangent spaces, vector fields.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Wednesday</td>
      <td>
        <ul>
          <li>Interpretation of exterior algebra via multilinear, alternating maps.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Thursday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Sub-manifolds, Inverse function theorem, PS1 P2-3.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 4  ################## -->
    <tr><th></th><th style="text-align: center">Week 4 (Oct 23-27)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Vector fields, bracket.</li>
          <li>Differential, beginning of definition of immersion, submersion, embedding.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Wednesday</td>
      <td>
        <ul>
          <li>Partitions of unity.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Thursday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Review of tangent vectors and vector fields.</li>
          <li>Example.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 5  ################## -->
    <tr><th></th><th style="text-align: center">Week 5 (Oct 30-Nov 03)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Immersions, submersions, embeddings.</li>
          <li>(Local) 1-parameter subgroups of (local) diffeomorphisms.</li>
        </ul>
      </td>
    </tr>
    <tr><td class="divider"><hr/></td><td class="divider"><hr/></td></tr>
    <tr><td>Wednesday</td>
      <td>
        <ul>
          <li>Flows.</li>
          <li>Complete vector fields.</li>
          <li>Cotangent space (definition).</li>
          <li>Ehresmann's Theorem.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Thursday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>PS2, P1-3.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 6  ################## -->
    <tr><th></th><th style="text-align: center">Week 6 (Nov 06-10)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Complements and Q&A during breather week.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Wednesday</td>
      <td>
        <ul>
          <li>Complements and Q&A during breather week.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Thursday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Partitions of unity, PS2 P4.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 7  ################## -->
    <tr><th></th><th style="text-align: center">Week 7 (Nov 13-17)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Smooth 1-forms, total differential, cotangent bundle.</li>
          <li>Vector bundles.</li>
          <li>Differential $r$-forms and pull-backs.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Wednesday</td>
      <td>
        <ul>
          <li>Integrals and Orientability.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Thursday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Orientability and examples.</li>
          <li>Pull-back and differentials.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 8  ################## -->
    <tr><th></th><th style="text-align: center">Week 8 (Nov 20-24)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Exterior differentiation.</li>
          <li>Examples in $\mathbb{R}^3$.</li>
          <li>Stokes' Theorem for manifolds without boundary.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Wednesday</td>
      <td>
        <ul>
          <li>Manifolds with boundary.</li>
          <li>Stokes' Theorem.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Thursday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>TBA</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 9  ################## -->
    <tr><th></th><th style="text-align: center">Week 9 (Nov 27-Dec 01)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Brouwer’s fixed point theorem.</li>
          <li>Closed and exact forms, de Rham cohomology, formal properties (Theorem 6.2).</li>
          <li>de Rham cohomology of $\mathbb{R}^n$.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Wednesday</td>
      <td>
        <ul>
          <li>de Rham cohomology of $S^n$.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Thursday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Problem Sheet 4, Questions 1-2.</li>
          <li>Classical notation for integrals.</li>
          <li>Interior product.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 10  ################## -->
    <tr><th></th><th style="text-align: center">Week 10 (Dec 04-08)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Top cohomology of compact, connected orientable manifolds is nonzero.</li>
          <li>Q&A: M&ouml;bius band, connected sums, cohomology, hyperbolic plane, surfaces,...</li>
        </ul>
      </td>
    </tr>
    <tr><td>Wednesday</td>
      <td>
        <ul>
          <li>Examples of surgeries (non-examinable).</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Thursday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>TBA</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>
<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
What we have done so far: [current syllabus](MA3H5)
<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
<div style="text-align: right">Last modified: Monday, Oct 30 2023</div>
