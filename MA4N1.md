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
# [MA4N1 Theorem Proving with Lean](https://adomani.github.io/Syllabus/MA4N1/toc)
## Autumn 2025

<table>
  <tbody>
<!--  ##################  Week 1  ################## -->
    <tr><th></th><th style="text-align: center">Week 1 (Oct 06-10)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Overview of assessment.</li>
          <li>Introduction to formalization and to Lean.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>Difference between <code>Bool</code> and <code>Prop</code>, basic tactics: <code>exact?</code>,  <code>apply</code>, <code>constructor</code>, <code>cases</code>.</li>
          <li>Tactics, structuring proofs (<a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L00_intro.lean">L00_intro.lean</a>)</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 2  ################## -->
    <tr><th></th><th style="text-align: center">Week 2 (Oct 13-17)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Infoview, <!--code>rfl</code>, <code>inductive</code--> preliminary discussion about project topics.</li>
          <li>Begin with <a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L01_polynomials.lean">polynomials</a>, <code>cases</code>, type ascriptions.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>More <a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L01_polynomials.lean">polynomials</a>.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>
<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
What we may be doing in the coming lectures: [tentative syllabus](MA4N1_tentative)
<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
<div style="text-align: right">Last modified: Tuesday, Oct 14 2025</div>
