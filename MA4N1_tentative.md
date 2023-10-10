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
          <li>Syntax, infoview, tactics, structuring proofs (<a href="https://github.com/adomani/MA4N1_2023/blob/master/MA4N1_2023/Lecture0.lean">Lecture0.lean</a>).</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 2  ################## -->
    <tr><th></th><th style="text-align: center">Week 2 (Oct 09-13)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>Begin <a href="https://github.com/adomani/MA4N1_2023/blob/master/MA4N1_2023/Polynomials.lean">Polynomials.lean</a>.</li>
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
    <tr><td class="divider"><hr/></td><td class="divider"><hr/></td></tr>
<!--  ##################  Week 3  ################## -->
    <tr><th></th><th style="text-align: center">Week 3 (Oct 16-20)</th></tr>
    <tr><td>Monday</td>
      <td>
        <ul>
          <li>More on <a href="https://github.com/adomani/MA4N1_2023/blob/master/MA4N1_2023/Polynomials.lean">Polynomials.lean</a>.</li>
        </ul>
      </td>
    </tr>
    <tr><td>Tuesday</td>
      <td>
        <ul>
          <li>Matrices?</li>
          <li>Graphs?</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 4  ################## -->
    <tr><th></th><th style="text-align: center">Week 4 (Oct 23-27)</th></tr>
    <tr><td>TBD</td>
      <td>
        <ul>
          <li>Real Numbers</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 5  ################## -->
    <tr><th></th><th style="text-align: center">Week 5 (Oct 30-Nov 03)</th></tr>
    <tr><td>TBD</td>
      <td>
        <ul>
          <li>Inequalities and absolute values</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 6  ################## -->
    <tr><th></th><th style="text-align: center">Week 6 (Nov 06-10)</th></tr>
    <tr><td>TBD</td>
      <td>
        <ul>
          <li>Breather week.</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 7  ################## -->
    <tr><th></th><th style="text-align: center">Week 7 (Nov 13-17)</th></tr>
    <tr><td>TBD</td>
      <td>
        <ul>
          <li>Formalising limits</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 8  ################## -->
    <tr><th></th><th style="text-align: center">Week 8 (Nov 20-24)</th></tr>
    <tr><td>TBD</td>
      <td>
        <ul>
          <li>Functions</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 9  ################## -->
    <tr><th></th><th style="text-align: center">Week 9 (Nov 27-Dec 01)</th></tr>
    <tr><td>TBD</td>
      <td>
        <ul>
          <li>Sets</li>
        </ul>
      </td>
    </tr>
<!--  ##################  Week 10  ################## -->
    <tr><th></th><th style="text-align: center">Week 10 (Dec 04-08)</th></tr>
    <tr><td>TBD</td>
      <td>
        <ul>
          <li>TBA</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>
<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
What we have done so far: [current syllabus](MA4N1)
<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
<div style="text-align: right">Last modified: Tuesday, Oct 10 2023</div>
