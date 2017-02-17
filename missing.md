---
layout: page
title: Missing functions
menu: false
---

GNU Octave strives to be among the very best numerical tools available.
While compatibility with Matlab is one of many strong features of Octave,
we have not achieved 100% compatibility.
If you are reading this page, it is most likely because you attempted to
use a function that is part of core Matlab, but has yet to be implemented
in Octave.

There can be several reasons for the given function not to exist in Octave:

- The function may exist in [Octave-Forge][1], but has not yet been adopted
  as a part of the core Octave distribution.  You can try to look for your
  function in the [alphabetical list of functions][2] at the Octave-Forge
  web site to see if it is available in some package.

- The function may be new to Matlab.  It is possible that the Octave
  community simply does not know it exists.  Should this be the case,
  feel free to open a feature request in the [Octave bug tracker][3].


The Octave community is a loosely organized association of volunteers.
Development might sometimes not be fast enough for your needs.
If you have a feature request for Octave, the best way to ensure that your
suggested improvement becomes a reality is either to [implement it yourself][4]
or to [hire a developer do it for you][5].

[1]: {{ site.sourceforge_url }}
[2]: {{ site.sourceforge_url }}/functions_by_alpha.php
[3]: {{ site.bugs_url }}
[4]: {{ "get-involved.html" | relative_url }}
[5]: {{ "commercial-support.html" | relative_url }}
