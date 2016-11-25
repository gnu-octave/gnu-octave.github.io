---
layout: page
title: Bugs
menu: false
---

GNU Octave uses the bug tracker at [Savannah][1].
There you can [report a new bug][2], [browse recent bugs][1],
or [search for bugs][3].

[1]: {{ site.bugs_url }}
[2]: {{ site.bugs_url }}&func=additem
[3]: {{ site.bugs_url }}&func=search

<div class="row">
  <div class="columns small-12">
    <div class="panel callout">
    Please do <strong>not</strong> send any bug reports to the
    <samp>{{ site.help_email }}</samp> mailing list.
    Most Octave users do not want to receive bug reports.
    </div>
  </div>
</div>

<div class="row ">
  <div class="columns small-12">
    <div class="panel callout">
    <strong>Before</strong> reporting a new bug, please read the guidelines below.
    </div>
  </div>
</div>



# Is the bug already known?

When you encounter a problem,
the first thing to do is to see if it is already known.
Therefore,

- [search for already reported bugs at the bug tracker][3],

- look at the [list of known causes of trouble][4] in the Octave manual.

If you your problem does not appear to be known,
then you should report the problem.

Reporting a bug may help you by bringing a solution to your problem,
or it may not.  In any case, the principal function of a bug report is
to help the entire community by making the next version of Octave work
better, so you can contribute to the maintenance of Octave.

[4]: {{ site.docs_url }}/Trouble.html#Trouble



# Is it really a bug?

If you are not sure whether you have found a bug, here are some guidelines:

- If Octave gets a fatal signal, for any input whatever, that is a bug.
  Reliable interpreters never crash.

- If Octave produces incorrect results, for any input whatever, that is a bug.

- Some output may appear to be incorrect when it is in fact due to a
  program whose behavior is undefined, which happened by chance to give
  the desired results on another system.  For example, trigonometric
  functions may produce different results because of differences in the
  math library or the way floating point arithmetic is handled on various
  systems.

- If Octave produces an error message for valid input, that is a bug.

- If Octave does not produce an error message for invalid input, that is
  a bug.  However, you should note that your idea of "invalid input"
  might be my idea of "an extension" or "support for traditional practice".

- If you are an experienced user of programs like Octave, your
  suggestions for improvement are welcome in any case.



# Make your bug report count

In order for a bug report to serve its purpose, you must include the
information that makes it possible to fix the bug.

The fundamental principle of reporting bugs usefully is this:
**report all the facts**.  If you are not sure whether to
state a fact or leave it out, state it.

Often people omit facts because they think they know what causes the
problem and they conclude that some details don't matter.  Thus, you
might assume that the name of the variable you use in an example does
not matter.  Well, probably it doesn't, but one cannot be sure.
Perhaps the bug is a stray memory reference which happens to fetch
from the location where that name is stored in memory; perhaps, if the
name were different, the contents of that location would fool the
interpreter into doing the right thing despite the bug.  Play it safe
and give a specific, complete example.

Keep in mind that the purpose of a bug report is to enable someone to
fix the bug if it is not known. Always write your bug reports on
the assumption that the bug is not known.

Sometimes people give a few sketchy facts and ask, "Does this ring a
bell?"  This cannot help us fix a bug.  It is better to send a complete
bug report to begin with.

Try to make your bug report self-contained.  If we have to ask you for
more information, it is best if you include all the previous information
in your response, as well as the information that was missing.

The bug tracker will prompt you for some basic information like
the version of Octave and the operating system you are using.  You
also need to include the following to enable someone to
investigate the bug:

- A complete input file that will reproduce the bug.

  A single statement may not be enough of an example--the bug might
  depend on other details that are missing from the single statement where
  the error finally occurs.

- The command arguments you gave Octave to execute that example
  and observe the bug.  To guarantee you won't omit something important,
  list all the options.

  If we were to try to guess the arguments, we would probably guess wrong
  and then we would not encounter the bug.

- A description of what behavior you observe that you believe is incorrect.
  For example, "The interpreter gets a fatal signal," or, "The output produced
  at line 208 is incorrect."

- The output you expected to see.  Although it might seem obvious to you,
  someone examining the problem might not know what result you consider
  correct.

- If you wish to suggest changes to the Octave source, send them as context
  diffs.  If you discuss something in the Octave source, refer to it by
  context, not by line number, because the line numbers in the development
  sources probably won't match those in your sources.



# Sending Patches for Octave

If you have a suggested fix for a bug, please attach it to your report in
the tracker.  Your patch is more likely to be reviewed if you follow the
guidelines from the Octave Wiki about the [creation of changesets][5]
and submit patches for Octave.

[5]: {{ site.wiki_url }}/Mercurial#Submitting_patches
