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
# [MA4N1 Theorem Proving with Lean](https://adomani.github.io/Syllabus/MA4N1/toc) tentative syllabus
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
    <tr><td><p style="margin-bottom:0;">Thursday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Finding results in Mathlib.</li>
          <li>Breaking up proofs with <code>have</code>.<!--a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L05_limits_questions.lean">limits questions</a--></li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 6  ################## -->
    <tr><th></th><th style="text-align: center">Week 6 (Nov 10-14)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Breather week.</li>
          <li><a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/BreatherWeek.lean">Sample formalisation of an inequality</a>: avoid Nat-subtraction, absorb inequalities, write more lemmas.</li>
          <li>Informal introduction to <code>aesop</code> and <code>grind</code>.</li>
          <li><a href="https://raw.githubusercontent.com/fpvandoorn/LeanCourse24/master/lean-tactics.pdf">Tactic cheat sheet</a>. <!--Quick introduction to <code>Filter</code>s,</li>
          <li><a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L05_limits_questions.lean">limits questions</a--></li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>Continue with the <a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/BreatherWeek.lean">inequality</a>.</li>
          <li>Discuss how to formalise the notion of <a href="https://en.wikipedia.org/wiki/Subnormal_subgroup">subnormal subgroups</a>.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Thursday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Installation issues: git and github.</li>
          <li>Independent work.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 7  ################## -->
    <tr><th></th><th style="text-align: center">Week 7 (Nov 17-21)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li><code>Set</code>s vs <code>Type</code>s: differences with set theory.</li>
          <li><code>Set.univ</code> vs the type itself.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li><a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L17_navigating_Mathlib.lean">Navigating <code>Mathlib</code></a>.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Thursday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>More on <code>Set</code>s vs <code>Type</code>s.</li>
          <li>Coercions.</li>
          <li>Group work.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 8  ################## -->
    <tr><th></th><th style="text-align: center">Week 8 (Nov 24-28)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Integer polynomials in an <a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/BreatherWeek.lean">extension of the breather week file</a>.</li>
          <li>Mentioned <code>ext</code> for polynomials and <code>simp [field]</code> as a <code>simp</code>-based version of <code>field</code>.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>Covered <a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L04_definitions.lean">definitions, structure and inductives</a>.</li>
          <li>Digression about presentations of groups by generators and relations and universal properties in category theory.</li>
        </ul>
      </td>
    </tr>
    <tr><td class="divider"><hr/></td><td class="divider"><hr/></td></tr>
    <tr><td><p style="margin-bottom:0;">Thursday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Inaccessible room!  Hopefully, this only affected this week.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 9  ################## -->
    <tr><th></th><th style="text-align: center">Week 9 (Dec 01-05)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li><a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L18_finiteness.lean">Finiteness</a>.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li><a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L12_pathologies.lean">Pathologies</a>, leading up to <a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L13_deriv_pathologies.lean">deriv-pathologies</a>. <!-- code>Classical, noncomputable, Prop, Bool</code --></li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Thursday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Group work.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 10  ################## -->
    <tr><th></th><th style="text-align: center">Week 10 (Dec 08-12)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li><a href="https://adventofcode.com/">Advent of Code</a>.</li>
          <li>Solution to Day 2, 2023: <a href="https://github.com/adomani/advents/blob/master/Advents/AoC2023/day02_syntax.lean">syntax parsing</a> and <a href="https://github.com/adomani/advents/blob/master/Advents/AoC2023/day02.lean">running the input</a>.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li><a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L15_setoids.lean">Quotients and setoids</a>.</li>
          <li><a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L09_noncomputable_IsSquare.lean">Noncomputability and decidable instances</a>.  <!-- Algebraic and tropical geometry in <code>Mathlib</code>.</li>
          <li>Type theory and category theory.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Thursday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Group work?</li>
          <li><a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L16_setoids_week_end_questions.lean">Week-end setoids</a>?</li>
          <li> --></li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>
<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
What we have done so far: [current syllabus](MA4N1)
<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
<div style="text-align: right">Last modified: Tuesday, Nov 25 2025</div>
