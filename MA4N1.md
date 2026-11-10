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
    <tr><td><p style="margin-bottom:0;">Thursday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Basics about tactics.</li>
          <li>Project supervision.  <!-- Individual work on <a href="https://adam.math.hhu.de/#/g/leanprover-community/nng4">Natural Numbers Game</a>.</li>
          <li>Individual work on <a href="https://github.com/PatrickMassot/GlimpseOfLean">Glimpse of Lean</a --></li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 5  ################## -->
    <tr><th></th><th style="text-align: center">Week 5 (Nov 02-06)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li><a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L02_generalizations.lean">L05_graphs.lean</a>.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li><a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L03_groups.lean">Group questions</a>.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Thursday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Breaking up proofs with <code>have</code>.<!--a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L05_limits_questions.lean">limits questions</a--></li>
          <li>Limits and <code>tends_to</code>.<!--Finding results in Mathlib.--></li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 6  ################## -->
    <tr><th></th><th style="text-align: center">Week 6 (Nov 09-13)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Breather week.</li>
          <li>Mention <code>assert_not_exists</code> as a way of making sure that you are not importing declarations that you want to avoid.</li>
          <li>Distinction between implicit (<code>{x : Nat}</code>) and explicit (<code>(h : x = 0)</code>) variables -- see also these <a href="https://adomani.github.io/Syllabus/MA4N1/syntaxSummary#brackets">notes</a>.</li>
          <li><a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L07_calculations.lean">Calculations</a>: use of <code>calc</code>, <code>conv</code>. <!--a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/BreatherWeek.lean">Sample formalisation of an inequality</a>: avoid Nat-subtraction, absorb inequalities, write more lemmas. <a href="https://raw.githubusercontent.com/fpvandoorn/LeanCourse24/master/lean-tactics.pdf">Tactic cheat sheet</a>. <Quick introduction to <code>Filter</code>s, <a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L05_limits_questions.lean">limits questions</a--></li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>
<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
What we may be doing in the coming lectures: [tentative syllabus](MA4N1_tentative)
<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
<div style="text-align: right">Last modified: Tuesday, Nov 10 2026</div>
