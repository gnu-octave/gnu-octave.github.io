---
layout: page
title: Support
icon: <i class="fas fa-book-medical"></i>
menu: true
permalink: support
---

#### <i class="fas fa-book"></i> Read the **GNU Octave Manual**

<div style="margin-left: 2em;" markdown="1">
- [<i class="fas fa-globe-americas"></i> Web version]({{ site.docs_url }})
- [<i class="fas fa-file-pdf"></i> PDF version]({{ "octave.pdf" | relative_url }})
- Type `doc` inside Octave
</div>


#### <i class="fab fa-wikipedia-w"></i> [Octave Wiki]({{ site.wiki_url }})

<div style="margin-left: 2em;" markdown="1">
Find [Frequently Asked Questions (FAQ)]({{ site.faq_url }})
</div>

#### <i class="fas fa-users"></i> User community

<div style="margin-left: 2em;" markdown="1">
The Octave user community is a loosely organized association of **volunteers**.
Your interactions with the community will be better if you have the
[right expectations about the support options]({{ "support-expectations.html" | relative_url }})
available to you.
</div>

<div style="margin-left: 2em;" markdown="1">
- [<i class="fab fa-discourse"></i> **Discourse**]({{ site.discourse_url }}) --
  the major communication platform for Octave users and developers.
- <i class="far fa-comments"></i> **IRC**: Chat with users and developers on the
  [Libera `#octave` channel](https://web.libera.chat/#octave).
- <i class="far fa-envelope"></i> Browse the old
  [**mailing list archives**](https://lists.gnu.org/archive/html/help-octave/).
</div>


#### <i class="fas fa-comment-dollar"></i> [Commercial support]({{ "commercial-support.html" | relative_url }})

<div style="margin-left: 2em;" markdown="1">
- Setup assistance
- Custom feature implementation
</div>

#### <i class="fas fa-bug"></i> Report a bug

GNU Octave uses the bug tracker at [GNU Savannah]({{ site.bugs_url }}).
There you can
[<i class="far fa-plus-square"></i> report a new bug](https://savannah.gnu.org/bugs/?group=octave&func=additem),
[<i class="far fa-list-alt"></i> browse recent bugs]({{ site.bugs_url }}),
or [<i class="fas fa-search"></i> search for bugs](https://savannah.gnu.org/bugs/?group=octave&func=search).

<a href="{{ "/img/savannah_bug_report.png" | relative_url }}">
  <img src="{{ "/img/savannah_bug_report.png" | relative_url }}"
        style="max-height: 250px; width: auto;" alt="Savannah bug report">
</a>

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


#### Sending Patches for Octave

If you have a suggested fix for a bug,
please attach it to your report in the tracker.
Your patch is more likely to be reviewed if you follow the guidelines from the
Octave Wiki about the [creation of changesets]({{ site.wiki_url }}/Mercurial).
