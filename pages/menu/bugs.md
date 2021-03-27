---
layout: page
title: Bugs
icon: <i class="fas fa-bug"></i>
menu: true
permalink: bugs
---

GNU Octave uses the bug tracker at [GNU Savannah]({{ site.bugs_url }}).
There you can
[<i class="far fa-plus-square"></i> report a new bug](https://savannah.gnu.org/bugs/?group=octave&func=additem),
[<i class="far fa-list-alt"></i> browse recent bugs]({{ site.bugs_url }}),
or [<i class="fas fa-search"></i> search for bugs](https://savannah.gnu.org/bugs/?group=octave&func=search).

### Guidelines for reporting a new bug

1. **Is the bug already known?**

   [<i class="fas fa-search"></i> Search for already reported bugs](https://savannah.gnu.org/bugs/?group=octave&func=search)
   at the bug tracker first.
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

   If a function exists in Matlab, but not in Octave, this is **not** a bug.

   - The function might already be
     [part of an Octave package]({{ site.sourceforge_url }}/functions_by_alpha.php).
   - You may file a **feature request** for it on the bug tracker.

   <p></p>

   Please be aware that it might take **several months**
   until for new features become part of Octave.
   Consider [<i class="fas fa-comment-dollar"></i> commercial support]({{ "commercial-support.html" | relative_url }})
   if you don't want to wait that long.

4. **Make your bug report count**

   - **Report all the facts:**<br>
     Include all information that make it possible to fix the bug.
     If you are not sure whether to state a fact or leave it out, state it.
     This information includes your **operating system**, **Octave version**,
     **exact error message** or **exact output**.
   - **Give a short, specific, complete example:**<br>
     Avoid: pseudocode, uninitialized variables,
     calls to unattached scripts or functions.
   - **Justify your expectations briefly:**<br>
     Although it might seem obvious to you,
     someone examining the problem might not know what result you consider
     correct.


### Sending Patches for Octave

If you have a suggested fix for a bug,
please attach it to your report in the tracker.
Your patch is more likely to be reviewed if you follow the guidelines from the
Octave Wiki about the [creation of changesets]({{ site.wiki_url }}/Mercurial).
