---
layout: page
title: GNU Octave Version 10
permalink: NEWS-10.html
---

## Summary of important user-visible changes

March 28, 2025

{% include release_news_select.md %}

{::options parse_block_html="true" /}
<div class="panel callout">
* TOC
{:toc}
</div>
{::options parse_block_html="false" /}


### General improvements

- Three short form aliases have been added for long form options when starting
`octave`.
  * `-e CODE` for `--eval CODE`
  * `-g` for `--gui`
  * `-G` for `--no-gui`

- Three long form options have been introduced for clarity.
  * `--no-init-user` : Don't read user configuration files `~/.octaverc` or
    `.octaverc` files at startup.
  * `--no-init-site` : Don't read site-wide configuration files at startup.
  * `--no-init-all` : Don't read any configuration files at startup.

- `nchoosek` algorithm is now ~2x faster and provides greater precision.

- `nextpow2` algorithm is now more accurate for inputs very close to a power
  of 2.  The output class now matches the input class for Matlab compatibility.
  The function no longer accepts complex inputs and emits an error for these
  inputs.

- `jsonencode` now outputs integers and floating point integers without an
  unnecessary ".0" suffix.

- `hist` now accepts N-dimensional array inputs for input `Y`, which is
  processed in columns as if the array was flattened to a 2-dimensional array.

- The third output for `unique` is now correct when the `stable` sort option is
  used.

