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
## Autumn 2026

<table>
  <tbody>
<!--  ##################  Week 1  ################## -->
    <tr><th></th><th style="text-align: center">Week 1 (Oct 05-09)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Overview of assessment.</li>
          <li>Introduction to formalization and to Lean.</li>
          <li>The <code>Nat</code>ural numbers.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>Preliminary discussion about project topics.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 2  ################## -->
    <tr><th></th><th style="text-align: center">Week 2 (Oct 12-16)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Infoview.<!--code>rfl</code>, <code>inductive</code> Difference between <code>Bool</code> and <code>Prop</code>,  <code>apply</code> --></li>
          <li>Basic tactics: <code>exact?</code>, <code>constructor</code>, <code>cases</code>.</li>
          <li>Type ascriptions, structuring proofs (<a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L00_intro.lean">L00_intro.lean</a>)</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>Finish <a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L00_intro.lean">L00_intro.lean</a>.</li>
          <li>Proof obligations, forward and backward reasoning.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Thursday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Overview of available resources.</li>
          <li>Installation troubleshooting.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 3  ################## -->
    <tr><th></th><th style="text-align: center">Week 3 (Oct 19-23)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li><a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L01_polynomials.lean">Polynomials</a>, constants, basic lemmas.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>Finish <a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L01_polynomials.lean">polynomials</a>.</li>
          <li>Groups of order 6 vs groups of order <code>pq</code>.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Thursday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Tutorial cancelled due to illness.<!--Proofs with $\varepsilon$ and $\delta$.</li>
          <li>Archimedean property of the real numbers.--></li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 4  ################## -->
    <tr><th></th><th style="text-align: center">Week 4 (Oct 26-30)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Comments about the project outline.</li>
          <li> <a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/AudienceStatements.lean">Live coding</a> with the fundamental theorem of algebra and the pigeonhole principle.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>Project discussion.</li>
          <li> <a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/AudienceStatements.lean">More live coding</a>: handshake lemma, chain rule. <!-- a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L02_generalizations.lean">Generalizations</a>.</li>
          <li>Differences between <code>simp?</code> and <code>exact?</code>.</li>
          <li>Comparison between <code>convert</code> and <code>exact</code>/<code>apply</code --></li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>
<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
What we may be doing in the coming lectures: [tentative syllabus](MA4N1_tentative)
<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
<div style="text-align: right">Last modified: Wednesday, Oct 28 2026</div>
