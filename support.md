---
layout: page
title: Support/Help
menu: true
---

If you need help using Octave, you have many options, from reading
the Octave manual, asking for help on the mailing lists, chatting
online with other Octave users, or paying for [commercial support][1].

The Octave community is a loosely organized association of
volunteers.  Your interactions with the community will be better
if you have the [right expectations about the support options][2]
available to you.

[1]: {{ "commercial-support.html" | relative_url }}
[2]: {{ "support-expectations.html" | relative_url }}



# Documentation

There is an [Online Manual][3] and a [PDF Version][4] of the comprehensive
~1000 page manual.  This full documentation of Octave is generated directly
from the Texinfo source files that are distributed along with every copy of
the Octave source code.  The complete text of the manual is also available
at the Octave prompt using the `doc` command.

You can [order printed versions of the Octave manual][5] to support the
development of GNU Octave.

[3]: {{ site.docs_url }}
[4]: {{ "octave.pdf" | relative_url }}
[5]: {{ site.wiki_url }}/Publications_using_Octave#Printed_manuals


# Octave Wiki and FAQ

The [Octave Wiki][6] is a great place to look for information about
things that are not covered in the manual, or other transient topics
(Google Summer of Code, Octave Conferences, etc.).

Additionally, the wiki contains a list of
[frequently asked questions (FAQ)][7].

[6]: {{ site.wiki_url }}
[7]: {{ site.faq_url }}


# Contacting the user community

- **Mailing List**:
  If your question isn't answered in the FAQ, the manual, or the Wiki,
  the [**`{{ site.help_email }}`**][8] mailing list is a good resource.

  You can also [subscribe][9] to `{{ site.help_email }}` or try to search in the
  mailing list archive for an answer:

  <form action="http://octave.1599824.n4.nabble.com/template/NamlServlet.jtp">
  <div class="row">
    <div class="columns medium-12">
      <div class="row collapse">
        <div class="columns medium-7">
          <input name="macro" value="search_page" type="hidden">
          <input name="node" value="1599825" type="hidden">
          <input id="query" name="query" size="25" placeholder="Search in {{ site.help_email }} archive">
        </div>
        <div class="columns medium-3">
          <select name="days">
          <option value="0" selected="">all dates</option>
          <option value="1">past 24 hours</option>
          <option value="7">past week</option>
          <option value="30">past month</option>
          <option value="90">past 3 months</option>
          <option value="180">past 6 months</option>
          <option value="365">past year</option>
          </select>
        </div>
        <div class="columns medium-2">
          <input class="button postfix" value="Search" type="submit">
        </div>
      </div>
    </div>
  </div>
  </form>

  <div class="row ">
    <div class="columns small-12">
      <div class="panel callout">
      Please do <strong>not</strong> send any bug reports to the
      <samp>{{ site.help_email }}</samp> mailing list.
      Most Octave users do not want to receive bug reports.
      </div>
    </div>
  </div>

- **IRC Chat**:
  Too impatient for email? You can find Octave developers and users on the
  [`{{ site.irc_channel }}` channel][10] at [`{{ site.irc_network }}`][11].
  The atmosphere is relaxed and chat isn't restricted to matters strictly
  pertaining to Octave.

[8]: mailto:{{ site.help_email }}
[9]: https://lists.gnu.org/mailman/listinfo/help-octave
[10]: https://webchat.freenode.net/?channels=octave&amp;uio=MT1mYWxzZSYyPXRydWUmMTI9dHJ1ZQda
[11]: https://freenode.net
