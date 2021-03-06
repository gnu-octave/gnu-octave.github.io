---
layout: page
title: GNU Octave Version 3.6
permalink: NEWS-3.6.html
---

## Summary of important user-visible changes

January 15, 2012

{% include release_news_select.md %}

{::options parse_block_html="true" /}
<div class="panel callout">
* TOC
{:toc}
</div>
{::options parse_block_html="false" /}


<pre>
 ** The PCRE library is now required to build Octave.  If a pre-compiled
    package does not exist for your system, you can find PCRE sources
    at http://www.pcre.org

 ** The ARPACK library is no longer distributed with Octave.
    If you need the eigs or svds functions you must provide an
    external ARPACK through a package manager or by compiling it
    yourself.  If a pre-compiled package does not exist for your system,
    you can find the current ARPACK sources at
    http://forge.scilab.org/index.php/p/arpack-ng

 ** Many of Octave's binary operators (.*, .^, +, -, ...) now perform
    automatic broadcasting for array operations which allows you to use
    operator notation instead of calling bsxfun or expanding arrays (and
    unnecessarily wasting memory) with repmat or similar idioms.  For
    example, to scale the columns of a matrix by the elements of a row
    vector, you may now write

      rv .* M

    In this expression, the number of elements of rv must match the
    number of columns of M.  The following operators are affected:

      plus      +  .+
      minus     -  .-
      times     .*
      rdivide   ./
      ldivide   .\
      power     .^  .**
      lt        <
      le        <=
      eq        ==
      gt        >
      ge        >=
      ne        !=  ~=
      and       &
      or        |
      atan2
      hypot
      max
      min
      mod
      rem
      xor

    additionally, since the A op= B assignment operators are equivalent
    to A = A op B, the following operators are also affected:

      +=  -=  .+=  .-=  .*=  ./=  .\=  .^=  .**=  &=  |=

    See the "Broadcasting" section in the new "Vectorization and Faster
    Code Execution" chapter of the manual for more details.

 ** Octave now features a profiler, thanks to the work of Daniel Kraft
    under the Google Summer of Code mentorship program.  The manual has
    been updated to reflect this addition.  The new user-visible
    functions are profile, profshow, and profexplore.

 ** Overhaul of statistical distribution functions

    Functions now return "single" outputs for inputs of class "single".

    75% reduction in memory usage through use of logical indexing.

    Random sample functions now use the same syntax as rand and accept
    a comma separated list of dimensions or a dimension vector.

    Functions have been made Matlab-compatible with regard to special
    cases (probability on boundaries, probabilities for values outside
    distribution, etc.).  This may cause subtle changes to existing
    scripts.

    negative binomial function has been extended to real, non-integer
    inputs.  The discrete_inv function now returns v(1) for 0 instead of
    NaN.  The nbincdf function has been recoded to use a closed form
    solution with betainc.

 ** strread, textscan, and textread have been completely revamped.

    They now support nearly all Matlab functionality including:

      * Matlab-compatible whitespace and delimiter defaults

      * Matlab-compatible options: 'whitespace', treatasempty', format
        string repeat count, user-specified comment style, uneven-length
        output arrays, %n and %u conversion specifiers (provisionally)

 ** All .m string functions have been modified for better performance or
    greater Matlab compatibility.  Performance gains of 15X-30X have
    been demonstrated.  Operations on cell array of strings no longer pay
    quite as high a penalty as those on 2-D character arrays.

      deblank:  Now requires character or cellstr input.

      strtrim:  Now requires character or cellstr input.
                No longer trims nulls ("\0") from string for Matlab
                compatibility.

      strmatch: Follows documentation precisely and ignores trailing spaces
                in pattern and in string.  Note that this is documented
                Matlab behavior but the implementation apparently does
                not always follow it.

      substr:   Now possible to specify a negative LEN option which
                extracts to within LEN of the end of the string.

      strtok:   Now accepts cellstr input.

      base2dec, bin2dec, hex2dec:
                Now accept cellstr inputs.

      dec2base, dec2bin, dec2hex:
                Now accept cellstr inputs.

      index, rindex:
                Now accept 2-D character array input.

      strsplit: Now accepts 2-D character array input.

 ** Geometry functions derived from Qhull (convhull, delaunay, voronoi)
    have been revamped.  The options passed to the underlying qhull
    command have been changed for better results or for Matlab
    compatibility.

      convhull: Default options are "Qt" for 2D, 3D, 4D inputs
                Default options are "Qt Qx" for 5D and higher

      delaunay: Default options are "Qt Qbb Qc Qz" for 2D and 3D inputs
                Default options are "Qt Qbb Qc Qx" for 4D and higher

      voronoi:  No default arguments

 ** Date/Time functions updated.  Millisecond support with FFF format
    string now supported.

    datestr: Numerical formats 21, 22, 29 changed to match Matlab.
             Now accepts cellstr input.

 ** The following warning IDs have been removed:

      Octave:associativity-change
      Octave:complex-cmp-ops
      Octave:empty-list-elements
      Octave:fortran-indexing
      Octave:precedence-change

 ** The warning ID Octave:string-concat has been renamed to
    Octave:mixed-string-concat.

 ** Octave now includes the following Matlab-compatible preference
    functions:

      addpref  getpref  ispref  rmpref  setpref

 ** The following Matlab-compatible handle graphics functions have been
    added:

      guidata         uipanel        uitoolbar
      guihandles      uipushtool     uiwait
      uicontextmenu   uiresume       waitfor
      uicontrol       uitoggletool

    The uiXXX functions above are experimental.

    Except for uiwait and uiresume, the uiXXX functions are not
    supported with the FLTK+OpenGL graphics toolkit.

    The gnuplot graphics toolkit does not support any of the uiXXX
    functions nor the waitfor function.

 ** New keyword parfor (parallel for loop) is now recognized as a valid
    keyword.  Implementation, however, is still mapped to an ordinary
    for loop.

 ** Other new functions added in 3.6.0:

      bicg                       nthargout                   usejava
      is_dq_string               narginchk                   waitbar
      is_sq_string               python                      zscore
      is_function_handle         register_graphics_toolkit
      loaded_graphics_toolkits   recycle

 ** Deprecated functions.

    The following functions were deprecated in Octave 3.2 and have been
    removed from Octave 3.6.

      create_set          spcholinv    splu
      dmult               spcumprod    spmax
      iscommand           spcumsum     spmin
      israwcommand        spdet        spprod
      lchol               spdiag       spqr
      loadimage           spfind       spsum
      mark_as_command     sphcat       spsumsq
      mark_as_rawcommand  spinv        spvcat
      spatan2             spkron       str2mat
      spchol              splchol      unmark_command
      spchol2inv          split        unmark_rawcommand

    The following functions have been deprecated in Octave 3.6 and will
    be removed from Octave 3.10 (or whatever version is the second major
    release after 3.6):

      cut                is_duplicate_entry
      cor                polyderiv
      corrcoef           shell_cmd
      __error_text__     studentize
      error_text         sylvester_matrix
</pre>
