---
layout: page
title: GNU Octave Version 6
permalink: NEWS-6.1.html
---

## Summary of important user-visible changes

November 26, 2020

{% include release_news_select.md %}

{::options parse_block_html="true" /}
<div class="panel callout">
* TOC
{:toc}
</div>
{::options parse_block_html="false" /}


### General improvements

- The `intersect`, `setdiff`, `setxor`, `union`, and `unique` functions
  accept a new sorting option `"stable"` which will return output values
  in the same order as the input, rather than in ascending order.

- Complex RESTful web services can now be accessed by the `webread` and
  `webwrite` functions alongside with the `weboptions` structure.  One
  major feature is the support for cookies to enable RESTful
  communication with the web service.

  Additionally, the system web browser can be opened by the `web`
  function.

- The `linspace` function now produces symmetrical sequences when the
  endpoints are symmetric.  This is more intuitive and also compatible
  with recent changes made in Matlab R2019b.

- The underlying algorithm of the `rand` function has been changed.
  For single precision outputs, the algorithm has been fixed so that it
  produces values strictly in the range (0, 1).  Previously, it could
  occasionally generate the right endpoint value of 1 (See
  [bug #41742](https://savannah.gnu.org/bugs/?41742)).  In addition,
  the new implementation uses a uniform interval between floating
  point values in the range (0, 1) rather than targeting a uniform
  density (# of random integers / length along real number line).

- Numerical integration has been improved.  The `quadv` function has
  been re-written so that it can compute integrands of periodic
  functions.  At the same time, performance is better with ~3.5X fewer
  function evaluations required.  A bug in `quadgk` that caused complex
  path integrals specified with `"Waypoints"` to occasionally be
  calculated in the opposite direction was fixed.

- The `edit` function option `"editinplace"` now defaults to `true` and
  the option `"home"` now defaults to the empty matrix `[]`.  Files will
  no longer be copied to the user's HOME directory for editing.  The old
  behavior can be restored by setting `"editinplace"` to `false` and
  `"home"` to `"~/octave"`.

- The `format` command supports two new options: `uppercase` and
  `lowercase` (default).  With the default, print a lowercase 'e' for
  the exponent character in scientific notation and lowercase 'a-f' for
  the hex digits representing 10-15.  With `uppercase`, print 'E' and
  'A-F' instead.  The previous uppercase formats, `E` and `G`, no longer
  control the case of the output.

  Additionally, the `format` command can be called with multiple options
  for controlling the format, spacing, and case in arbitrary order.
  For example:

        format long e uppercase loose

  Note, in the case of multiple competing format options the rightmost
  one is used, and, in case of an error, the previous format remains
  unchanged.

- L-value references (e.g., increment (++), decrement (--), and all
  in-place assignment operators (+=, -=, *=, /=, etc.)) are no longer
  allowed in anonymous functions.

- New warnings have been added about questionable uses of the colon ':'
  range operator.  Each has a new warning ID so that it can be disabled
  if desired.

  - `Octave:colon-complex-argument`   : when any arg is complex
  - `Octave:colon-nonscalar-argument` : when any arg is non-scalar

  &nbsp;

- The `regexp` and related functions now correctly handle and *require*
  strings in UTF-8 encoding.  As with any other function that requires
  strings to be encoded in Octave's native encoding, you can use
  `native2unicode` to convert from your preferred locale.  For example,
  the copyright symbol in UTF-8 is `native2unicode (169, "latin1")`.

- The startup file `octaverc` can now be located in the platform
  dependent location for user local configuration files (e.g.,
  `${XDG_CONFIG_HOME}/octave/octaverc` on Unix-like operating systems or
  `%APPDATA%\octave\octaverc` on Windows).

- The command

      dbstop in CLASS at METHOD

  now works to set breakpoints in classdef constructors and methods.

#### Graphics backend

- The use of Qt4 for graphics and the GUI is deprecated in Octave
  version 6 and no further bug fixes will be made.  Qt4 support will be
  removed completely in Octave version 7.

- The `legend` function has been entirely rewritten.  This fixes a
  number of historical bugs, and also implements new properties such as
  `"AutoUpdate"` and `"NumColumns"`.  The gnuplot toolkit---which is no
  longer actively maintained---still uses the old legend function.

- The `axis` function was updated which resolved 10 bugs affecting
  axes to which `"equal"` had been applied.

- Graphic primitives now accept a color property value of `"none"`
  which is useful when a particular primitive needs to be hidden
  (for example, the Y-axis of an axes object with `"ycolor" = "none"`)
  without hiding the entire primitive `"visibility" = "off"`.

- A new property `"FontSmoothing"` has been added to text and axes
  objects that controls whether anti-aliasing is used during the
  rendering of characters.  The default is `"on"` which produces smooth,
  more visually appealing text.

- The figure property `"windowscrollwheelfcn"`is now implemented.
  This makes it possible to provide a callback function to be executed
  when users manipulate the mouse wheel on a given figure.

- The figure properties `"pointer"`, `"pointershapecdata"`, and
  `"pointershapehotspot"` are now implemented.  This makes it possible
  to change the shape of the cursor (pointer in Matlab-speak) displayed
  in a plot window.

- The figure property `"paperpositionmode"` now has the default `"auto"`
  rather than `"manual"`.  This change is more intuitive and is
  Matlab compatible.

- The appearance of patterned lines `"LineStyle" = ":"|"--"|"-."` has
  been improved for small widths (`"LineWidth"` less than 1.5 pixels)
  which is a common scenario.

- Printing to EPS files now uses a tight bounding box (`"-tight"`
  argument to print) by default.  This makes more sense for EPS
  files which are normally embedded within other documents, and is
  Matlab compatible.  If necessary use the `"-loose"` option to
  reproduce figures as they appeared in previous versions of Octave.

- The following print devices are no longer officially supported: cdr,
  corel, aifm, ill, cgm, hpgl, mf and dxf.  A warning will be thrown
  when using those devices, and the code for supporting those formats
  will eventually be removed from a future version of Octave.

- The placement of text subscripts and superscripts has been
  re-engineered and now produces visually attractive results similar to
  Latex.

#### Packages

- `pkg describe` now lists dependencies and inverse dependencies
  (i.e., other installed packages that depend on the package in
  question).

- `pkg test` now tests all functions in a package.

- When unloading a package, `pkg` now checks if any remaining loaded
  packages depend on the one to be removed.  If this is the case `pkg`
  aborts with an explanatory error message.  This behavior can be
  overridden with the `-nodeps` option.

### Matlab compatibility

- The function `unique` now returns column index vectors for the second
  and third outputs.  When duplicate values are present, the default
  index to return is now the `"first"` occurrence.  The previous Octave
  behavior, or Matlab behavior from releases prior to R2012b, can be
  obtained by using the `"legacy"` flag.

- The function `setdiff` with the `"rows"` argument now returns Matlab
  compatible results.  The previous Octave behavior, or Matlab behavior
  from releases prior to R2012b, can be obtained by using the `"legacy"`
  flag.

- The functions `intersect`, `setxor`, and `union` now accept a
  `"legacy"` flag which changes the index values (second and third
  outputs) as well as the orientation of all outputs to match Matlab
  releases prior to R2012b.

- The function `streamtube` is Matlab compatible and plots tubes along
  streamlines which are scaled by the vector field divergence. The
  Octave-only extension `ostreamtube` can be used to visualize the flow
  expansion and contraction of the vector field due to the local
  crossflow divergence.

- The interpreter now supports handles to nested functions.

- The graphics properties `"LineWidth"` and `"MarkerSize"` are now
  measured in points, *not* pixels.  Compared to previous versions
  of Octave, some lines and markers will appear 4/3 larger.

- The meta.class property "SuperClassList" has been renamed
  "Superclasslist" for Matlab compatibility.  The original name will
  exist as an alias until Octave version 8.1.

- Inline functions created by the function `inline` are now of type
  "inline" when interrogated with the `class` function.  In previous
  versions of Octave, the class returned was "function_handle".  This
  change is Matlab compatible.  Inline functions are deprecated in
  both Matlab and Octave and support may eventually be removed.
  Anonymous functions can be used to replace all instances of inline
  functions.

- The function `javaaddpath` now prepends new directories to the
  existing dynamic classpath by default.  To append them instead, use
  the new `"-end"` argument.  Multiple directories may now be specified
  in a cell array of strings.

- An undocumented function `gui_mainfcn` has been added, for compatibility
  with figures created with Matlab's GUIDE.

- Several validator functions of type `mustBe*` have been added.  See
  the list of new functions below.


### Deprecated functions and properties

The following functions and properties have been deprecated in Octave 6
and will be removed from Octave 8 (or whatever version is the second
major release after 6):

- Functions

  Function               | Replacement
  -----------------------|------------------
  `runtests`             | `oruntests`

- The environment variable used by `mkoctfile` for linker flags is now
  `LDFLAGS` rather than `LFLAGS`.  `LFLAGS` is deprecated, and a warning
  is emitted if it is used, but it will continue to work.


### Removed functions and properties

The following functions and properties were deprecated in Octave 4.4
and have been removed from Octave 6.

- Functions

  Function             | Replacement
  ---------------------|------------------
  `chop`               | `sprintf` for visual results
  `desktop`            | `isguirunning`
  `tmpnam`             | `tempname`
  `toascii`            | `double`
  `java2mat`           | `__java2mat__`

- Properties

  Object               | Property                  | Value
  ---------------------|---------------------------|-----------------------
  `annotation`         | `edgecolor ("rectangle")` |
  `axes`               | `drawmode`                |
  `figure`             | `doublebuffer`            |
                       | `mincolormap`             |
                       | `wvisual`                 |
                       | `wvisualmode`             |
                       | `xdisplay`                |
                       | `xvisual`                 |
                       | `xvisualmode`             |
  `line`               | `interpreter`             |
  `patch`              | `interpreter`             |
  `surface`            | `interpreter`             |
  `text`               | `fontweight`              | `"demi"` and `"light"`
  `uibuttongroup`      | `fontweight`              | `"demi"` and `"light"`
  `uicontrol`          | `fontweight`              | `"demi"` and `"light"`
  `uipanel`            | `fontweight`              | `"demi"` and `"light"`
  `uitable`            | `fontweight`              | `"demi"` and `"light"`


### Alphabetical list of new functions added in Octave 6

* `auto_repeat_debug_command`
* `commandhistory`
* `commandwindow`
* `filebrowser`
* `is_same_file`
* `lightangle`
* `mustBeFinite`
* `mustBeGreaterThan`
* `mustBeGreaterThanOrEqual`
* `mustBeInteger`
* `mustBeLessThan`
* `mustBeLessThanOrEqual`
* `mustBeMember`
* `mustBeNegative`
* `mustBeNonempty`
* `mustBeNonNan`
* `mustBeNonnegative`
* `mustBeNonpositive`
* `mustBeNonsparse`
* `mustBeNonzero`
* `mustBeNumeric`
* `mustBeNumericOrLogical`
* `mustBePositive`
* `mustBeReal`
* `namedargs2cell`
* `newline`
* `ode23s`
* `ostreamtube`
* `rescale`
* `rotx`
* `roty`
* `rotz`
* `stream2`
* `stream3`
* `streamline`
* `streamtube`
* `uisetfont`
* `verLessThan`
* `web`
* `weboptions`
* `webread`
* `webwrite`
* `workspace`
