---
layout: page
title: GNU Octave Version 3.8
permalink: NEWS-3.8.html
---

## Summary of important user-visible changes

December 27, 2013

{% include release_news_select.md %}

{::options parse_block_html="true" /}
<div class="panel callout">
* TOC
{:toc}
</div>
{::options parse_block_html="false" /}


<pre>
  ** One of the biggest new features for Octave 3.8 is a graphical user
     interface.  It is the one thing that users have requested most
     often over the last few years and now it is almost ready.  But
     because it is not quite as polished as we would like, we have
     decided to wait until the 4.0.x release series before making the
     GUI the default interface (until then, you can use the --force-gui
     option to start the GUI).

     Given the length of time and the number of bug fixes and
     improvements since the last major release Octave, we also decided
     against delaying the release of all these new improvements any
     longer just to perfect the GUI.  So please enjoy the 3.8 release of
     Octave and the preview of the new GUI.  We believe it is working
     reasonably well, but we also know that there are some obvious rough
     spots and many things that could be improved.

     WE NEED YOUR HELP.  There are many ways that you can help us fix
     the remaining problems, complete the GUI, and improve the overall
     user experience for both novices and experts alike:

       * If you are a skilled software developer, you can help by
         contributing your time to help with Octave's development.  See
         http://octave.org/get-involved.html for more information.

       * If Octave does not work properly, you are encouraged
         report the problems you find.  See http://octave.org/bugs.html
         for more information about how to report problems.

       * Whether you are a user or developer, you can help to fund the
         project.  Octave development takes a lot of time and expertise.
         Your contributions help to ensure that Octave will continue to
         improve.  See http://octave.org/donate.html for more details.

    We hope you find Octave to be useful.  Please help us make it even
    better for the future!

 ** Octave now uses OpenGL graphics by default with FLTK widgets.  If
    OpenGL libraries or FLTK widgets are not available when Octave is
    built, gnuplot is used.  You may also choose to use gnuplot for
    graphics by executing the command

      graphics_toolkit ("gnuplot")

    Adding this command to your ~/.octaverc file will set the default
    for each session.

 ** Printing or saving figures with OpenGL graphics requires the
    gl2ps library which is no longer distributed with Octave.  The
    software is widely available in most package managers.  If a
    pre-compiled package does not exist for your system, you can find
    the current sources at http://www.geuz.org/gl2ps/.

 ** Octave now supports nested functions with scoping rules that are
    compatible with Matlab.  A nested function is one declared and defined
    within the body of another function.  The nested function is only
    accessible from within the enclosing function which makes it one
    method for making private functions whose names do not conflict with those
    in the global namespace (See also subfunctions and private functions).
    In addition, variables in the enclosing function are visible within the
    nested function.  This makes it possible to have a pseudo-global variable
    which can be seen by a group of functions, but which is not visible in
    the global namespace.

    Example:
    function outerfunc (...)
      ...
      function nested1 (...)
        ...
        function nested2 (...)
           ...
        endfunction
      endfunction

      function nested3 (...)
        ...
      endfunction
    endfunction

 ** Line continuations inside character strings have changed.

    The sequence '...' is no longer recognized as a line continuation
    inside a character string.  A backslash '\' followed by a newline
    character is no longer recognized as a line continuation inside
    single-quoted character strings.  Inside double-quoted character
    strings, a backslash followed by a newline character is still
    recognized as a line continuation, but the backslash character must
    be followed *immediately* by the newline character.  No whitespace or
    end-of-line comment may appear between them.

 ** Backslash as a continuation marker outside of double-quoted strings
    is now deprecated.

    Using '\' as a continuation marker outside of double quoted strings
    is now deprecated and will be removed from a future version of
    Octave.  When that is done, the behavior of

      (a \
       b)

    will be consistent with other binary operators.

 ** Redundant terminal comma accepted by parser

    A redundant terminal comma is now accepted in matrix
    definitions which allows writing code such as

    [a,...
     b,...
     c,...
    ] = deal (1,2,3)

 ** Octave now has limited support for named exceptions

    The following syntax is now accepted:

      try
        statements
      catch exception-id
        statements
      end

    The exception-id is a structure with the fields "message" and
    "identifier".  For example

      try
        error ("Octave:error-id", "error message");
      catch myerr
        printf ("identifier: %s\n", myerr.identifier);
        printf ("message:    %s\n", myerr.message);
      end_try_catch

    When classdef-style classes are added to Octave, the exception-id
    will become an MException object.

 ** Warning states may now be set temporarily, until the end of the
    current function, using the syntax

      warning STATE ID "local"

    in which STATE may be "on", "off", or "error".  Changes to warning
    states that are set locally affect the current function and all
    functions called from the current scope.  The previous warning state
    is restored on return from the current function.  The "local"
    option is ignored if used in the top-level workspace.

 ** Warning IDs renamed:

    Octave:array-as-scalar => Octave:array-to-scalar
    Octave:array-as-vector => Octave:array-to-vector

 ** 'emptymatch', 'noemptymatch' options added to regular expressions.

    With this addition Octave now accepts the entire set of Matlab options
    for regular expressions.  'noemptymatch' is the default, but 'emptymatch'
    has certain uses where you need to match an assertion rather than actual
    characters.  For example,

    regexprep ('World', '^', 'Hello ', 'emptymatch')
      => Hello World

    where the pattern is actually the assertion '^' or start-of-line.

 ** For compatibility with Matlab, the regexp, regexpi, and regexprep
    functions now process backslash escape sequences in single-quoted pattern
    strings.  In addition, the regexprep function now processes backslash
    escapes in single-quoted replacement strings.  For example,

    regexprep (str, '\t', '\n')

    would search the variable str for a TAB character (escape sequence \t)
    and replace it with a NEWLINE (escape sequence \n).  Previously the
    expression would have searched for a literal '\' followed by 't' and
    replaced the two characters with the sequence '\', 'n'.

 ** A TeX parser has been implemented for the FLTK toolkit and is the default
    for any text object including titles and axis labels.  The TeX parser is
    supported only for display on a monitor, not for printing.

    A quick summary of features:

    Code         Feature     Example             Comment
    -----------------------------------------------------------------
    _            subscript   H_2O                formula for water
    ^            exponent    y=x^2               formula for parabola
    \char        symbol      \beta               Greek symbol beta
    \fontname    font        \fontname{Arial}    set Arial font
    \fontsize    fontsize    \fontsize{16}       set fontsize 16
    \color[rgb]  fontcolor   \color[rgb]{1 0 1}  set magenta color
    \bf          bold        \bfBold Text        bold font
    \it          italic      \itItalic Text      italic font
    \sl          slanted     \slOblique Text     slanted font
    \rm          normal      \bfBold\rmNormal    normal font
    {}           group       {\bf Bold}Normal    group objects
                             e^{i*\pi} = -1      group objects

 ** The m-files in the plot directory have been overhauled.

    The plot functions now produce output that is nearly visually compatible
    with Matlab.  Plot performance has also increased, dramatically for some
    functions such as comet and waitbar.  Finally, the documentation for most
    functions has been updated so it should be clearer both how to use a
    function and when a function is appropriate.

 ** The m-files in the image directory have been overhauled.

    The principal benefit is that Octave will now no longer automatically
    convert images stored with integers to doubles.  Storing images as uint8
    or uint16 requires only 1/8 or 1/4 the memory of an image stored using
    doubles.  For certain operations, such as fft2, the image must still be
    converted to double in order to work.

    Other changes include fixes to the way indexed images are read from a
    colormap depending on the image class (integer images have a -1 offset to
    the colormap row number).

 ** The imread and imwrite functions have been completely rewritten.

    The main changes relate to the alpha channel, support for reading and
    writing of floating point images, implemented writing of indexed images,
    and appending images to multipage image files.

    The issues that may arise due to backwards incompatibility are:

      * imwrite no longer interprets a length of 2 or 4 in the third dimension
        as grayscale or RGB with alpha channel (a length of 4 will be saved
        as a CMYK image).  Alpha channel must be passed as separate argument.

      * imread will always return the colormap indexes when reading an indexed
        image, even if the colormap is not requested as output.

      * transparency values are now inverted from previous Octave versions
        (0 is for completely transparent instead of completely opaque).

    In addition, the function imformats has been implemented to expand
    reading and writing of images of different formats through imread
    and imwrite.

 ** The colormap function now provides new options--"list", "register",
    and "unregister"--to list all available colormap functions, and to
    add or remove a function name from the list of known colormap
    functions.  Packages that implement extra colormaps should use these
    commands with PKG_ADD and PKG_DEL statements.

 ** strsplit has been modified to be compatible with Matlab.  There
    are two instances where backward compatibility is broken.

    (1) Delimiters are now string vectors, not scalars.

    Octave's legacy behavior

      strsplit ("1 2, 3", ", ")
      ans =
      {
       [1,1] = 1
       [1,2] = 2
       [1,3] =
       [1,4] = 3
      }

    Matlab compatible behavior

      strsplit ("1 2, 3", ", ")
      ans =
      {
       [1,1] = 1 2
       [1,2] = 3
      }

    (2) By default, Matlab treats consecutive delimiters as a single
    delimiter.  By default, Octave's legacy behavior was to return an
    empty string for the part between the delmiters.

    Where legacy behavior is desired, the call to strsplit() may be
    replaced by ostrsplit(), which is Octave's original implementation of
    strsplit().

 ** The datevec function has been extended for better Matlab compatibility.
    It now accepts string inputs in the following numerical formats: 12, 21,
    22, 26, 29, 31.  This is undocumented, but verifiable, Matlab behavior.
    In addition, the default for formats which do not specify a date is
    January 1st of the current year.  The previous default was the current day,
    month, and year.  This may produce changes in existing scripts.

 ** The error function and its derivatives has been extended to accept complex
    arguments.  The following functions now accept complex inputs:

    erf  erfc  erfcx

    In addition two new error functions erfi (imaginary error function) and
    dawson (scaled imaginary error function) have been added.

 ** The glpk function has been modified to reflect changes in the GLPK
    library.  The "round" and "itcnt" options have been removed.  The
    "relax" option has been replaced by the "rtest" option.  The numeric
    values of error codes and of some options have also changed.

 ** The kurtosis function has changed definition to be compatible with
    Matlab.  It now returns the base kurtosis instead of the "excess kurtosis".
    The old behavior can be had by changing scripts to normalize with -3.

               "excess kurtosis" = kurtosis (x) - 3

 ** The moment function has changed definition to be compatible with
    Matlab.  It now returns the central moment instead of the raw moment.
    The old behavior can be had by passing the type argument "r" for raw.

 ** The default name of the Octave crash dump file is now
    "octave-workspace" instead of "octave-core".  The exact name can
    always be customized with the octave_core_file_name function.

 ** A citation command has been added to display information on how to
    cite Octave and packages in publications.  The package system will
    look for and install CITATION files from packages.

 ** The java package from Octave Forge is now part of core Octave.  The
    following new functions are available for interacting with Java
    directly from Octave:

      debug_java     java_matrix_autoconversion
      isjava         java_unsigned_autoconversion
      java2mat       javaaddpath
      javaArray      javaclasspath
      javaMethod     javamem
      javaObject     javarmpath
                     usejava

    In addition, the following functions that use the Java interface
    are now available (provided that Octave is compiled with support for
    Java enabled):

      helpdlg    listdlg   questdlg
      inputdlg   msgbox    warndlg

 ** Other new functions added in 3.8.0:

      atan2d                     erfi             lines
      base64_decode              expint           linsolve
      base64_encode              findfigs         missing_component_hook
      betaincinv                 flintmax         polyeig
      built_in_docstrings_file   fminsearch       prefdir
      cmpermute                  gallery          preferences
      cmunique                   gco              readline_re_read_init_file
      colorcube                  hdl2struct       readline_read_init_file
      copyobj                    history_save     rgbplot
      dawson                     imformats        save_default_options
      dblist                     importdata       shrinkfaces
      desktop                    isaxes           splinefit
      doc_cache_create           iscolormap       stemleaf
      ellipj                     isequaln         strjoin
      ellipke                    jit_debug        struct2hdl
      erfcinv                    jit_enable       tetramesh
                                 jit_startcnt     waterfall

 ** Deprecated functions.

    The following functions were deprecated in Octave 3.4 and have been
    removed from Octave 3.8.

      autocor    dispatch              is_global    setstr
      autocov    fstat                 krylovb      strerror
      betai      gammai                perror       values
      cellidx    glpkmex               replot
      cquad      is_duplicate_entry    saveimage

    The following functions have been deprecated in Octave 3.8 and will
    be removed from Octave 3.12 (or whatever version is the second major
    release after 3.8):

      default_save_options    java_new
      gen_doc_cache           java_set
      interp1q                java_unsigned_conversion
      isequalwithequalnans    javafields
      java_convert_matrix     javamethods
      java_debug              re_read_readline_init_file
      java_get                read_readline_init_file
      java_invoke             saving_history


    The following keywords have been deprecated in Octave 3.8 and will
    be removed from Octave 3.12 (or whatever version is the second major
    release after 3.8):

      static

    The following configuration variables have been deprecated in Octave
    3.8 and will be removed from Octave 3.12 (or whatever version is the
    second major release after 3.8):

      CC_VERSION  (now GCC_VERSION)
      CXX_VERSION (now GXX_VERSION)

    The internal class Octave_map has been deprecated in Octave 3.8 and
    will be removed from Octave 3.12 (or whatever version is the second
    major release after 3.8).  Replacement classes are octave_map
    (struct array) or octave_scalar_map for a single structure.
</pre>
