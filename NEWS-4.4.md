---
layout: default
---

<pre>
Summary of important user-visible changes for version 4.4 (2018-04-30):
----------------------------------------------------------------------

 ** A graphical Variable Editor has been added to the GUI interface.
    It uses a spreadsheet-like interface for quick, intuitive editing
    of variables.  The Variable Editor is launched by double-clicking
    on a variable name in the Workspace Window or by typing
    "openvar VARIABLE_NAME" in the Command Window.

 ** On systems with 64-bit pointers, --enable-64 is now the default and
    Octave always uses 64-bit indexing.  However, if the configure
    script determines that the BLAS library uses 32-bit integers, then
    operations using the following libraries are limited to arrays with
    dimensions that are smaller than 2^31 elements:

      BLAS  LAPACK  QRUPDATE  SuiteSparse  ARPACK

    Additionally, the following libraries use "int" internally, so
    maximum problem sizes are always limited:

      glpk  Qhull

 ** The octave command no longer starts the GUI by default.  Most users
    starting Octave from a shell were expecting the command line
    interface, and desktop launchers already required the `--force-gui'
    option.  With this change, desktop launchers should be modified to
    use the new option `--gui'.  The previous `--force-gui' option will
    continue to work, and maps to `--gui', but it will be removed in
    Octave 6.

 ** A known bug in Qt (https://bugreports.qt.io/browse/QTBUG-55357) is
    addressed by limiting GUI sub-panel relocation capabilities for Qt
    versions in the range >= 5.6.1 and < 5.7.1.  However, this may not
    thoroughly avoid issues on all platforms.

 ** A new container data type--containers.Map--is available.  Map is a
    key/value storage container (a.k.a, a hash) that efficiently allows
    storing and retrieving values by name, rather than by position which
    is how arrays work.

 ** The bareword "import" is now recognized in scripts and functions.
    However, the functionality to import functions and classes from
    other namespaces into the local scope has not yet been implemented.
    Attempting to use "import" will provoke an error message.

 ** hex2num and num2hex now work for integer and char types and num2hex
    may optionally return a cell array of strings instead of a character
    array.  If given a cell array of strings, hex2num now returns a
    numeric array of the same size as the input cell array.  Previously,
    hex2num would accept a cell array of strings of arbitrary dimension
    but would always return a column vector.

 ** New special functions cosint, sinint, and gammaincinv have been added.

 ** Special functions in Octave have been rewritten for larger input
    domains, better accuracy, and additional options.
    * gammainc now accepts negative real values for X.
    * improved accuracy for gammainc, betainc, betaincinv, expint.
    * gammainc has new options "scaledlower" and "scaledupper".
    * betainc, betaincinv have new option "upper".

 ** The "names" option used in regular expressions now returns a struct
    array, rather than a struct with a cell array for each field.  This
    change was made for Matlab compatibility.

 ** The quadcc function now uses both absolute tolerance and relative
    tolerance to determine the stopping criteria for an integration.
    To be compatible with other quadXXX functions, such as quadgk, the
    calling syntax has changed to

      quadcc (f, a, b, [AbsTol, [RelTol]])

    To update existing code, change instances of RelTol to [0, RelTol].

      quadcc (f, a, b, tol) => quadcc (f, a, b, [0, tol])

    A warning that a single tolerance input is now interpreted as an
    absolute tolerance will be issued in Octave versions 4.4 and 5,
    after which it will be removed.  The warning has ID
    "Octave:quadcc:RelTol-conversion" and can be disabled with

      warning ("off", "Octave:quadcc:RelTol-conversion")

 ** The qr function now returns a standard factorization unless
    explicitly instructed to perform an economy factorization by using a
    final argument of 0.

 ** The Qt graphics toolkit now supports offscreen printing without osmesa
    if Octave was built with Qt >= 5.1.

 ** The built-in pager for display of large data is now disabled by
    default.  To re-enable it for every Octave session add the following
    to your .octaverc file:

      more on;

 ** The FLTK toolkit is no longer prioritized for development.  The
    number of Octave Maintainers is too small to support three different
    graphic toolkits.  New development will target the Qt toolkit.
    While no longer prioritized, the FLTK toolkit is not deprecated and
    there is no schedule for its removal.

 ** The graphic object property "PickableParts" has been implemented
    which controls whether an object can accept mouse clicks.

 ** The graphic object property "Interruptible" has been fully
    implemented which controls whether a running callback function can
    be interrupted by another callback function.

 ** The graphic object property "HitTest" has been updated to be fully
    compatible with Matlab.

 ** Text objects now implement the properties "BackgroundColor",
    "EdgeColor", "LineStyle", "LineWidth", and "Margin".

 ** An initial implementation of alpha transparency has been made for
    patch and surface objects.  Printing to svg and pdf is supported.

 ** ishandle now returns true for both graphics handle objects and
    Java objects.  The latter change was made for Matlab compatibility.
    Use ishghandle or isgraphics if it is important not to include Java
    objects.

 ** The pkg command now accepts a URL as an argument, allowing a valid
    Octave package to be installed from any remote host with one command,
    for example

      pkg install https://example.org/download/example-package.tar.gz

 ** The following statistical functions have been moved from core
    Octave to the statistics package available from Octave Forge.

    BASE
      cloglog
      logit
      prctile
      probit
      qqplot
      table  (renamed to crosstab)

    DISTRIBUTIONS
      betacdf
      betainv
      betapdf
      betarnd
      binocdf
      binoinv
      binopdf
      binornd
      cauchy_cdf
      cauchy_inv
      cauchy_pdf
      cauchy_rnd
      chi2cdf
      chi2inv
      chi2pdf
      chi2rnd
      expcdf
      expinv
      exppdf
      exprnd
      fcdf
      finv
      fpdf
      frnd
      gamcdf
      gaminv
      gampdf
      gamrnd
      geocdf
      geoinv
      geopdf
      geornd
      hygecdf
      hygeinv
      hygepdf
      hygernd
      kolmogorov_smirnov_cdf
      laplace_cdf
      laplace_inv
      laplace_pdf
      laplace_rnd
      logistic_cdf
      logistic_inv
      logistic_pdf
      logistic_rnd
      logncdf
      logninv
      lognpdf
      lognrnd
      nbincdf
      nbininv
      nbinpdf
      nbinrnd
      normcdf
      norminv
      normpdf
      normrnd
      poisscdf
      poissinv
      poisspdf
      poissrnd
      stdnormal_cdf
      stdnormal_inv
      stdnormal_pdf
      stdnormal_rnd
      tcdf
      tinv
      tpdf
      trnd
      unidcdf
      unidinv
      unidpdf
      unidrnd
      unifcdf
      unifinv
      unifpdf
      unifrnd
      wblcdf
      wblinv
      wblpdf
      wblrnd
      wienrnd

    MODELS
      logistic_regression

    TESTS
      anova
      bartlett_test
      chisquare_test_homogeneity
      chisquare_test_independence
      cor_test
      f_test_regression
      hotelling_test
      hotelling_test_2
      kolmogorov_smirnov_test
      kolmogorov_smirnov_test_2
      kruskal_wallis_test
      manova
      mcnemar_test
      prop_test_2
      run_test
      sign_test
      t_test
      t_test_2
      t_test_regression
      u_test
      var_test
      welch_test
      wilcoxon_test
      z_test
      z_test_2

 ** The following image functions have been moved from core Octave to
    the image package available from Octave Forge.

      ntsc2rgb
      rgb2ntsc

 ** Other new functions added in 4.4:

      bounds
      camlookat
      camorbit
      campos
      camroll
      camtarget
      camup
      camva
      camzoom
      corrcoef
      cosint
      decic
      erase
      gammaincinv
      getframe
      groot
      gsvd
      hgtransform
      humps
      integral
      integral2
      integral3
      isgraphics
      isstring
      mad
      ode15i
      ode15s
      openvar
      quad2d
      repelem
      rgb2gray
      rticks
      sinint
      tfqmr
      thetaticks
      vecnorm
      winqueryreg
      xticklabels
      xticks
      yticklabels
      yticks
      zticklabels
      zticks

 ** Deprecated functions.

    The following functions have been deprecated in Octave 4.4 and will
    be removed from Octave 6 (or whatever version is the second major
    release after 4.4):

      Function             | Replacement
      ---------------------|------------------
      chop                 | sprintf for visual results
      desktop              | isguirunning
      tmpnam               | tempname
      toascii              | double
      java2mat             | __java2mat__


 ** The following functions were deprecated in Octave 4.0 and have been
    removed from Octave 4.4.

      allow_noninteger_range_as_index
      bicubic
      delaunay3
      do_braindead_shortcircuit_evaluation
      dump_prefs
      find_dir_in_path
      finite
      fmod
      fnmatch
      gmap40
      loadaudio
      luinc
      mouse_wheel_zoom
      nfields
      octave_tmp_file_name
      playaudio
      saveaudio
      setaudio
      syl
      usage

 ** The "Octave:undefined-return-values" warning ID is obsolete.  Octave
    now throws an error for any attempts to assign undefined values that
    might be returned from functions.

 ** Deprecated graphics properties.

    The following properties or allowed corresponding values have been
    deprecated in Octave 4.4 and will be removed from Octave 6 (or whatever
    version is the second major release after 4.4):

      Object               | Property                | Value
      ---------------------|-------------------------|-------------------
      figure               | doublebuffer            |
                           | mincolormap             |
                           | wvisual                 |
                           | wvisualmode             |
                           | xdisplay                |
                           | xvisual                 |
                           | xvisualmode             |
      axes                 | drawmode                |
      annotation           | edgecolor ("rectangle") |
      text                 | fontweight              | "demi" and "light"
      uicontrol            | fontweight              | "demi" and "light"
      uipanel              | fontweight              | "demi" and "light"
      uibuttongroup        | fontweight              | "demi" and "light"

 ** The rectangle and ellipse annotation property "edgecolor" has been
    deprecated and will be removed from Octave 6 (or whatever version
    is the second major release after 4.4).  Use the property "color"
    instead.

 ** The header file oct-alloc.h has been removed along with the macros
    that it defined (DECLARE_OCTAVE_ALLOCATOR, DEFINE_OCTAVE_ALLOCATOR,
    and DEFINE_OCTAVE_ALLOCATOR2).
</pre>
