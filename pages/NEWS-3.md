---
layout: page
title: GNU Octave Version 3
permalink: NEWS-3.html
---

## Summary of important user-visible changes

December 21, 2007

{% include release_news_select.md %}

{::options parse_block_html="true" /}
<div class="panel callout">
* TOC
{:toc}
</div>
{::options parse_block_html="false" /}


<ul>
<li>Compatibility with Matlab graphics is much better.  We now
    have some graphics features that work like Matlab's Handle
    Graphics (tm):
<ul>
<li>  You can make a subplot and then use the print function to
      generate file with the plot.</li>

<li>  RGB line colors are supported if you use gnuplot 4.2.  Octave
      can still use gnuplot 4.0, but there is no way to set arbitrary
      line colors with it when using the Matlab-style plot functions.
      There never was any way to do this reliably with older versions
      of gnuplot (whether run from Octave or not) since it only
      provided a limited set to choose from, and they were terminal
      dependent, so choosing color 1 with the X11 terminal would be
      different from color 1 with the PostScript terminal.  Valid RGB
      colors for gnuplot 4.0 are the eight possible combinations of 0
      and 1 for the R, G and B values. Invalid values are all mapped
      to the same color.
<p>
      This also affects patch objects used in the bar, countour, meshc
      and surfc functions, where the bars and contours will be
      monochrome. A workaround for this is to type "colormap gmap40"
      that loads a colormap that in many cases will be adequate for
      simple bar and contour plots.</li>

<li>  You can control the width of lines using (for example):
<pre>
	line (x, y, "linewidth", 4, "color", [1, 0, 0.5]);
</pre>
      (this also shows the color feature).</li>

<li>  With gnuplot 4.2, image data is plotted with gnuplot and may be
      combined with other 2-d plot data.</li>

<li>  Lines for contour plots are generated with an Octave function, so
      contour plots are now 2-d plots instead of special 3-d plots, and
      this allows you to plot additional 2-d data on top of a contour
      plot.</li>

<li>  With the gnuplot "extended" terminals the TeX interpreter is
      emulated. However, this means that the TeX interpreter is only
      supported on the postscript terminals with gnuplot 4.0. Under
      gnuplot 4.2 the terminals aqua, dumb, png, jpeg, gif, pm, windows,
      wxt, svg and x11 are supported as well.</li>

<li>  The following plot commands are now considered obsolete and will
      be removed from a future version of Octave:
<pre>
	__gnuplot_set__
	__gnuplot_show__
	__gnuplot_plot__
	__gnuplot_splot__
	__gnuplot_replot__
</pre>
      Additionally, these functions no longer have any effect on plots
      created with the Matlab-style plot commands
      (<tt>plot</tt>, <tt>line</tt>, <tt>mesh</tt>, <tt>semilogx</tt>,
      etc.).

<li>  Plot property values are not extensively checked.  Specifying
      invalid property values may produce unpredictible results.</li>

<li>  Octave now sends data over the same pipe that is used to send
      commands to gnuplot.  While this avoids the problem of
      cluttering /tmp with data files, it is no longer possible to use
      the mouse to zoom in on plots.  This is a limitation of gnuplot,
      which is unable to zoom when the data it plots is not stored in
      a file.  Some work has been done to fix this problem in newer
      versions of gnuplot (> 4.2.2).  See for example,
      <a href="http://www.nabble.com/zooming-of-inline-data-tf4357017.html#a12416496">this thread</a> on the gnuplot development list.
</ul></li>


<li>The way Octave handles search paths has changed.  Instead of
    setting the built-in variable <tt>LOADPATH</tt>, you must
    use <tt>addpath</tt>, <tt>rmpath</tt>, or <tt>path</tt> to
    manipulate the function search path.  These functions will
    maintain <tt>"."</tt> at the head of the path, for compatibility
    with Matlab.
<p>
    Leading, trailing or doubled colons are no longer special.
    Now, all elements of the search path are explicitly included in
    the path when Octave starts.  To display the path, use
    the <tt>path</tt> function.
<p>
    Path elements that end in <tt>//</tt> are no longer searched recursively.
    Instead, you may use addpath and the genpath function to add an
    entire directory tree to the path.  For example,
<pre>
      addpath (genpath ("~/octave"));
</pre>
    will add ~/octave and all directories below it to the head of the
    path.</li>


<li>Previous versions of Octave had a number of built-in variables to
    control warnings (for example, <tt>warn_divide_by_zero</tt>).  These
    variables have been replaced by warning identifiers that are used
    with the warning function to control the state of warnings.
<p>
    For example, instead of writing
<pre>
      warn_divide_by_zero = false;
</pre>
    to disable divide-by-zero warnings, you should write
<pre>
      warning ("off", "Octave:divide-by-zero");
</pre>
    You may use the same technique in your own code to control
    warnings.  For example, you can use
<pre>
      warning ("My-package:phase-of-the-moon",
               "the phase of the moon could cause trouble today");
</pre>
    to allow users to control this warning using the
    <tt>"My-package:phase-of-the-moon"</tt> warning identifier.
<p>
    You may also enable or disable all warnings, or turn them into
    errors:
<pre>
      warning ("on", "all");
      warning ("off", "all");
      warning ("error", "Octave:divide-by-zero");
      warning ("error", "all");
</pre>
    You can query the state of current warnings using
<pre>
      warning ("query", ID)
      warning ("query")
</pre>
    (only those warning IDs which have been explicitly set are
    returned).
<p>
    A partial list and description of warning identifiers is available
    using
<pre>
      help warning_ids
</pre></li>


<li>All built-in variables have been converted to functions.  This
    change simplifies the interpreter and allows a consistent
    interface to internal variables for user-defined packages and the
    core functions distributed with Octave.  In most cases, code that
    simply accesses internal variables does not need to change.  Code
    that sets internal variables will change.  For example, instead of
    writing
<pre>
      PS1 = ">> ";
</pre>
    you will need to write
<pre>
      PS1 (">> ");
</pre>
    If you need write code that will run in both old and new versions
    of Octave, you can use something like
<pre>
      if (exist ("OCTAVE_VERSION") == 5)
        ## New:
        PS1 (">> ");
      else
        ## Old:
        PS1 = ">> ";
      endif
</pre></li>


<li>For compatibility with Matlab, the output order of Octave's
    <tt>"system"</tt> function has changed from
<pre>
      [output, status] = system (cmd);
</pre>
    to
<pre>
      [status, output] = system (cmd);
</pre></li>


<li>For compatibility with Matlab, <tt>normcdf</tt>, <tt>norminv</tt>,
    <tt>normpdf</tt>, and <tt>normrnd</tt> have been modified to
    compute distributions using the standard deviation instead of the
    variance.</li>


<li>For compatibility with Matlab, the output of Octave's fsolve
    function has been changed from
<pre>
      [x, info, msg] = fsolve (...);
</pre>
    to
<pre>
      [x, fval, info] = fsolve (...);
</pre></li>


<li>For compatibility with Matlab, <tt>normcdf</tt>, <tt>norminv</tt>,
    <tt>normpdf</tt>, and <tt>normrnd</tt> have been modified to
    compute distributions using the standard deviation instead of the
    variance.</li>


<li>For compatibility with
    Matlab, <tt>gamcdf</tt>, <tt>gaminv</tt>, <tt>gampdf</tt>,
    <tt>gamrnd</tt>, <tt>expcdf</tt>, <tt>expinv</tt>, <tt>exppdf</tt>
    and <tt>exprnd</tt> have been modified to compute the
    distributions using the standard scale factor rather than one over
    the scale factor.
</ul>
