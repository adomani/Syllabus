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
## Autumn 2023

<table>
  <tbody>
<!--  ##################  Week 1  ################## -->
    <tr><th></th><th style="text-align: center">Week 1 (Oct 02-06)</th></tr>
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
          <li>Syntax, infoview, tactics, structuring proofs (<a href="https://github.com/adomani/MA4N1_2023/blob/master/MA4N1_2023/L00_intro.lean">L00_intro.lean</a>).</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 2  ################## -->
    <tr><th></th><th style="text-align: center">Week 2 (Oct 09-13)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Begin <a href="https://github.com/adomani/MA4N1_2023/blob/master/MA4N1_2023/L01_polynomials.lean">polynomials</a>.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>Coordinate projects.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Friday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Solve <a href="https://github.com/adomani/MA4N1_2023/blob/master/MA4N1_2023/L01_polynomial_questions.lean">polynomial questions</a>.</li>
          <li>The <code><;></code> tactic combinator.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 3  ################## -->
    <tr><th></th><th style="text-align: center">Week 3 (Oct 16-20)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>More on <a href="https://github.com/adomani/MA4N1_2023/blob/master/MA4N1_2023/L01_polynomials.lean">polynomials</a>.</li>
          <li>Go over beginning of <a href="https://github.com/adomani/MA4N1_2023/blob/master/MA4N1_2023/L02_generalizations.lean">generalizations</a>.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>Assign (most) groups.</li>
          <li>Continue with <a href="https://github.com/adomani/MA4N1_2023/blob/master/MA4N1_2023/L02_generalizations.lean">generalizations</a>.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Friday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li><a href="https://github.com/adomani/MA4N1_2023/blob/master/MA4N1_2023/L03_groups_questions.lean">Group questions</a>.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 4  ################## -->
    <tr><th></th><th style="text-align: center">Week 4 (Oct 23-27)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li><a href="https://github.com/adomani/MA4N1_2023/blob/master/MA4N1_2023/L04_definitions.lean">Definitions</a> in Mathlib.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>Suggestions of topics.</li>
          <li><a href="https://github.com/adomani/MA4N1_2023/blob/master/MA4N1_2023/L04_definitions.lean">Definitions</a> and inductives in Mathlib.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Friday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Two sets of exercises, covering</li>
          <li><a href="https://github.com/adomani/MA4N1_2023/blob/master/MA4N1_2023/L05_graphs_questions.lean">graphs questions</a>, and</li>
          <li><a href="https://github.com/adomani/MA4N1_2023/blob/master/MA4N1_2023/L05_limits_questions.lean">limits questions</a>.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 5  ################## -->
    <tr><th></th><th style="text-align: center">Week 5 (Oct 30-Nov 03)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li><a href="https://github.com/adomani/MA4N1_2023/blob/master/MA4N1_2023/L06_typeclasses.lean">Typeclasses</a>.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li><a href="https://github.com/adomani/MA4N1_2023/blob/master/MA4N1_2023/L07_calculations.lean">Calculations</a>:</li>
          <li><code>calc, conv, gcongr</code>.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Friday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li><a href="https://github.com/adomani/MA4N1_2023/blob/master/MA4N1_2023/L08_Ri_hard.lean">&#x211D;[i] is a field</a>.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 6  ################## -->
    <tr><th></th><th style="text-align: center">Week 6 (Nov 06-10)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Breather week.</li>
          <li>Using the fields of a <code>structure</code>.</li>
          <li><code>noncomputable</code>.</li>
          <li><code>Decidable</code>.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>Breather week.</li>
          <li>More on <code>Decidable</code>.</li>
          <li>Discussion on sub-structures in <code>Mathlib</code>.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Friday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li><a href="https://github.com/adomani/MA4N1_2023/blob/master/MA4N1_2023/L10_dvd_induction.lean">Induction on divisors of a natural number</a>.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 7  ################## -->
    <tr><th></th><th style="text-align: center">Week 7 (Nov 13-17)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li><code>set_option autoImplicit false/true</code>.</li>
          <li><code>aesop</code> and <code>rcases</code> using the <a href="https://github.com/adomani/MA4N1_2023/blob/master/MA4N1_2023/L10_dvd_induction.lean">dvd_induction</a> file.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li><a href="https://github.com/adomani/MA4N1_2023/blob/master/MA4N1_2023/L12_pathologies.lean">Pathologies</a>: <code>Nat.sub, Nat.div, Div, deriv</code></li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Friday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li><a href="https://github.com/adomani/MA4N1_2023/blob/master/MA4N1_2023/L13_deriv_pathologies_questions.lean">deriv-pathologies</a>.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 8  ################## -->
    <tr><th></th><th style="text-align: center">Week 8 (Nov 20-24)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li><a href="https://github.com/adomani/MA4N1_2023/blob/master/MA4N1_2023/L14_in_implicit_explicit.lean">Some syntax</a>: <code>variable/open ... in ...</code>, explicit vs implicit arguments.</li>
          <li>Beginning of <a href="https://github.com/adomani/MA4N1_2023/blob/master/MA4N1_2023/L15_setoids.lean">setoids</a>.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li><a href="https://github.com/adomani/MA4N1_2023/blob/master/MA4N1_2023/L15_setoids.lean">Setoids</a>.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Friday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Group work.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 9  ################## -->
    <tr><th></th><th style="text-align: center">Week 9 (Nov 27-Dec 01)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li><a href="https://github.com/adomani/MA4N1_2023/blob/master/MA4N1_2023/L17_navigating_Mathlib.lean">Navigating <code>Mathlib</code></a>.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li><a href="https://github.com/adomani/MA4N1_2023/blob/master/MA4N1_2023/L18_finiteness.lean">Finiteness</a>.</li>
          <li><code>Classical, noncomputable, Prop, Bool</code>.</li>
        </ul>
      </td>
    </tr>
    <tr><td><p style="margin-bottom:0;">Friday</p><p style="margin : 0; padding-top:0;">(support class)</p></td>
      <td>
        <ul>
          <li>Group work.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 10  ################## -->
    <tr><th></th><th style="text-align: center">Week 10 (Dec 04-08)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li><a href="https://adventofcode.com/">Advent of Code</a>.</li>
          <li>Solution to Day 2: <a href="https://github.com/adomani/advents/blob/master/Advents/day02_syntax.lean">syntax parsing</a> and <a href="https://github.com/adomani/advents/blob/master/Advents/day02.lean">running the input</a>.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>Algebraic and tropical geometry in Mathlib.</li>
          <li>Type theory and category theory.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>
<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
What we may be doing in the coming lectures: [tentative syllabus](MA4N1_tentative)
<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
<div style="text-align: right">Last modified: Wednesday, Dec 06 2023</div>
