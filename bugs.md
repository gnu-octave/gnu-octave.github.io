---
layout: page
title: Bugs
menu: true
---

GNU Octave uses the bug tracker at [Savannah]({{ site.bugs_url }}).
There you can [report a new bug]({{ site.bugs_url }}&func=additem),
[browse recent bugs]({{ site.bugs_url }}),
or [search for bugs]({{ site.bugs_url }}&func=search).

### Guidelines for reporting a new bug

1. **Is the bug already known?**

   - [Search for already reported bugs at the bug tracker]({{ site.bugs_url }}&func=search),
   - look at the
     [list of known causes of trouble]({{ site.docs_url }}/Trouble.html)
     in the Octave manual.

   <p></p>

   If you your problem **does not appear** to be known,
   then you should report the problem.

2. **Is it really a bug?**

   - If Octave **crashes**, for any input whatever, that is a bug.
     Reliable interpreters never crash.
   - If Octave produces **incorrect results**, for any input whatever,
     that is a bug.
   - If Octave produces an **error message** for **valid input**, that is a bug.
   - If Octave produces **no error message** for **invalid input**,
     that is a bug.

   <p></p>

3. **Missing function in Octave**

   - If the function is
     [part of some Octave Forge package]({{ site.sourceforge_url }}/functions_by_alpha.php),
     this is **not** a bug.
   - If the function **exists in Matlab**,
     but **not in core Octave** and **not in Octave Forge packages**,
     that is a bug.

   <p></p>

   It might take several months or years until for new features to become part
   of Octave, consider
   [commercial support]({{ "commercial-support.html" | relative_url }})
   if you don't want to wait that long).

4. **Make your bug report count**

   - **Report all the facts:**<br>
     Include all information that make it possible to fix the bug.
     If you are not sure whether to state a fact or leave it out, state it.
     This information includes your **operating system**, **Octave version**,
     **exact error message** or **exact output**.
   - **Give a short, specific, complete example:**<br>
     Avoid: pseudocode, uninitialized variables,
     calls to unattached scripts or functions.
   - **Justify your exectations briefly:**<br>
     Although it might seem obvious to you,
     someone examining the problem might not know what result you consider
     correct.


### Sending Patches for Octave

If you have a suggested fix for a bug,
please attach it to your report in the tracker.
Your patch is more likely to be reviewed if you follow the guidelines from the
Octave Wiki about the [creation of changesets]({{ site.wiki_url }}/Mercurial).
