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
# [MA3H5 Manifolds](https://moodle.warwick.ac.uk/course/view.php?id=60813)
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
    <tr><td>Wednesday</td>
      <td>
        <ul>
          <li>Flows.</li>
          <li>Complete vector fields.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Thursday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Problem Sheet 2, Problems 1 and 3.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 6  ################## -->
    <tr><th></th><th style="text-align: center">Week 6 (Nov 06-10)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Ehresmann's Theorem.</li>
          <li>Complements and Q&A during breather week.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Wednesday</td>
      <td>
        <ul>
          <li>Go over definition of tensor, exterior and symmetric algebra.</li>
          <li>Informal motivation for $k$-forms.</li>
          <li>Informal motivation for vector bundles.</li>
          <li>Go over some parts of an exam question.</li>
          <li>Complements and Q&A during breather week.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Thursday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Partitions of unity, PS2 P4.</li>
          <li>Tensor products and multilinear maps.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 7  ################## -->
    <tr><th></th><th style="text-align: center">Week 7 (Nov 13-17)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Cotangent space (definition).</li>
          <li>Smooth 1-forms, total differential, cotangent bundle.</li>
          <li>Digression on tangent bundle to $S^2$.</li>
          <li>Vector bundles.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Wednesday</td>
      <td>
        <ul>
          <li>Vector bundles.</li>
          <li>Cocycles.</li>
          <li>Differential $r$-forms.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>
<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
What we may be doing in the coming lectures: [tentative syllabus](MA3H5_tentative)
<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
<div style="text-align: right">Last modified: Wednesday, Nov 15 2023</div>
