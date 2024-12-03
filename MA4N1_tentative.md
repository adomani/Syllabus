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
## Autumn 2024

<table>
  <tbody>
<!--  ##################  Week 1  ################## -->
    <tr><th></th><th style="text-align: center">Week 1 (Sep 30-Oct 04)</th></tr>
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
          <li>Difference between <code>Bool</code> and <code>Prop</code>, preliminary discussion about project topics.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 2  ################## -->
    <tr><th></th><th style="text-align: center">Week 2 (Oct 07-11)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Syntax, infoview, <code>rfl</code>, <code>inductive</code>s.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>Tactics, structuring proofs (<a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L00_intro.lean">L00_intro.lean</a>)</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Tuesday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Functional programming, object oriented programming, more proofs.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 3  ################## -->
    <tr><th></th><th style="text-align: center">Week 3 (Oct 14-18)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Begin with <a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L01_polynomials.lean">polynomials</a>.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>Coordinate projects.</li>
          <li>Start assigning groups.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Tuesday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Implicit vs explicit variables.</li>
          <li>Dependent Cartesian Product <code>< , ></code>.</li>
          <li>Addition of two even numbers is even.</li>
          <li>Negation.</li>
          <li>Contradiction (absurd).</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 4  ################## -->
    <tr><th></th><th style="text-align: center">Week 4 (Oct 21-25)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Discussion about <code>structure</code>, <code>class</code></li>
          <li>Working with two topologies on the same set/type.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li><a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L02_generalizations.lean">Generalizations</a>.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Tuesday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Solve <a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L01_polynomial_questions.lean">polynomial questions</a>.</li>
          <li>The <code><;></code> tactic combinator.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 5  ################## -->
    <tr><th></th><th style="text-align: center">Week 5 (Oct 28-Nov 01)</th></tr>
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
          <li><a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L03_groups_questions.lean">Group questions</a>.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Tuesday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li><a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L05_limits_questions.lean">limits questions</a>.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 6  ################## -->
    <tr><th></th><th style="text-align: center">Week 6 (Nov 04-08)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Breather week.</li>
          <li>Quick introduction to <code>Filter</code>s,</li>
          <li><a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L05_limits_questions.lean">limits questions</a>.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li><a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L05_graphs_questions.lean">graphs questions</a>.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Tuesday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Finish <a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L05_limits_questions.lean">limits questions</a>,</li>
          <li><a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L05_graphs_questions.lean">graphs questions</a>.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 7  ################## -->
    <tr><th></th><th style="text-align: center">Week 7 (Nov 11-15)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li><a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L06_typeclasses.lean">Typeclasses</a> and introduction to differences between <code>def</code>, <code>structure</code> and <code>class</code>.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>Working with a <code>structure</code> and adding <code>instance</code>s to it.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Tuesday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Various possibilities:</li>
          <li><a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L10_dvd_induction.lean">Induction on divisors of a natural number</a>.</li>
          <li><a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L04_definitions.lean">Definitions</a> and inductives in <code>Mathlib</code>,</li>
          <li><a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L07_calculations.lean">Calculations</a>:</li>
          <li><code>calc, conv, gcongr</code>.</li>
          <li><a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L08_Ri_hard.lean">&#x211D;[i] is a field</a>.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 8  ################## -->
    <tr><th></th><th style="text-align: center">Week 8 (Nov 18-22)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Finished <a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L06_typeclasses.lean">Typeclasses</a>. <!--  <a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L14_in_implicit_explicit.lean">Some syntax</a>: <code>variable/open ... in ...</code>, explicit vs implicit arguments.</li>
          <li>Beginning of <a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L15_setoids.lean">setoids</a>. --></li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>Digression about <code>PowerSeries</code> and <code>HasFPowerSeriesOnBall</code>. <!-- a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L15_setoids.lean">Setoids</a>. --></li>
          <li><a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L17_navigating_Mathlib.lean">Navigating <code>Mathlib</code></a>.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Tuesday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Inaccessible room!  Hopefully, this only affected this week.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 9  ################## -->
    <tr><th></th><th style="text-align: center">Week 9 (Nov 25-29)</th></tr>
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
    <tr><td><p style="margin-bottom:0;">Tuesday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Group work.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 10  ################## -->
    <tr><th></th><th style="text-align: center">Week 10 (Dec 02-06)</th></tr>
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
          <li>Type theory and category theory. --></li>
        </ul>
      </td>
    </tr>
    <tr><td class="divider"><hr/></td><td class="divider"><hr/></td></tr>
    <tr><td><p style="margin-bottom:0;">Tuesday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Group work?</li>
          <li><a href="https://github.com/adomani/MA4N1_Theorem_proving_with_Lean/blob/master/MA4N1/L16_setoids_week_end_questions.lean">Week-end setoids</a>?</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>
<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
What we have done so far: [current syllabus](MA4N1)
<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
<div style="text-align: right">Last modified: Tuesday, Dec 03 2024</div>
