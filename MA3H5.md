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
# [MA3H5 Manifolds](https://moodle.warwick.ac.uk/course/view.php?id=52238)
## Autumn 2022

<table>
  <tbody>
<!--  ##################  Week 1  ################## -->
    <tr><th></th><th style="text-align: center">Week 1 (Oct 03-07)</th></tr>
    <tr><td>Wednesday</td>
      <td>
        <ul>
          <li>Definition of pseudo-group of transformations.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Recorded</td>
      <td>
        <ul>
          <li>Tensor products.</li>
          <li>Tensor algebra.</li>
          <li>Exterior algebra.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 2  ################## -->
    <tr><th></th><th style="text-align: center">Week 2 (Oct 10-14)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Definition of a manifold and examples.</li>
          <li>Product manifolds, submanifolds, manifolds defined by equations in another manifold (independent reading).</li>
          <li>Projective space.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Recorded</td>
      <td>
        <ul>
          <li>More on the exterior algebra.</li>
          <li>Interpretation via multilinear, alternating maps.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Friday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Definition of a manifold.</li>
          <li>The tensor product $V \otimes W$.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 3  ################## -->
    <tr><th></th><th style="text-align: center">Week 3 (Oct 17-21)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Quotient manifolds.</li>
          <li>Tangent vectors, tangent spaces, vector fields.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Recorded</td>
      <td>
        <ul>
          <li>Partitions of unity.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Friday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Sub-manifolds.</li>
          <li>Smooth maps.</li>
          <li>Question Sheet 1.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 4  ################## -->
    <tr><th></th><th style="text-align: center">Week 4 (Oct 24-28)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>(Online lecture) Vector fields, bracket.</li>
          <li>Differential, definition of immersion, submersion, embedding.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Recorded</td>
      <td>
        <ul>
          <li>No recording this week.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Friday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Surgery (Theorem 2.12).</li>
          <li>Tensor products (continued).</li>
          <li>Tangent spaces and derivatives.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 5  ################## -->
    <tr><th></th><th style="text-align: center">Week 5 (Oct 31-Nov 04)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>(Local) 1-parameter subgroups of (local) diffeomorphisms.</li>
          <li>Flows.</li>
          <li>Complete vector fields.</li>
          <li>Cotangent space (definition).</li>
        </ul>
      </td>
    </tr>
    <tr><td>Recorded</td>
      <td>
        <ul>
          <li>Ehresmann's Theorem.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Friday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Derivatives (continued) in charts and abstractly.</li>
          <li>Problem Sheet 2.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 6  ################## -->
    <tr><th></th><th style="text-align: center">Week 6 (Nov 07-11)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Complements and Q&A during breather week:<ul><li>derivatives in coordinates,</li><li>Ehresmann's Theorem and extending integral curves,</li><li>$U \otimes V$ and ${\textrm{Hom} (U^*, V)}$,</li><li>digression on <a href="https://en.wikipedia.org/wiki/Whitney_embedding_theorem">Whitney's Embedding Theorem</a> and Whitney's trick,</li><li>the sofa problem, and</li><li>dimension 4.</li></ul></li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>
<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
What we may be doing in the coming lectures: [tentative syllabus](MA3H5_tentative)
<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
<div style="text-align: right">Last modified: Thursday, Nov 10 2022</div>
