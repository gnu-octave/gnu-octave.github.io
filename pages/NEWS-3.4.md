---
layout: page
title: GNU Octave Version 3.4
permalink: NEWS-3.4.html
---

## Summary of important user-visible changes

February 8, 2011

{% include release_news_select.md %}

{::options parse_block_html="true" /}
<div class="panel callout">
* TOC
{:toc}
</div>
{::options parse_block_html="false" /}


<pre>
 ** IMPORTANT note about binary incompatibility in this release:

    Binary compatibility for all 3.4.x releases was originally planned,
    but this is impossible for the 3.4.1 release due to a bug in the way
    shared libraries were built in Octave 3.4.0.  Because of this bug,
    .oct files built for Octave 3.4.0 must be recompiled before they
    will work with Octave 3.4.1.

    Given that there would be binary incompatibilities with shared
    libraries going from Octave 3.4.0 to 3.4.1, the following
    incompatible changes were also made in this release:

      * The Perl Compatible Regular Expression (PCRE) library is now
        required to build Octave.

      * Octave's libraries and .oct files are now installed in
        subdirectories of $libdir instead of $libexecdir.

    Any future Octave 3.4.x release versions should remain binary
    compatible with Octave 3.4.1 as proper library versioning is now
    being used as recommended by the libtool manual.

 ** The following functions have been deprecated in Octave 3.4.1 and will
    be removed from Octave 3.8 (or whatever version is the second major
    release after 3.4):

      cquad  is_duplicate_entry  perror  strerror

 ** The following functions are new in 3.4.1:

      colstyle  gmres  iscolumn  isrow  mgorth  nproc  rectangle

 ** The get_forge_pkg function is now private.

 ** The rectangle_lw, rectangle_sw, triangle_lw, and triangle_sw
    functions are now private.

 ** The logistic_regression_derivatives and logistic_regression_likelihood
    functions are now private.

 ** ChangeLog files in the Octave sources are no longer maintained
    by hand.  Instead, there is a single ChangeLog file generated from
    the Mercurial version control commit messages.  Older ChangeLog
    information can be found in the etc/OLD-ChangeLogs directory in the
    source distribution.

