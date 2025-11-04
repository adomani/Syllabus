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
    <tr><td><p style="margin-bottom:0;">Thursday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Cancelled due to illness. <!--Functional programming, object oriented programming, more proofs.--></li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 3  ################## -->
    <tr><th></th><th style="text-align: center">Week 3 (Oct 20-24)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Coordinate projects.</li>
          <li>Continue <a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L01_polynomials.lean">polynomials</a>.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>How to find the multiplication instance on <code>Polynomial</code>s.</li>
          <li>Coordinate projects.</li>
          <li>Start forming groups.</li>
          <li>Begin <a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L02_generalizations.lean">generalizations</a>.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Thursday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Proofs with $\varepsilon$ and $\delta$.</li>
          <li>Archimedean property of the real numbers.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 4  ################## -->
    <tr><th></th><th style="text-align: center">Week 4 (Oct 27-31)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Creating a new project (and failing on Windows).</li>
          <li>Comments about the project outline.</li>
          <li>Continuing <a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L02_generalizations.lean">generalizations</a>: tactic mode and term mode.  <!--Discussion about <code>structure</code>, <code>class</code>, Working with two topologies on the same set/type. --></li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li><a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L02_generalizations.lean">Generalizations</a>.</li>
          <li>Differences between <code>simp?</code> and <code>exact?</code>.</li>
          <li>Comparison between <code>convert</code> and <code>exact</code>/<code>apply</code>.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Thursday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Individual work on <a href="https://adam.math.hhu.de/#/g/leanprover-community/nng4">Natural Numbers Game</a>.</li>
          <li>Individual work on <a href="https://github.com/PatrickMassot/GlimpseOfLean">Glimpse of Lean</a>.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 5  ################## -->
    <tr><th></th><th style="text-align: center">Week 5 (Nov 03-07)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li><a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L02_generalizations.lean">Generalizations</a>.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li><a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L02_generalizations.lean">Generalizations</a> and "exotic" typeclasses.</li>
          <li>More on groups formation<!--a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L03_groups_questions.lean">Group questions</a-->.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>
<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
What we may be doing in the coming lectures: [tentative syllabus](MA4N1_tentative)
<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
<div style="text-align: right">Last modified: Tuesday, Nov 04 2025</div>
