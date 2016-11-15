---
layout: default
---

<pre>


Summary of important user-visible changes for version 4.2:
---------------------------------------------------------

 ** The parser has been extended to accept, but ignore, underscore
    characters in numbers.  This facilitates writing more legible code
    by using '_' as a thousands separator or to group nibbles into bytes
    in hex constants.

    Examples: 1_000_000 == 1e6  or  0xDE_AD_BE_EF

 ** The parser has been extended to understand binary numbers which
    begin with the prefix '0b' or '0B'.  The value returned is Octave's
    default numeric class of double, not at unsigned integer class.
    Therefore numbers greater than flintmax, i.e., 2^53, will lose some
    precision.

    Examples: 0b101 == 5  or  0B1100_0001 == 0xC1

 ** gnuplot 4.4 is now the minimum version supported by Octave.

 ** The default set of colors used to plot lines has been updated to be
    compatible with Matlab's new default color scheme.  The line plot
    color scheme can be set with the axes property "ColorOrder".

 ** The default colormap is now set to "viridis" which is also the
    default colormap in matplotlib.  This new colormap fixes some of the
    main issues with the old default colormap "jet" such as its bad
    "luminance profile" and is also more similar to Matlab's new default
    colormap "parula".

 ** The colormap function no longer supports the input argument "list"
    to show built-in colormaps.  Use "help colormap" to find the
    built-in colormaps.

 ** The graphics command "hold on" now ensures that each new plot added
    to an existing plot has a different color or linestyle according to
    the "ColorOrder" and/or "LineStyleOrder" properties.  This is
    equivalent to the old command "hold all" and was made for Matlab
    compatibility.  Existing code *may* produce differently colored
    plots if it did not specify the color for a plot and relied on each
    new plot having the default first color in the "ColorOrder"
    property.

 ** When starting, Octave now looks in the function path for a file
    startup.m and executes any commands found there.  This change was
    made to accommodate Matlab users.  Octave has it's own configuration
    system based on the file .octaverc which is preferred.

 ** Octal ('\NNN') and hex ('\xNN') escape sequences in single quoted
    strings are now interpreted by the function do_string_escapes().
    The *printf family of functions now supports octal and hex escape
    sequences in single-quoted strings for Matlab compatibility.

 ** Special octal and hex escape sequences for the pattern and
    replacement strings in regular expressions are now interpreted for
    Matlab compatibility.

    octal: '\oNNN' or '\o{NNN}'
    hex  : '\xNN'  or '\x{NN}'

 ** Unknown escape sequences in the replacement string for regexprep are
    now substituted with their unescaped version and no warning is
    emitted.  This change was made for Matlab compatibility.

    Example: regexprep ('a', 'a', 'x\yz')
             => 'xyz'

 ** mkfifo now interprets the MODE argument as an octal, not decimal,
    integer.  This is consistent with the equivalent shell command.

 ** linspace now returns an empty matrix if the number of requested
    points is 0 or a negative number.  This change was made to be
    compatible with Matlab releases newer than 2011.  In addition,
    Octave no longer supports matrix inputs for A or B.

 ** The cov function now returns the complex conjugate of the result
    from previous versions of Octave.  This change was made for
    compatibility with Matlab.

 ** condest now works with a normest1 compatible syntax.

 ** The griddata function no longer plots the interpolated mesh if no
    output argument is requested, instead the vector or array of
    interpolated values is always returned for Matlab compatibility.

 ** The new function "light" and the corresponding graphics object
    provide light and shadow effects for patch and surface objects.

 ** The surfnorm function now returns unnormalized (magnitude != 1)
    normal vectors for compatibility with Matlab.

 ** The normal vectors returned from isonormals have been reversed to
    point towards smaller values for compatibility with Matlab.

 ** The quadl function now uses an absolute, rather than relative,
    tolerance for Matlab compatibility.  The default tolerance is 1e-6
    which may result in lower precision results than previous versions
    of Octave which used eps as the relative tolerance.  The quadl
    function has also been extended to return a second output with the
    total number of function evaluations.

 ** The textscan function is now built-in and is much faster and much
    more Matlab-compatible than the previous m-file version.

 ** Dialog boxes--errordlg, helpdlg, inputdlg, listdlg, msgbox,
    questdlg, and warndlg--now exclusively use Qt for rendering.
    Java based versions have been removed.

 ** The axes properties "TitleFontSizeMultiplier" and "TitleFontWeight"
    are now implemented which control the default appearance of text
    created with title().
    The axes property "LabelFontSizeMultiplier" is now implemented
    which controls the default appearance of text created with
    xlabel(), ylabel(), or zlabel().

 ** The graphics property "box" for axes now defaults to "off".
    To obtain equivalent plots to previous versions of Octave use
      set (0, "DefaultAxesBox", "on");
    in your .octaverc file.

 ** The graphics property "boxstyle" has been implemented.  The default
    is "back" which draws only the back planes in a 3-D view.  If the
    option is "full" then all planes are drawn.

 ** The graphics property "erasemode" has been hidden, and will
    eventually be removed.  This property has also been removed
    from Matlab, and was never implemented in Octave.

 ** The graphics property "graphicssmoothing" for figures now controls
    whether anti-aliasing will be used for lines.  The default is "on".

 ** The value "zero" for the axes properties "xaxislocation" and
    "yaxislocation" has been deprecated and will be removed from
    Octave 4.6.  Use "origin" instead.

 ** The publish function allows easy publication of Octave script files
    in HTML or other formats, including figures and output created by
    this script.  It comes with its counterpart grabcode, which lets one
    literally grab the HTML published code from a remote website, for
    example.

 ** The value of the MEX variable TrapFlag now defaults to 0, which will
    cause Octave to abort execution of a MEX file and return to the
    prompt if an error is encountered in mexCallMATLAB.

 ** The MEX API now includes the function mexCallMATLABWithTrap.  This
    function will not abort if an error occurs during mexCallMATLAB, but
    instead will return execution to the MEX function for error
    handling.

 ** The MEX API functions for input validation that begin with "mxIs"
    (e.g., mxIsDouble, mxIsEmpty, etc.) now return type bool rather than
    type int.

 ** The functions mxAssert and mxAssertS for checking assertions have
    been added.  In order to avoid a performance penalty they are only
    compiled in to debug versions of a MEX file, i.e., that are produced
    when the '-g' option is given to mex or mkoctfile.

 ** Other new MEX API functions include mexEvalStringWithTrap,
    mxIsScalar, mxCreateUninitNumericArray, mxCreateUninitNumericMatrix.

 ** Other new functions added in 4.2:

      audioformats
      camlight
      condeig
      deg2rad
      dialog
      evalc
      hash
      im2double
      isocaps
      lighting
      localfunctions
      material
      normest1
      ode23
      ode45
      odeget
      odeplot
      odeset
      padecoef
      profexport
      psi
      rad2deg
      reducepatch
      reducevolume
      smooth3
      uibuttongroup

 ** Deprecated functions.

    The following functions have been deprecated in Octave 4.2 and will
    be removed from Octave 4.6 (or whatever version is the second major
    release after 4.2):

      Function             | Replacement
      ---------------------|------------------
      bitmax               | flintmax
      mahalanobis          | mahal in Octave-Forge statistics pkg
      md5sum               | hash
      octve_config_info    | __octave_config_info__
      onenormest           | normest1
      sleep                | pause
      usleep               | pause
      wavread              | audioread
      wavwrite             | audiowrite

 ** The following functions were deprecated in Octave 3.8 and have been
    removed from Octave 4.2.

      default_save_options    java_new
      gen_doc_cache           java_unsigned_conversion
      interp1q                javafields
      isequalwithequalnans    javamethods
      java_convert_matrix     re_read_readline_init_file
      java_debug              read_readline_init_file
      java_invoke             saving_history

 ** The global error_state variable in Octave's C++ API has been
    deprecated and will be removed in a future version.  Now the error
    and print_usage functions throw an exception
    (octave::execution_exception) after displaying the error message.
    This makes the error and print_usage functions in C++ work more like
    the corresponding functions in the scripting language.

 ** The default error handlers in liboctave have been updated to use
    exceptions.  After displaying an error message they no longer return
    control to the calling program.  The error handler function can be
    customized through the global variables
    "current_liboctave_error_handler" and
    "current_liboctave_error_with_id_handler".  If a programmer has
    installed their own custom error handling routines when directly
    linking with liboctave then these must be updated to throw an
    exception and not return to the calling program.

 ** The system for common errors and warnings has been renamed from
    gripe_XXX to either err_XXX if error is called or warn_XXX if
    warning is called.  The gripe_XXX functions are deprecated and will
    be removed in version 4.6.

 ** New configure option, --enable-address-sanitizer-flags, to build
    Octave with memory allocator checks (similar to those in valgrind)
    built in.
</pre>