Summary of important user-visible changes for version 3.4:
---------------------------------------------------------

 ** BLAS and LAPACK libraries are now required to build Octave.  The
    subset of the reference BLAS and LAPACK libraries has been removed
    from the Octave sources.

 ** The `lookup' function was extended to be more useful for
    general-purpose binary searching.  Using this improvement, the
    ismember function was rewritten for significantly better
    performance.

 ** Real, integer and logical matrices, when used in indexing, will now
    cache the internal index_vector value (zero-based indices) when
    successfully used as indices, eliminating the conversion penalty for
    subsequent indexing by the same matrix.  In particular, this means it
    is no longer needed to avoid repeated indexing by logical arrays
    using find for performance reasons.

 ** Logical matrices are now treated more efficiently when used as
    indices.  Octave will keep the index as a logical mask unless the
    ratio of true elements is small enough, using a specialized
    code.  Previously, all logical matrices were always first converted
    to index vectors.  This results in savings in both memory and
    computing time.

 ** The `sub2ind' and `ind2sub' functions were reimplemented as compiled
    functions for better performance.  These functions are now faster,
    can deliver more economized results for ranges, and can reuse the
    index cache mechanism described in previous paragraph.

 ** The built-in function equivalents to associative operators (`plus',
    `times', `mtimes', `and', and `or') have been extended to accept
    multiple arguments.  This is especially useful for summing
    (multiplying, etc.) lists of objects (of possibly distinct types):

      matrix_sum = plus (matrix_list{:});

 ** An FTP object type based on libcurl has been implemented.  These
    objects allow ftp connections, downloads and uploads to be
    managed.  For example,

      fp = ftp ("ftp.octave.org);
      cd (fp, "gnu/octave");
      mget (fp, "octave-3.2.3.tar.bz2");
      close (fp);

 ** The default behavior of `assert (observed, expected)' has been
    relaxed to employ less strict checking that does not require the
    internals of the values to match.  This avoids previously valid
    tests from breaking due to new internal classes introduced in future
    Octave versions.

    For instance, all of these assertions were true in Octave 3.0.x
    but false in 3.2.x due to new optimizations and improvements:

      assert (2*linspace (1, 5, 5), 2*(1:5))
      assert (zeros (0, 0), [])
      assert (2*ones (1, 5), (2) (ones (1,5)))

 ** The behavior of library functions `ismatrix', `issquare', and
    `issymmetric' has been changed for better consistency.

    * The `ismatrix' function now returns true for all numeric,
      logical and character 2-D or N-D matrices.  Previously, `ismatrix'
      returned false if the first or second dimension was zero.
      Hence, `ismatrix ([])' was false,
      while `ismatrix (zeros (1,2,0))' was true.

    * The `issquare' function now returns a logical scalar, and is
      equivalent to the expression

        ismatrix (x) && ndims (x) == 2 && rows (x) == columns (x)

      The dimension is no longer returned.  As a result, `issquare ([])'
      now yields true.

    * The `issymmetric' function now checks for symmetry instead of
      Hermitianness.  For the latter, ishermitian was created.  Also,
      logical scalar is returned rather than the dimension, so
      `issymmetric ([])' is now true.

 ** Function handles are now aware of overloaded functions.  If a
    function is overloaded, the handle determines at the time of its
    reference which function to call.  A non-overloaded version does not
    need to exist.

 ** Overloading functions for built-in classes (double, int8, cell,
    etc.) is now compatible with Matlab.

 ** Function handles can now be compared with the == and != operators,
    as well as the `isequal' function.

 ** Performance of concatenation (using []) and the functions `cat',
    `horzcat', and `vertcat' has been improved for multidimensional
    arrays.

 ** The operation-assignment operators +=, -=, *= and /= now behave more
    efficiently in certain cases.  For instance, if M is a matrix and S a
    scalar, then the statement

      M += S;

    will operate on M's data in-place if it is not shared by another
    variable, usually increasing both time and memory efficiency.

    Only selected common combinations are affected, namely:

      matrix += matrix
      matrix -= matrix
      matrix .*= matrix
      matrix ./= matrix

      matrix += scalar
      matrix -= scalar
      matrix *= scalar
      matrix /= scalar

      logical matrix |= logical matrix
      logical matrix &= logical matrix

    where matrix and scalar belong to the same class.  The left-hand
    side must be a simple variable reference.

    Moreover, when unary operators occur in expressions, Octave will
    also try to do the operation in-place if it's argument is a
    temporary expresssion.

 ** The effect of comparison operators (<, >, <=, and >=) applied to
    complex numbers has changed to be consistent with the strict
    ordering defined by the `max', `min', and `sort' functions.  More
    specifically, complex numbers are compared by lexicographical
    comparison of the pairs `[abs(z), arg(z)]'.  Previously, only real
    parts were compared; this can be trivially achieved by wrapping the
    operands in real().

 ** The automatic simplification of complex computation results has
    changed.  Octave will now simplify any complex number with a zero
    imaginary part or any complex matrix with all elements having zero
    imaginary part to a real value.  Previously, this was done only for
    positive zeros.  Note that the behavior of the complex function is
    unchanged and it still produces a complex value even if the
    imaginary part is zero.

 ** As a side effect of code refactoring in liboctave, the binary
    logical operations are now more easily amenable to compiler
    optimizations and are thus significantly faster.

 ** Octave now allows user-defined `subsasgn' methods to optimize out
    redundant copies.  For more information, see the manual.

 ** More efficient matrix division handling.  Octave is now able to
    handle the expressions

       M' \ V
       M.' \ V
       V / M

    (M is a matrix and V is a vector) more efficiently in certain cases.
    In particular, if M is triangular, all three expressions will be
    handled by a single call to xTRTRS (from LAPACK), with appropriate
    flags.  Previously, all three expressions required a physical
    transpose of M.

 ** More efficient handling of certain mixed real-complex matrix
    operations.  For instance, if RM is a real matrix and CM a complex
    matrix,

      RM * CM

    can now be evaluated either as

      complex (RM * real (CM), RM * imag (CM))

    or as

      complex (RM) * CM,

    depending on the dimensions.  The first form requires more
    temporaries and copying, but halves the FLOP count, which normally
    brings better performance if RM has enough rows.  Previously, the
    second form was always used.

    Matrix division is similarly affected.

 ** More efficient handling of triangular matrix factors returned from
    factorizations.  The functions for computing QR, LU and Cholesky
    factorizations will now automatically return the triangular matrix
    factors with proper internal matrix_type set, so that it won't need
    to be computed when the matrix is used for division.

 ** The built-in `sum' function now handles the non-native summation
    (i.e., double precision sum of single or integer inputs) more
    efficiently, avoiding a temporary conversion of the whole input
    array to doubles.  Further, `sum' can now accept an extra option
    argument, using a compensated summation algorithm rather than a
    straightforward sum, which significantly improves precision if lots
    of cancellation occurs in the summation.

 ** The built-in `bsxfun' function now uses optimized code for certain
    cases where built-in operator handles are passed in.  Namely, the
    optimizations concern the operators `plus', `minus', `times',
    `ldivide', `rdivide', `power', `and', `or' (for logical arrays),
    the relational operators `eq', `ne', `lt', `le', `gt', `ge', and the
    functions `min' and `max'.  Optimizations only apply when both
    operands are of the same built-in class.  Mixed real/complex and
    single/double operations will first convert both operands to a
    common type.

 ** The `strfind' and `strrep' functions now have compiled
    implementations, facilitating significantly more efficient searching
    and replacing in strings, especially with longer patterns.  The code
    of `strcat' has been vectorized and is now much more efficient when
    many strings are concatenated.  The `strcmpi' and `strncmpi'
    functions are now built-in functions, providing better performance.

 ** Matlab-style ignoring input and output function arguments using
    tilde (~) is now supported.  Ignored output arguments may be
    detected from a function using the built-in function `isargout'.
    For more details, consult the manual.

 ** The list datatype, deprecated since the introduction of cells, has
    been removed.

 ** The accumarray function has been optimized and is now significantly
    faster in certain important cases.

 ** The behavior of isreal and isnumeric functions was changed to be more
    Matlab-compatible.

 ** The integer math & conversion warnings (Octave:int-convert-nan,
    Octave:int-convert-non-int-val, Octave:int-convert-overflow,
    Octave:int-math-overflow) have been removed.

 ** rem and mod are now built-in functions.  They also handle integer
    types efficiently using integer arithmetic.

 ** Sparse indexing and indexed assignment has been mostly rewritten.
    Since Octave uses compressed column storage for sparse matrices,
    major attention is devoted to operations manipulating whole columns.
    Such operations are now significantly faster, as well as some other
    important cases.

    Further, it is now possible to pre-allocate a sparse matrix and
    subsequently fill it by assignments, provided they meet certain
    conditions.  For more information, consult the `spalloc' function,
    which is no longer a mere dummy.  Consequently, nzmax and nnz are no
    longer always equal in Octave.  Octave may also produce a matrix
    with nnz < nzmax as a result of other operations, so you should
    consistently use nnz unless you really want to use nzmax (i.e. the
    space allocated for nonzero elements).

    Sparse concatenation is also affected, and concatenating sparse
    matrices, especially larger collections, is now significantly more
    efficient.  This applies to both the [] operator and the
    cat/vertcat/horzcat functions.

 ** It is now possible to optionally employ the xGESDD LAPACK drivers
    for computing the singular value decomposition using svd(), instead
    of the default xGESVD, using the configuration pseudo-variable
    svd_driver.  The xGESDD driver can be up to 6x times faster when
    singular vectors are requested, but is reported to be somewhat less
    robust on highly ill-conditioned matrices.

 ** Configuration pseudo-variables, such as page_screen_output or
    confirm_recursive_rmdir (or the above mentioned svd_driver), now
    accept a "local" option as second argument, requesting the change
    to be undone when the current function returns:

    function [status, msg] = rm_rf (dir)
      confirm_recursive_rmdir (false, "local");
      [status, msg] = rmdir (dir, "s");
      ...
    endfunction

    Upon return, confirm_recursive_rmdir will be restored to the value
    it had on entry to the function, even if there were subsequent
    changes to the variable in function rm_rf or any of the functions
    it calls.

 ** pkg now accepts a -forge option for downloading and installing
    packages from Octave Forge automatically.  For example,

      pkg install -forge general

    will automatically download the latest release of the general
    package and attempt to install it. No automatic resolving of
    dependencies is provided.  Further,

      pkg list -forge

    can be used to list all available packages.

  ** The internal data representation of structs has been completely
     rewritten to make certain optimizations feasible.  The field data
     can now be shared between structs with equal keys but different
     dimensions or values, making operations that preserve the fields
     faster.  Economized storage is now used for scalar structs (just
     like most other scalars), making their usage more
     memory-efficient.  Certain array-like operations on structs
     (concatenation, uniform cellfun, num2cell) have gained a
     significant speed-up.  Additionally, the octave_scalar_map class
     now provides a simpler interface to work with scalar structs within
     a C++ DLD function.

  ** Two new formats are available for displaying numbers:

       format short eng
       format long eng

     Both display numbers in engineering notation, i.e., mantissa +
     exponent where the exponent is a multiple of 3.

  ** The following functions are new in Octave 3.4:

       accumdim    erfcx        nfields      pqpnonneg  uigetdir
       bitpack     fileread     nth_element  quadcc     uigetfile
       bitunpack   fminbnd      onCleanup    randi      uiputfile
       blkmm       fskipl       pbaspect     repelems   uimenu
       cbrt        ifelse       pie3         reset      whitebg
       curl        ishermitian  powerset     rsf2csf
       chop        isindex      ppder        saveas
       daspect     luupdate     ppint        strread
       divergence  merge        ppjumps      textread

  ** Using the image function to view images with external programs such
     as display, xv, and xloadimage is no longer supported.  The
     image_viewer function has also been removed.

  ** The behavior of struct assignments to non-struct values has been
     changed.  Previously, it was possible to overwrite an arbitrary
     value:

        a = 1;
        a.x = 2;

     This is no longer possible unless a is an empty matrix or cell
     array.

  ** The dlmread function has been extended to allow specifying a custom
     value for empty fields.

  ** The dlmread and dlmwrite functions have been modified to accept
     file IDs (as returned by fopen) in addition to file names.

  ** Octave can now optimize away the interpreter overhead of an
     anonymous function handle, if the function simply calls another
     function or handle with some of its parameters bound to certain
     values.  Example:

       f = @(x) sum (x, 1);

     When f is called, the call is forwarded to @sum with the constant 1
     appended, and the anonymous function call does not occur on the
     call stack.

 ** Deprecated functions.

    The following functions were deprecated in Octave 3.0 and have been
    removed from Octave 3.4.

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

    The following functions were deprecated in Octave 3.2 and will
    be removed from Octave 3.6 (or whatever version is the second major
    release after 3.2):

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

    The following functions have been deprecated in Octave 3.4 and will
    be removed from Octave 3.8 (or whatever version is the second major
    release after 3.4):

      autocor  cellidx   gammai     krylovb    values
      autocov  dispatch  glpkmex    replot
      betai    fstat     is_global  saveimage

  * For compatibility with Matlab, mu2lin (x) is now equivalent to
    mu2lin (x, 0).

  * The ARPACK library is now distributed with Octave so it no longer
    needs to be available as an external dependency when building
    Octave.
</pre>