- Support setting breakpoints in `set` or `get` methods of `classdef`
  properties ([bug #65610](https://savannah.gnu.org/bugs/?65610)).

- `.mex` files now link to the new library `liboctmex` (instead of to
  `liboctinterp` and `liboctave`).  The `SOVERSION` of this new library is
  expected to be stable across multiple major versions of Octave.  The benefit
  is that `.mex` files will not necessarily require rebuilding for every
  major version release of Octave.

- `pkg describe` command now supports a new `Tracker` tag in the `DESCRIPTION`
  file and returns package-provided repository and bug tracker URLs.  Package
  maintainers are encouraged to utilize the new feature to redirect users to
  package-specific bug trackers instead of Savannah.

- `pkg install` now mentions package-provided URL and package-provided bug
  tracker if they exist.

### Graphical User Interface

### Graphics backend

- `polar` plots now include the center tick mark value, typically 0, in the
  `'rtick'` parameter when the plot is created.  Subsequent modifications to
  `'rtick'` by the function `rticks` will only include the center tick mark
  value if it is specified.

- `view` correctly interprets Cartesian viewpoints on main axes ([bug #65641](https://savannah.gnu.org/bugs/?65641)).

- `plot3` now draws a single marker if only one data point is given.
  Previously the plot was blank (`marker` = `"none"`) which was confusing.

### Matlab compatibility

- `height` and `width` are now aliases for the `rows` and `columns` functions.

- All colormaps now default to a size of 256 colors. (The previous default size
  was 64.)

- The first argument to `colormap` may now be a figure or axes object.  Calling
  `colormap` on a figure object will clear any `"colormap"` properties set at
  the axes level.

- `griddata` output size more consistently matches the input interpolation
  points when the inputs are vectors.  If the inputs are vectors with the
  same-orientation, then the outputs will be the same size as those vectors.
  When either input is a row vector and the other is a column vector, the
  interpolating points are processed through `meshgrid` and the output is a
  matrix the same size as the meshgrid.

- `iqr` now provides compatible output for empty inputs.

- `cross` now produces row vector outputs when the inputs are a mix of row and
  column vectors ([bug #61295](https://savannah.gnu.org/bugs/?61295)).

- `rat` now accepts complex inputs.

- The optional second input argument of `system`, denoting whether to return
  the output as a variable, is now required to be a boolean value if used.

- Octave functions whose Matlab equivalents give errors when passed non-integer
  values as sizes or dimensions now also give similar errors.  For example,
  `cell (e, pi)` now gives an error in Octave about requiring integer sizes for
  the cell array, matching Matlab behavior.  Previously, Octave's conversion
  from non-integers to integers was more lenient.

- `issorted` now accepts the `MODE` option `"monotonic"`, which has the same
  behavior as the option `"either"`.

- `movfun` and `movslice`: Functions now accept `wlen` equal to 1 or [0,0],
  non-integer values of `wlen`, and values of `wlen` that create window lengths
  exceeding the size of the target array.  `movfun` also accepts values of
  `dim` larger than the number of non-singleton dimensions in the target array.
  The `SamplePoints` option has been implemented for both functions.
  Non-numeric input array handling has been improved.  These changes affect all
  moving window functions (`movmad`, `movmax`, `movmean`, `movmedian`,
  `movmin`, `movprod`, `movstd`, `movsum`, and `movvar`) ([bug #65928](https://savannah.gnu.org/bugs/?65928),
  [bug #66025](https://savannah.gnu.org/bugs/?66025)).

- `movfun`: The `nancond` property has been fully implemented and made
  Matlab-compatible.  The `omitnan` option will ignore `NaN` and `NA` values
  when calculating the function return, and, if all elements in a window slice
  are `NaN` or `NA`, it will return the value contained in a new property
  `nanval` (default `NaN`) for that element.  The `includenan` property (the
  default) has been updated for compatibility such that any window containing
  `NaN` or `NA` will return `NaN` rather than passing those values to the
  calculating function.  `omitmissing` and `includemissing` are now accepted as
  aliases for `omitnan` and `includenan`.  These changes affect all moving
  window functions (`movmad`, `movmax`, `movmean`, `movmedian`, `movmin`,
  `movprod`, `movstd`, `movsum`, and `movvar`) ([bug #66156](https://savannah.gnu.org/bugs/?66156)).

- `movmin` and `movmax`: These functions now have their default behavior set to
  `omitnan`.  `NaN` and `NA` values will be ignored unless a moving window
  contains only `NaN` or `NA` values, in which case the function will return
  `NaN` for that element ([bug #66156](https://savannah.gnu.org/bugs/?66156)).

- `movsum`: When called with option `omitnan`, any windows containing only
  `NaN` and `NA` values will return 0 ([bug #66156](https://savannah.gnu.org/bugs/?66156)).

- `movprod`: When called with option `omitnan`, any windows containing only
  `NaN` and `NA` values will return 1 ([bug #66156](https://savannah.gnu.org/bugs/?66156)).

- `movmad`: The function now defaults to calculating median absolute deviation.
  Before Octave 10, the function calculated mean absolute deviation.  A new
  `method` property has been provided that takes values of either `"mean"` or
  `"median"` to allow the user to select which option to use.  This property
  should not be expected to function in code used outside of Octave.
  ([bug #66256](https://savannah.gnu.org/bugs/?66256)).

- `symbfact`: outputs `count`, `parent`, and `post` are now row vectors rather
  than column vectors.

### Alphabetical list of new functions added in Octave 10

* `clim`
* `rticklabels`
* `thetaticklabels`

### Deprecated functions, properties, and operators

The following functions and properties have been deprecated in Octave 10
and will be removed from Octave 12 (or whatever version is the second
major release after 10):

- Functions

        Function    | Replacement
        ------------|------------
        dsearch     | dsearchn

- Core

        Function                                     | Replacement
        ---------------------------------------------|-----------------------------------
        symbol_record_rep::mark_as_variable          | symbol_record_rep::mark_variable
        symbol_record_rep::unmark_as_variable        | symbol_record_rep::unmark_variable
        symbol_record::mark_as_variable              | symbol_record::mark_variable
        symbol_record::unmark_as_variable            | symbol_record::unmark_variable
        interpreter::verbose                         | interpreter::init_trace
        cmdline_options::verbose                     | cmdline_options::init_trace
        interpreter::read_init_files                 | interpreter::read_user_files
        cmdline_options::read_init_files             | cmdline_options::read_user_files
        __lo_ieee_isnan,    __lo_ieee_float_isnan    | std::isnan     or  isnan
        __lo_ieee_isfinite, __lo_ieee_float_isfinite | std::isfinite  or  isfinite
        __lo_ieee_isinf,    __lo_ieee_float_isinf    | std::isinf     or  isinf
        __lo_ieee_signbit,  __lo_ieee_float_signbit  | std::signbit   or  signbit
        octave_value (const Array<octave_value>& a)  | octave_value (const Cell&)

  - The `octave_value (const Array<octave_value>& a)` constructor will already
    be removed in Octave 11 (or whatever version is the next major release
    after Octave 10).

  - A new method `rwdata ()` provides direct read/write access (a pointer) to
    the data in a liboctave `Array` object (or its derived classes such as
    `Matrix`).  Historically, the method `fortran_vec ()` provided this access,
    but the name is unclear, and it is recommended to use `rwdata ()` in any
    new code.  There are no plans to deprecate `fortran_vec`.

  - The `--verbose`,`-V` command-line option has been deprecated.  Use
    `--init-trace` to print the configuration files executed during
    initialization.

The following features were deprecated in Octave 8 and have been removed
from Octave 10.

- Functions

        Function             | Replacement
        ---------------------|---------------------
        shift                | circshift
        sparse_auto_mutate   | none (see NEWS.8.md)

- `fminsearch` parameter passing: A legacy, undocumented, and only partially
  supported syntax for passing parameters to the minimized function `fcn`
  called by `fminsearch` by appending them to the input argument list was
  partly implemented since Octave 4.4.0.  Due to conflicts with other input
  methods, the documentation of this syntax was removed in Octave 5.1.0.  The
  remaining functionality has been completely removed in Octave 10.  Attempts
  to call `fminsearch` with that syntax will result in an error.  The preferred
  method of passing parameters to any of the minimization functions (including
  `fminsearch`, `fminbnd`, and `fminunc`) is through the use of anonymous
  functions.  Specific examples of this can be found in the "Minimizers"
  section of the Octave manual.

- The unsupported and unnecessary `load` options of `-force` and `-import` have
  been removed.  If legacy m-files are still invoking `load` with these options
  update the code and remove them.

### Build system

- Octave now requires a C++ compiler that is compliant with C++17 (preferably
  with GNU extensions).

- The location of the list of packages installed site-wide for all users
  (`pkg global_list`) has changed ([bug #66831](https://savannah.gnu.org/bugs/?66831)).  The file `octave_packages` is
  now installed at `octave-config -p LOCALAPIPKGDIR`.  There will be no
  disruption if you are upgrading to version 10.1 of Octave and then installing
  packages.  If you want to use previously installed packages that you *know*
  will run without re-compilation (because the package uses m-files only and no
  oct-files or mex-files), then you can execute the command
  `pkg global_list CURRENT_GLOBAL_LIST_FILE` (e.g., from within one of your
  startup files) to point Octave to the existing list.  Alternatively, run
  `pkg rebuild -global` once (potentially requires superuser rights), or copy
  `CURRENT_GLOBAL_LIST_FILE` to the path and filename returned by
  `pkg global_list`.


Summary of bugs fixed for version 10.1.0 (2025-03-28):
-----------------------------------------------------

- [bug #66753](https://savannah.gnu.org/bugs/?66753): `hist.m`: Test for equal bin spacing using a numeric tolerance.
- [bug #66753](https://savannah.gnu.org/bugs/?66753): `hist.m`: Fix regression in determining equal bin spacing.
- [bug #66753](https://savannah.gnu.org/bugs/?66753): Fix thinko in cset be1d0c816788
- [bug #66647](https://savannah.gnu.org/bugs/?66647): Silence unexpected `Octave:mixed-string-concat` warning in
  `num2str.m`.
- [bug #66642](https://savannah.gnu.org/bugs/?66642): Code beautification for cset 2c2301104caf
- [bug #66642](https://savannah.gnu.org/bugs/?66642): Check for undefined outputs in `cellfun` and `arrayfun`.
- [bug #66642](https://savannah.gnu.org/bugs/?66642): Add `cellfun` BIST for function failing to return requested
  output.
- [bug #66642](https://savannah.gnu.org/bugs/?66642): Add `arrayfun` BIST for function failing to return requested
  output.
- [bug #66617](https://savannah.gnu.org/bugs/?66617): Avoid error for `struct2cell` with function without output
  arguments.
- [bug #66617](https://savannah.gnu.org/bugs/?66617): Add self-tests for `structfun` with function without output
  arguments.
- [bug #66558](https://savannah.gnu.org/bugs/?66558): Translate shortcuts and descriptions in settings dialog.
- [bug #66521](https://savannah.gnu.org/bugs/?66521): `symbfact`: Return row vectors for Matlab compatibility.
- [bug #66511](https://savannah.gnu.org/bugs/?66511): `sparseqr`: Support permutation output with CXSparse.
- [bug #66511](https://savannah.gnu.org/bugs/?66511): Emit error when `qr()` is called with permutation output and
  CXSparse library is used.
- [bug #66488](https://savannah.gnu.org/bugs/?66488): `qr (sparse, 0)` isn't equal to `qr (sparse, 'econ', 'vector')`.
- [bug #66477](https://savannah.gnu.org/bugs/?66477): Avoid ASAN error with `path (_)` manipulations.
- [bug #66466](https://savannah.gnu.org/bugs/?66466): `legend` and `bar` cause ASAN to crash Octave.
- [bug #66451](https://savannah.gnu.org/bugs/?66451): Ctrl-C kills Octave 10.0.0.
- [bug #66448](https://savannah.gnu.org/bugs/?66448): File encoding conversion errors on macOS 14.
- [bug #66399](https://savannah.gnu.org/bugs/?66399): `fseek` and `ftell` functions don't always work correctly on
  Windows with filesizes >2GB.
- [bug #66315](https://savannah.gnu.org/bugs/?66315): `menu()` throws an error when Qt dialogs are not available.
- [bug #66256](https://savannah.gnu.org/bugs/?66256): `movmad` uses 'mean absolute deviation' while Matlab uses 'median
  absolute deviation'.
- [bug #66156](https://savannah.gnu.org/bugs/?66156): Implement `nanflag` option for moving window functions.
- [bug #66025](https://savannah.gnu.org/bugs/?66025): `movfun`: Implement `SamplePoints` option.
- [bug #66010](https://savannah.gnu.org/bugs/?66010): Function `glpk` produces incorrect output.
- [bug #65964](https://savannah.gnu.org/bugs/?65964): `nthargout` does not propagate error ID.
- [bug #65928](https://savannah.gnu.org/bugs/?65928): `movfun` dimension constraints: Shouldn't error for
  `dim > ndims(x)`, or `wlen > size(x, dim)`, or `wlen=1`.
- [bug #65876](https://savannah.gnu.org/bugs/?65876): Error retrieving data from `struct` values in `containers.Map`.
- [bug #65768](https://savannah.gnu.org/bugs/?65768): Segmentation fault on default branch.
- [bug #65753](https://savannah.gnu.org/bugs/?65753): Strip leading/trailing whitespace from "Function Index" search
  expression.
- [bug #65753](https://savannah.gnu.org/bugs/?65753): Documentation window: Function Index: Search box respects
  trailing spaces.
- [bug #65730](https://savannah.gnu.org/bugs/?65730): Some remaining cases of silent conversion of fractional inputs.
- [bug #65683](https://savannah.gnu.org/bugs/?65683): `issorted`: enable `'monotonic'` and `'strict...'` sort modes.
- [bug #65674](https://savannah.gnu.org/bugs/?65674): `axes` `'colormap'` property being set over `figure` `'colormap'`
  property.
- [bug #65665](https://savannah.gnu.org/bugs/?65665): Input validation for `system()`.
- [bug #65645](https://savannah.gnu.org/bugs/?65645): Execute FIXME of `perms.cc`: Use `constexpr` instead of template
  specialisation.
- [bug #65641](https://savannah.gnu.org/bugs/?65641): `view` produces incorrect viewpoint when given a vector aligned
  with the primary axes.
- [bug #65637](https://savannah.gnu.org/bugs/?65637): `short_disp` doesn't show ellipsis at end of long arrays.
- [bug #65617](https://savannah.gnu.org/bugs/?65617): <F9> clears editor setting 'Always show debug breakpoints and
  pointers...'.
- [bug #65577](https://savannah.gnu.org/bugs/?65577): Feature request: Editor right-click to run test without needing
  to clear `%!` first.
- [bug #65538](https://savannah.gnu.org/bugs/?65538): `xint_value` does not work the way it is intended.
- [bug #65531](https://savannah.gnu.org/bugs/?65531): `iqr` handling of empty inputs is not compatible.
- [bug #65499](https://savannah.gnu.org/bugs/?65499): Use separate GUI settings for Octave releases.
- [bug #65495](https://savannah.gnu.org/bugs/?65495): `nchoosek` error 'gcd: all values must be integers'
- [bug #65459](https://savannah.gnu.org/bugs/?65459): `uifigure ('visible', 'off')` temporarily creates a visible
  figure window.
- [bug #65447](https://savannah.gnu.org/bugs/?65447): `jsonencode` does not accept integer values larger than 999999.
- [bug #65441](https://savannah.gnu.org/bugs/?65441): `nextpow2` incorrect for some inputs slightly larger than powers
  of two.
- [bug #65238](https://savannah.gnu.org/bugs/?65238): Improve `nchoosek.m` algorithm to prevent numerical issues.
- [bug #65221](https://savannah.gnu.org/bugs/?65221): `movfun`: Create `inputParser` only once.
- [bug #65176](https://savannah.gnu.org/bugs/?65176): `unique.m`: Enable third output with option `'stable'`.
- [bug #65134](https://savannah.gnu.org/bugs/?65134): `griddata`: Output size inconsistent for vector input
  interpolation points.
- [bug #65030](https://savannah.gnu.org/bugs/?65030): Column width in browser pane not retained between restarts of
  Octave.
- [bug #65010](https://savannah.gnu.org/bugs/?65010): Compatibility: Colormaps now default to 256 colors in Matlab.
- [bug #64995](https://savannah.gnu.org/bugs/?64995): Implement `height` and `width` as aliases for `rows` and
  `columns` for Matlab compatibility.
- [bug #64991](https://savannah.gnu.org/bugs/?64991): `polar` doesn't populate `'rtick'` with center tick value.
- [bug #62928](https://savannah.gnu.org/bugs/?62928): Error sourcing file message when script with embedded '.' in
  filename has syntax error.
- [bug #61295](https://savannah.gnu.org/bugs/?61295): `cross()`: Dimensions inconsistent with Matlab when using
  mismatched input vector dimensions.
- [bug #60797](https://savannah.gnu.org/bugs/?60797): `sqrtm`: Returns `NaN` for
  matrix of ones with rows and columns >=4.
- [bug #60726](https://savannah.gnu.org/bugs/?60726): Fix `nargout` for `subsref` when returned value may be a cs-list.
- [bug #56690](https://savannah.gnu.org/bugs/?56690): Support displaying lazy index objects in variable editor.
- [bug #55961](https://savannah.gnu.org/bugs/?55961): `properties` function does not preserve order.
- [bug #55198](https://savannah.gnu.org/bugs/?55198): `rat()` should support complex numbers.
- [bug #41028](https://savannah.gnu.org/bugs/?41028): `lastwarn`: Save warning info for disabled warnings.
- [bug #41028](https://savannah.gnu.org/bugs/?41028): Modify built-in self-tests to pass with Matlab-compatible
  `lastwarn()` behavior.


## Summary of bugs fixed for version 10.2.0 (2025-05-29):

### Improvements and fixes

- `tensorprod`: Fix error for certain tensor/vector combinations ([bug #66950](https://savannah.gnu.org/bugs/?66950)).
- `mkoctfile`: Skip compiling object file with soversion for `--mex -c -o`
  ([bug #66972](https://savannah.gnu.org/bugs/?66972)).
- Fix segmentation fault in `octave-svgconvert` when called with no inputs.
- `mkoctfile`: Remove temporary C source files after compilation.
- `unicode2native`: Fix conversion of short strings to UTF-16 or UTF-32.
- Detect leading and trailing comments for all parse tree elements
  ([bug #67004](https://savannah.gnu.org/bugs/?67004)).
- `bar`: Avoid listener error when replacing an existing bar plot ([bug #67006](https://savannah.gnu.org/bugs/?67006)).
- Fix sparse matrix assignment with reverse range indexing ([bug #66516](https://savannah.gnu.org/bugs/?66516)).
- `ezplot`: Enable polar and 2-D plots of constant functions ([bug #66563](https://savannah.gnu.org/bugs/?66563)).
- Check for any kind of file not just regular files ([bug #67018](https://savannah.gnu.org/bugs/?67018)).
- `var`/`std`: Issue an error for non-floating point inputs. Previous versions
  accepted integer type inputs but could produce erroneous outputs due to
  integer arithmetic and under/overflow errors ([bug #67016](https://savannah.gnu.org/bugs/?67016)).
- `annotation`: Change `"verticalalignment"` default value ([bug #67033](https://savannah.gnu.org/bugs/?67033)).
- Previously, symbols that are not actually callable by a user might have been
  added to the list of callable functions when loading .mex files.  Remove
  these symbols from that list.  This fixes unloading .mex files with `clear`.
- Remove break points only from user functions (defined in .m file).  This
  fixes an infinite recursion issue when re-loading updated .oct or .mex files.
- For improved Matlab compatibility the `strncmp` and `strncmpi` functions now
  return `true` if the number of characters specified by `N` is equal to 0
  ([bug #57879](https://savannah.gnu.org/bugs/?57879)).
- Fix `nargout` in multi-output indexing expressions beginning with function
  call ([bug #67096](https://savannah.gnu.org/bugs/?67096)).
- `findobj`: Do not match empty tags with `[]` ([bug #67048](https://savannah.gnu.org/bugs/?67048)).
- Check for undefined output when indexing function output ([bug #67111](https://savannah.gnu.org/bugs/?67111)).
- `perms`: Fix buffer overflow and crash; minor code cleanup ([bug #67115](https://savannah.gnu.org/bugs/?67115)).
- `mkoctfile`: Support spaces in output path of linker step.
- `mkoctfile`: Support spaces in path to binary when stripping debug info.
- `octave-svgconvert`: Speed up printing to PDF ([bug #66959](https://savannah.gnu.org/bugs/?66959)).
- `error`: Fix segmentation fault on missing fields in `err.stack` structure
  ([bug #67143](https://savannah.gnu.org/bugs/?67143)).
- Avoid parse error for empty lines in debug mode ([bug #67108](https://savannah.gnu.org/bugs/?67108)).
- Check if effective SOVERSION is exported from .mex file libraries
  ([bug #67163](https://savannah.gnu.org/bugs/?67163)).

### GUI

- Fix build error without QScintilla installed ([bug #66962](https://savannah.gnu.org/bugs/?66962)).
- Avoid potential integer overflow on Windows.
- Make dialogs shown by `inputdlg`, `listdlg`, `questdlg`, `uigetdir`, or
  `uigetfile` modal.

### Build system / Tests

- Add visibility attributes for the `octave::base_fcn_handle` class.
- Add visibility attributes to parse tree symbols ([bug #67056](https://savannah.gnu.org/bugs/?67056)).
- Add visibility attributes to `Array<T>` template class member functions.
- Use correct preprocessor macro when instantiating `MArray` template class.
- Disable visibility flags by default.
- Support passing additional flags when linking `octave*` executables.
- Single-quote path that might contain unescaped backslashes in the generation
  of the doc cache.
- Ignore deprecation warning for `std::wbuffer_convert` in header.
- `error`: Add more built-in self-tests.

### Documentation

- Recommend use of string function name as first argument to `cellfun()`.
- `cellfun`: Call out special accelerated functions.
- Update documentation for `feval`, `eval`, `evalin`, `evalc`.
- `axis`: Remove incorrect statement from documentation.
- Do not put graphics object categories into Graphic Properties Index.
- Adjust Perl regexp used to remove leading ':' in HTML.
- `char`: Document calling form with no inputs.
- Fix missing hyperlinks in Table of Contents of Octave manual.
- Fix overfull hbox warnings in Texinfo log files.
- Replace Texinfo `@dots` macro with `@enddots` macro where appropriate.
- Do not print ugly black boxes for overfull hboxes in PDF output.
- Fix accidental doc text inclusions after `@deftypefn`.
- Remove reference to Octave Forge in `stats.txi`.
- Document use of `:` keyword as a range operator.
- Correct and expand documentation on ranges.
- Remove outdated text on range arithmetic from manual.
- Examples: Add missing namespace `octave` when calling built-in function in
  `standalonebuiltin.cc`.
- Document calling `error()` with structure input ([bug #67143](https://savannah.gnu.org/bugs/?67143)).

## Summary of bugs fixed for version 10.3.0 (2025-09-23):

### Improvements and fixes

- Correctly interpret command line option `--no-init-user` ([bug #67187](https://savannah.gnu.org/bugs/?67187)).
- `image`: Avoid error if image data is empty ([bug #65866](https://savannah.gnu.org/bugs/?65866)).
- Respect logarithmic scaling of axis when plotting scatter objects
  ([bug #67239](https://savannah.gnu.org/bugs/?67239)).
- Avoid segmentation fault with display with too low color depth ([bug #65866](https://savannah.gnu.org/bugs/?65866)).
- Store save type in `binary-float` format also for empty matrices
  ([bug #67271](https://savannah.gnu.org/bugs/?67271)).
- Fix ASAN bug in liboctave `svd` code caused by use of
  `std::vector::reserve ()` ([bug #67248](https://savannah.gnu.org/bugs/?67248)).
- `mldivide`: Correctly apply permutation for sparse matrix with permuted lower
  form.
- Allow empty field names in `struct` and `cell2struct` functions ([bug #67255](https://savannah.gnu.org/bugs/?67255)).
- `containers.Map`: Allow empty `char` arrays as keys ([bug #67255](https://savannah.gnu.org/bugs/?67255)).
- Fix ASAN warnings in `__ilu__.cc` ([bug #67249](https://savannah.gnu.org/bugs/?67249)).
- `rose.m`: Fix regression where output variables always returned ([bug #48889](https://savannah.gnu.org/bugs/?48889)).
- `rose.m`: Overhaul function to resolve incorrect custom bin placement
  ([bug #67280](https://savannah.gnu.org/bugs/?67280)).
- Clarify the `"Octave:language-extension"` warning message for comparing
  complex numbers that the compatibility difference is that Octave considers
  the complex part of the number ([bug #67257](https://savannah.gnu.org/bugs/?67257)).
- `delaunayn.m`: Check inputs for non-finite values to avoid segfault in QHull
  ([bug #67315](https://savannah.gnu.org/bugs/?67315)).
- Fix calculation of "nearest integer" function ([bug #67339](https://savannah.gnu.org/bugs/?67339)).
- `struct2hdl.m`: Use a consistent output type for `valcomp` ([bug #67217](https://savannah.gnu.org/bugs/?67217)).
- Avoid crash when Octave invoked with `-d` argument.
- Skip saving too large arrays in `-binary` format ([bug #67382](https://savannah.gnu.org/bugs/?67382)).
- Write and read large array in chunks for `-binary` file format ([bug #67382](https://savannah.gnu.org/bugs/?67382)).
- Correctly parse `clear ?` ([bug #67459](https://savannah.gnu.org/bugs/?67459)).
- `colorbar.m`: Don't emit error if "position" property given ([bug #67537](https://savannah.gnu.org/bugs/?67537)).

### GUI

- Fix `SIGABRT` on exit of GUI ([bug #67230](https://savannah.gnu.org/bugs/?67230)).
- Fix focus when reopening editor file from MRU list ([bug #67384](https://savannah.gnu.org/bugs/?67384)).

### Build system / Tests

- Add tests for shadowed functions in core Octave ([bug #46849](https://savannah.gnu.org/bugs/?46849)).
- Fix building Java on solaris2 platforms ([bug #67442](https://savannah.gnu.org/bugs/?67442)).
- Include `ida.h` in configure tests from the locations at which it is looked
  for.
- Do not check for `nvector_serial.h` without folder in configure test.

### Documentation

- Expand on orthogonality properties of the cross product ([bug #67186](https://savannah.gnu.org/bugs/?67186)).
- Remove newline before `@tex` invocation for better alignment.
- Remove notes in documentation scheduled for deletion in version 9.1.
- Clarify use of "interpreter" property when printing.
- Improve TeX output for vector calculus functions.
- Explain more clearly uses and pitfalls of `NA`.
- Add documentation for hexadecimal and binary integer constants ([bug #67645](https://savannah.gnu.org/bugs/?67645)).
- Use `IEEE@tie{}754` when referring to floating point standard.
- `diary`: Clarify documentation.
- `echo`: Clarify documentation.
- Update manual for `--traditional` option to note that `PS4` is set.
