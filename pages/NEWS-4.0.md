---
layout: page
title: GNU Octave Version 4.0
permalink: NEWS-4.0.html
---

## Summary of important user-visible changes

May 23, 2015

{% include release_news_select.md %}

{::options parse_block_html="true" /}
<div class="panel callout">
* TOC
{:toc}
</div>
{::options parse_block_html="false" /}


<pre>
 ** A graphical user interface is now the default when running Octave
    interactively.  The start-up option --no-gui will run the familiar
    command line interface, and still allows use of the GUI dialogs and
    qt plotting toolkit.  The option --no-gui-libs runs a minimalist
    command line interface that does not link with the Qt libraries and
    uses the fltk toolkit for plotting.

 ** Octave now uses OpenGL graphics with Qt widgets by default.  If OpenGL
    libraries are not available when Octave is built, gnuplot is used.
    You may choose to use the fltk or gnuplot toolkit for graphics by
    executing the command

      graphics_toolkit ("fltk")
        OR
      graphics_toolkit ("gnuplot")

    Adding such a command to your ~/.octaverc file will set the default
    for each session.

 ** A new syntax for object oriented programming termed classdef has been
    introduced.  See the manual for more extensive documentation of the
    classdef interface.

    New keywords:

      classdef      endclassdef
      enumeration   endenumeration
      events        endevents
      methods       endmethods
      properties    endproperties

 ** New audio functions and classes:

      audiodevinfo  audioread      sound
      audioinfo     audiorecorder  soundsc
      audioplayer   audiowrite

 ** Other new classes in Octave 4.0:

      audioplayer    inputParser
      audiorecorder

 ** Optional stricter Matlab compatibility for ranges, diagonal matrices,
    and permutation matrices.

    Octave has internal optimizations which use space-efficient storage
    for the three data types above.  Three new functions have been added
    which control whether the optimizations are used (default), or whether
    the data types are stored as full matrices.

    disable_range   disable_diagonal_matrix   disable_permutation_matrix

    All three optimizations are disabled if Octave is started with the
    --braindead command line option.

 ** The preference

      do_braindead_shortcircuit_evaluation

    is now enabled by default.

 ** The preference

      allow_noninteger_range_as_index

    is now enabled by default and the warning ID

      Octave:noninteger-range-as-index

    is now set to "on" by default instead of "error" by default and "on"
    for --traditional.

 ** The "backtrace" warning option is now enabled by default.  This change
    was made for Matlab compatibility.

 ** For compatibility with Matlab, the "ismatrix (x)" function now only checks
    the dimension of "x".  The old behaviour of "ismatrix" is obtained by
    "isnumeric (x) || islogical (x) || ischar (x)".

 ** The nextpow2 function behaviour has been changed for vector inputs.
    Instead of computing `nextpow2 (length (x))', it will now compute
    nextpow2 for each element of the input.  This change is Matlab compatible,
    and also prevents bugs for "vectors" of length 1.

 ** polyeig now returns a row vector of eigenvalues rather than a matrix
    with the eigenvalues on the diagonal.  This change was made for Matlab
    compatibility.

 ** Interpolation function changes for Matlab compatibility

    The interpolation method 'cubic' is now equivalent to 'pchip'
    for interp1, interp2, and interp3.  Previously, 'cubic' was equivalent
    to 'spline' for interp2.  This may produce different results as 'spline'
    has continuous 1st and 2nd derivatives while 'pchip' only has a continuous
    1st derivative.  The methods 'next' and 'previous' have been added to
    interp1 for compatibility.

 ** The delaunay function has been extended to accept 3-D inputs for
    Matlab compatibility.  The delaunay function no longer plots the
    triangulation if no output argument is requested, instead, the
    triangulation is always returned.  The delaunay3 function which
    handles 3-D inputs has been deprecated in favor of delaunay.

 ** The trigonometric functions asin and acos return different phase values
    from previous versions of Octave when the input is outside the principal
    branch ([-1, 1]).  If the real portion of the input is greater than 1 then
    the limit from below is taken.  If the real portion is less than 1 then the
    limit from above is taken.  This criteria is consistent with several other
    numerical analysis software packages.

 ** The hyperbolic function acosh now returns values with a phase in the range
    [-pi/2, +pi/2].  Previously Octave returned values in the range [0, pi].
    This is consistent with several other numerical analysis software packages.

 ** strfind changes when using empty pattern ("") for Matlab compatibility

    strfind now returns an empty array when the pattern itself is empty.
    In previous versions of Octave, strfind matched at every character
    location when the pattern was empty.

      NEW
      strfind ("abc", "") => []
      OLD
      strfind ("abc", "") => [1, 2, 3, 4]

 ** Integer formats used in the printf family of functions now work for
    64-bit integers and are more compatible with Matlab when printing
    non-integer values.  Now instead of truncating, Octave will switch
    the effective format to '%g' in the following circumstances:

      * the value of an integer type (int8, uint32, etc.) value exceeds
        the maximum for the format specifier.  For '%d', the limit is
        intmax ('int64') and for '%u' it is intmax ('uint64').

      * round(x) != x or the value is outside the range allowed by the
        integer format specifier.

    There is still one difference:  Matlab switches to '%e' and Octave
    switches to '%g'.

 ** The functions intersect, setdiff, setxor, and union now return a
    column vector as output unless the input was a row vector.  This change
    was made for Matlab compatibility.

 ** The inpolygon function now returns true for points that are within
    the polygon OR on it's edge.  This change was made for Matlab
    compatibility.

 ** The archive family of functions (bzip2, gzip, zip, tar) and their
    unpacking routines (bunzip2, gunzip, unzip, untar, unpack) have
    been recoded.  Excepting unpack, the default is now to place files
    in the same directory as the archive (on unpack) or as the original
    files (on archiving).

 ** Qt and FLTK graphics toolkits now support offscreen rendering on Linux.
    In other words, print will work even when the figure visibility is "off".

 ** Z-order stacking issues with patches, grid lines, and line object
    plot markers for on screen display and printing have all been resolved.
    For 2-D plots the axis grid lines can be placed on top of the plot
    with set (gca, "layer", "top").

 ** The patch graphic object has been overhauled.  It now produces visual
    results equivalent to Matlab even for esoteric combinations of
    faces/vertices/cdata.

 ** The polar() plot function now draws a circular theta axis and
    radial rho axis rather than using a rectangular x/y axis.

 ** linkprop has been completely re-coded for performance and Matlab
    compatibility.  It now returns a linkprop object which must be stored
    in a variable for as long as the graphic objects should remain linked.
    To unlink properties use 'clear hlink' where hlink is the variable
    containing the linkprop object.

 ** isprime has been extended to operate on negative and complex inputs.

 ** xor has been extended to accept more than two arguments in which case
    it performs cumulative XOR reduction.

 ** The following functions now support N-dimensional arrays:

      fliplr   flipud   rot90   rectint

 ** The new warning ID "Octave:data-file-in-path" replaces the three
    previous separate warning IDs "Octave:fopen-file-in-path",
    "Octave:load-file-in-path", and "Octave:md5sum-file-in-path".

 ** The warning ID Octave:singular-matrix-div has been replaced by
    Octave:nearly-singular-matrix and Octave:singular-matrix.

 ** The warning ID Octave:matlab-incompatible has been replaced by
    Octave:language-extension to better reflect its meaning.

 ** The warning ID Octave:broadcast has been removed.  Instead automatic
    broadcasting will throw an Octave:language-extension warning.  This
    warning ID is used for broadcasting as well as other features not
    available in Matlab.

 ** Other new functions added in 4.0:

      annotation
      bandwidth
      cubehelix
      dir_in_loadpath
      flip
      frame2im
      get_home_directory
      hgload
      hgsave
      ichol
      ilu
      im2frame
      isbanded
      isdiag
      isstudent
      istril
      istriu
      javachk
      jit_failcnt
      linkaxes
      lscov
      metaclass
      numfields
      open
      ordschur
      pan
      qmr
      rotate
      rotate3d
      sylvester
      unsetenv
      validateattributes
      zoom

 ** inline() scheduled for eventual deprecation by Matlab

    Functions created through the use of inline are scheduled for deprecation
    by Matlab.  When this occurs Octave will continue to support inline
    functions for an indeterminate amount of time before also removing support.
    All new code should use anonymous functions in place of inline functions.

 ** Deprecated functions.

    The following functions have been deprecated in Octave 4.0 and will
    be removed from Octave 4.4 (or whatever version is the second major
    release after 4.0):

      Function             | Replacement
      ---------------------|------------------
      bicubic              | interp2
      delaunay3            | delaunay
      dump_prefs           | individual preference get/set routines
      find_dir_in_path     | dir_in_loadpath
      finite               | isfinite
      fmod                 | rem
      fnmatch              | glob or regexp
      loadaudio            | audioread
      luinc                | ilu or ichol
      mouse_wheel_zoom     | mousewheelzoom axes property
      nfields              | numfields
      octave_tmp_file_name | tempname
      playaudio            | audioplayer
      saveaudio            | audiowrite
      syl                  | sylvester
      usage                | print_usage

      allow_noninteger_range_as_index
      do_braindead_shortcircuit_evaluation
      setaudio

 ** The following functions were deprecated in Octave 3.8 and will be
    removed from Octave 4.2 (or whatever version is the second major
    release after 3.8):

      default_save_options    java_new
      gen_doc_cache           java_unsigned_conversion
      interp1q                javafields
      isequalwithequalnans    javamethods
      java_convert_matrix     re_read_readline_init_file
      java_debug              read_readline_init_file
      java_invoke             saving_history

 ** The following functions were deprecated in Octave 3.6 and have been
    removed from Octave 4.0.

      cut                polyderiv
      cor                shell_cmd
      corrcoef           studentize
      __error_text__     sylvester_matrix
      error_text

 ** The following keywords were deprecated in Octave 3.8 and have been
    removed from Octave 4.0

      static

 ** The following configuration variables were deprecated in Octave 3.8
    and have been removed from Octave 4.0

      CC_VERSION  (now GCC_VERSION)
      CXX_VERSION (now GXX_VERSION)

 ** The internal function atan2 of the sparse matrix class has been deprecated
    in Octave 4.0 and will be removed from Octave 4.4 (or whatever version is
    the second major release after 4.0).  Use the Fatan2 function with sparse
    inputs as a replacement.

 ** The internal class Octave_map was deprecated in Octave 3.8 and has
    been removed from Octave 4.0.  Replacement classes are
    octave_map (struct array) or octave_scalar_map for a single structure.

 ** The configure option --enable-octave-allocator has been removed.
    The internal class octave_allocator declared in oct-alloc.h has
    been removed.  The header remains, but is deprecated.  The macros to
    access the class (DECLARE_OCTAVE_ALLOCATOR, DEFINE_OCTAVE_ALLOCATOR,
    and DEFINE_OCTAVE_ALLOCATOR2) are now unconditionally defined to be
    empty.

 ** Octave now has OpenMP enabled by default if the system provides a
    working OpenMP implementation.  This allows oct-file modules to take
    advantage of OpenMP if desired.  This can be disabled when building
    Octave with the configure option --disable-openmp.

 ** Octave now automatically truncates intermediate calculations done with
    floating point values to 64 bits.  Some hardware math co-processors, such
    as the x87, maintain extra precision, but this leads to disagreements in
    calculations when compared to reference implementations in software using
    the IEEE standard for double precision.  There was no measurable
    performance impact to this change, but it may be disabled with the
    configure option --disable-float-truncate.  MinGW and Cygwin platforms,
    as well as GCC compilers >= 5.0 require this feature.  Non-x87 hardware,
    or hardware using SSE options exclusively, can disable float truncation
    if desired.
</pre>
