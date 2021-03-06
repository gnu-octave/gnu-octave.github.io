---
layout: page
title: GNU Octave Version 3.2
permalink: NEWS-3.2.html
---

## Summary of important user-visible changes

June 5, 2009

{% include release_news_select.md %}

{::options parse_block_html="true" /}
<div class="panel callout">
* TOC
{:toc}
</div>
{::options parse_block_html="false" /}


<pre>
 ** Compatibility with Matlab graphics has been improved.

    The hggroup object and associated listener callback functions have
    been added allowing the inclusion of group objects.  Data sources
    have been added to these group objects such that

           x = 0:0.1:10;
           y = sin (x);
           plot (x, y, "ydatasource", "y");
           for i = 1 : 100
             pause(0.1)
             y = sin (x + 0.1 * i);
             refreshdata();
           endfor

    works as expected.  This capability has be used to introduce
    stem-series, bar-series, etc., objects for better Matlab
    compatibility.

 ** New graphics functions:

      addlistener         ezcontour   gcbo         refresh
      addproperty         ezcontourf  ginput       refreshdata
      allchild            ezmesh      gtext        specular
      available_backends  ezmeshc     intwarning   surfl
      backend             ezplot      ishghandle   trisurf
      cla                 ezplot3     isocolors    waitforbuttonpress
      clabel              ezpolar     isonormals
      comet               ezsurf      isosurface
      dellistener         findall     linkprop
      diffuse             gcbf        plotmatrix

 ** New experimental OpenGL/FLTK based plotting system.

    An experimental plotting system based on OpenGL and the FLTK
    toolkit is now part of Octave.  This backend is disabled by
    default.  You can switch to using it with the command

        backend ("fltk")

    for all future figures or for a particular figure with the command

        backend (h, "fltk")

    where "h" is a valid figure handle.  Please note that this backend
    does not yet support text objects.  Obviously, this is a necessary
    feature before it can be considered usable.  We are looking for
    volunteers to help implement this missing feature.

 ** Functions providing direct access to gnuplot have been removed.

    The functions __gnuplot_plot__, __gnuplot_set__, __gnuplot_raw__,
     __gnuplot_show__, __gnuplot_replot__, __gnuplot_splot__,
     __gnuplot_save_data__ and __gnuplot_send_inline_data__ have been
     removed from Octave.  These function were incompatible with the
     high level graphics handle code.

 ** The Control, Finance and Quaternion functions have been removed.

    These functions are now available as separate packages from

      http://octave.sourceforge.net/packages.html

    and can be reinstalled using the Octave package manager (see
    the pkg function).

 ** Specific sparse matrix functions removed.

    The following functions, which handled only sparse matrices have
    been removed.  Instead of calling these functions directly, you
    should use the corresponding function without the "sp" prefix.

      spatan2     spcumsum  spkron   spprod
      spchol      spdet     splchol  spqr
      spchol2inv  spdiag    splu     spsum
      spcholinv   spfind    spmax    spsumsqk
      spcumprod   spinv     spmin

 ** Improvements to the debugger.

    The interactive debugging features have been improved.  Stopping
    on statements with dbstop should work correctly now.  Stepping
    into and over functions, and stepping one statement at a time
    (with dbstep) now works.  Moving up and down the call stack with
    dbup and dbdown now works.  The dbstack function is now available
    to print the current function call stack.  The new dbquit function
    is available to exit the debugging mode.

 ** Improved traceback error messages.

    Traceback error messages are much more concise and easier to
    understand.  They now display information about the function call
    stack instead of the stack of all statements that were active at
    the point of the error.

 ** Object Oriented Programming.

    Octave now includes OOP features and the user can create their own
    class objects and overloaded functions and operators.  For
    example, all methods of a class called "myclass" will be found in
    a directory "@myclass" on the users path.  The class specific
    versions of functions and operators take precedence over the
    generic versions of these functions.

    New functions related to OOP include

      class  inferiorto  isobject  loadobj  methods  superiorto

    See the Octave manual for more details.

 ** Parsing of Command-style Functions.

    Octave now parses command-style functions without needing to first
    declare them with "mark_as_command".  The rules for recognizing a
    command-style function calls are

      * A command must appear as the first word in a statement,
        followed by a space.

      * The first character after the space must not be '=' or '('

      * The next token after the space must not look like a binary
        operator.

    These rules should be mostly compatible with the way Matlab parses
    command-style function calls and allow users to define commands in
    .m files without having to mark them as commands.

    Note that previous versions of Octave allowed expressions like

      x = load -text foo.dat

    but an expression like this will now generate a parse error.  In
    order to assign the value returned by a function to a variable,
    you must use the normal function call syntax:

      x = load ("-text", "foo.dat");

 ** Block comments.

    Commented code can be between matching "#{" and "#}" or "%{" and
    "%}" markers, even if the commented code spans several line.  This
    allows blocks code to be commented, without needing to comment
    each line.  For example,

    function [s, t] = func (x, y)
      s = 2 * x;
    #{
      s *= y;
      t = y + x;
    #}
    endfunction

    the lines "s *= y;" and "t = y + x" will not be executed.

 ** Special treatment in the parser of expressions like "a' * b".

    In these cases the transpose is no longer explicitly formed and
    BLAS libraries are called with the transpose flagged,
    significantly improving performance for these kinds of
    operations.

 ** Single Precision data type.

    Octave now includes a single precision data type.  Single
    precision variables can be created with the "single" command, or
    from functions like ones, eye, etc.  For example,

      single (1)
      ones (2, 2, "single")
      zeros (2, 2, "single")
      eye (2, 2, "single")
      Inf (2, 2, "single")
      NaN (2, 2, "single")
      NA (2, 2, "single")

    all create single precision variables.  For compatibility with
    Matlab, mixed double/single precision operators and functions
    return single precision types.

    As a consequence of this addition to Octave the internal
    representation of the double precision NA value has changed, and
    so users that make use of data generated by Octave with R or
    visa-versa are warned that compatibility might not be assured.

 ** Improved array indexing.

    The underlying code used for indexing of arrays has been
    completely rewritten and indexing is now significantly faster.

 ** Improved memory management.

    Octave will now attempt to share data in some cases where previously
    a copy would be made, such as certain array slicing operations or
    conversions between cells, structs and cs-lists.  This usually reduces
    both time and memory consumption.
    Also, Octave will now attempt to detect and optimize usage of a vector
    as a stack, when elements are being repeatedly inserted at/removed from
    the end of the vector.

 ** Improved performance for reduction operations.

    The performance of the sum, prod, sumsq, cumsum, cumprod, any, all,
    max and min functions has been significantly improved.

 ** Sorting and searching.

    The performance of sort has been improved, especially when sorting
    indices are requested. An efficient built-in issorted implementation
    was added. sortrows now uses a more efficient algorithm, especially
    in the homegeneous case. lookup is now a built-in function performing
    a binary search, optimized for long runs of close elements. Lookup
    also works with cell arrays of strings.

 ** Range arithmetics

    For some operations on ranges, Octave will attempt to keep the result as a
    range.  These include negation, adding a scalar, subtracting a scalar, and
    multiplying by a scalar. Ranges with zero increment are allowed and can be
    constructed using the built-in function `ones'.

 ** Various performance improvements.

    Performance of a number of other built-in operations and functions was
    improved, including:

    * logical operations
    * comparison operators
    * element-wise power
    * accumarray
    * cellfun
    * isnan
    * isinf
    * isfinite
    * nchoosek
    * repmat
    * strcmp

 ** 64-bit integer arithmetic.

    Arithmetic with 64-bit integers (int64 and uint64 types) is fully
    supported, with saturation semantics like the other integer types.
    Performance of most integer arithmetic operations has been
    improved by using integer arithmetic directly.  Previously, Octave
    performed integer math with saturation semantics by converting the
    operands to double precision, performing the operation, and then
    converting the result back to an integer value, truncating if
    necessary.

 ** Diagonal and permutation matrices.

    The interpreter can now treat diagonal and permutation matrices as
    special objects that store only the non-zero elements, rather than
    general full matrices.  Therefore, it is now possible to construct
    and use these matrices in linear algebra without suffering a
    performance penalty due to storing large numbers of zero elements.

 ** Improvements to fsolve.

    The fsolve function now accepts an option structure argument (see
    also the optimset function).  The INFO values returned from fsolve
    have changed to be compatible with Matlab's fsolve function.
    Additionally, fsolve is now able to solve overdetermined systems,
    complex-differentiable complex systems, systems with a sparse
    jacobian and can work in single precision if given single precision
    inputs.  It can also be called recursively.

 ** Improvements to the norm function.

    The norm function is now able to compute row or column norms of a
    matrix in a single call, as well as general matrix p-norms.

 ** New functions for computing some eigenvalues or singular values.

    The eigs and svds functions have been included in Octave.  These
    functions require the ARPACK library (now distributed under a
    GPL-compatible license).

 ** New QR and Cholesky factorization updating functions.

      choldelete  cholshift   qrdelete  qrshift
      cholinsert  cholupdate  qrinsert  qrupdate

 ** New quadrature functions.

      dblquad  quadgk  quadv  triplequad

 ** New functions for reading and writing images.

    The imwrite and imread functions have been included in Octave.
    These functions require the GraphicsMagick library.  The new
    function imfinfo provides information about an image file (size,
    type, colors, etc.)

 ** The input_event_hook function has been replaced by the pair of
    functions add_input_event_hook and remove_input_event_hook so that
    more than one hook function may be installed at a time.

 ** Other miscellaneous new functions.

      addtodate          hypot                       reallog
      bicgstab           idivide                     realpow
      cellslices         info                        realsqrt
      cgs                interp1q                    rectint
      command_line_path  isdebugmode                 regexptranslate
      contrast           isfloat                     restoredefaultpath
      convn              isstrprop                   roundb
      cummin             log1p                       rundemos
      cummax             lsqnonneg                   runlength
      datetick           matlabroot                  saveobj
      display            namelengthmax               spaugment
      expm1              nargoutchk                  strchr
      filemarker         pathdef                     strvcat
      fstat              perl                        subspace
      full               prctile                     symvar
      fzero              quantile                    treelayout
      genvarname         re_read_readline_init_file  validatestring
      histc

 ** Changes to strcat.

    The strcat function is now compatible with Matlab's strcat
    function, which removes trailing whitespace when concatenating
    character strings.  For example

      strcat ('foo ', 'bar')
      ==> 'foobar'

    The new function cstrcat provides the previous behavior of
    Octave's strcat.

 ** Improvements to the help functions.

    The help system has been mostly re-implemented in .m files to make
    it easier to modify.  Performance of the lookfor function has been
    greatly improved by caching the help text from all functions that
    are distributed with Octave.  The pkg function has been modified
    to generate cache files for external packages when they are
    installed.

 ** Deprecated functions.

    The following functions were deprecated in Octave 3.0 and will be
    removed in Octave 3.4 (or whatever version is the second major
    release after 3.0):

      beta_cdf         geometric_pdf        pascal_pdf
      beta_inv         geometric_rnd        pascal_rnd
      beta_pdf         hypergeometric_cdf   poisson_cdf
      beta_rnd         hypergeometric_inv   poisson_inv
      binomial_cdf     hypergeometric_pdf   poisson_pdf
      binomial_inv     hypergeometric_rnd   poisson_rnd
      binomial_pdf     intersection         polyinteg
      binomial_rnd     is_bool              setstr
      chisquare_cdf    is_complex           struct_contains
      chisquare_inv    is_list              struct_elements
      chisquare_pdf    is_matrix            t_cdf
      chisquare_rnd    is_scalar            t_inv
      clearplot        is_square            t_pdf
      clg              is_stream            t_rnd
      com2str          is_struct            uniform_cdf
      exponential_cdf  is_symmetric         uniform_inv
      exponential_inv  is_vector            uniform_pdf
      exponential_pdf  isstr                uniform_rnd
      exponential_rnd  lognormal_cdf        weibcdf
      f_cdf            lognormal_inv        weibinv
      f_inv            lognormal_pdf        weibpdf
      f_pdf            lognormal_rnd        weibrnd
      f_rnd            meshdom              weibull_cdf
      gamma_cdf        normal_cdf           weibull_inv
      gamma_inv        normal_inv           weibull_pdf
      gamma_pdf        normal_pdf           weibull_rnd
      gamma_rnd        normal_rnd           wiener_rnd
      geometric_cdf    pascal_cdf
      geometric_inv    pascal_inv

    The following functions are now deprecated in Octave 3.2 and will
    be removed in Octave 3.6 (or whatever version is the second major
    release after 3.2):

      create_set          spcholinv  spmax
      dmult               spcumprod  spmin
      iscommand           spcumsum   spprod
      israwcommand        spdet      spqr
      lchol               spdiag     spsum
      loadimage           spfind     spsumsq
      mark_as_command     spinv      str2mat
      mark_as_rawcommand  spkron     unmark_command
      spatan2             splchol    unmark_rawcommand
      spchol              split
      spchol2inv          splu

See NEWS.3 for old news.
</pre>
