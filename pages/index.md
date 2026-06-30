---
layout: default
permalink: index
---

<div class="home">

  <!-- ===== Background: subtle plot accent on a white page ===== -->
  <div class="home-bg" aria-hidden="true">
    <img class="home-bg-surface" src="{{ "/img/PDE.svg" | relative_url }}" alt="">
  </div>

  <div class="home-content">

    <!-- ===== Hero ===== -->
    <section class="home-hero">
      <div class="grid-x grid-margin-x align-middle">
        <div class="cell home-hero-content">
          <div class="home-hero-brand">
            <img class="home-hero-logo" src="{{ "/img/octave-logo.svg" | relative_url }}"
                 alt="GNU Octave logo">
            <span class="home-eyebrow">Free and open source</span>
          </div>
          <h1 class="home-title">GNU Octave</h1>
          <p class="home-subtitle">Scientific programming and numerical computing, free and open source.</p>
          <p class="home-lead">
            GNU Octave is a high-level language for numerical computations, with a
            powerful mathematics-oriented syntax, built-in 2D/3D plotting, and a rich
            set of tools for linear algebra. It is largely compatible with
            MATLAB-style workflows, so many existing scripts run with little or no change.
          </p>
          <div class="home-cta">
            <a class="home-btn home-btn-primary" href="{{ "/download.html" | relative_url }}">
              <i class="fas fa-download" aria-hidden="true"></i> Download
            </a>
            <a class="home-btn home-btn-secondary" href="{{ site.docs_url }}">
              <i class="fas fa-book" aria-hidden="true"></i> Documentation
            </a>
            <a class="home-btn home-btn-ghost" href="{{ "/get-involved.html" | relative_url }}">
              <i class="fas fa-users" aria-hidden="true"></i> Contribute
            </a>
          </div>
          <div class="grid-x grid-margin-x align-middle home-zigzag">
            <div class="cell medium-7">
              <figure class="home-graph home-graph-left home-graph-hero">
                <img src="{{ "/img/math-graph.svg" | relative_url }}" alt="Math graph">
              </figure>
            </div>
            <div class="cell medium-5">
              <article class="home-feature home-feature-up">
                <h3><i class="fas fa-chart-line" aria-hidden="true"></i> Plotting &amp; visualization</h3>
                <p>High-level 2-D and 3-D plotting commands are built right in.</p>
              </article>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- ===== Features (zig-zag: graph + block, alternating sides) ===== -->
    <section class="home-section home-section-gap">

      <!-- graph right -->
      <div class="grid-x grid-margin-x align-middle home-zigzag">
        <div class="cell medium-5">
          <article class="home-feature home-feature-up">
            <h3><i class="fas fa-th" aria-hidden="true"></i> Matrix &amp; vector computation</h3>
            <p>First-class arrays with linear algebra for systems, decompositions, and transforms.</p>
          </article>
        </div>
        <div class="cell medium-7">
          <figure class="home-graph home-graph-right home-graph-curved">
            <img src="{{ "/img/curved.svg" | relative_url }}" alt="Curve plot">
          </figure>
        </div>
      </div>

      <!-- graph left -->
      <div class="grid-x grid-margin-x align-middle home-zigzag">
        <div class="cell medium-7">
          <figure class="home-graph home-graph-left">
            <img src="{{ "/img/heateuqation.svg" | relative_url }}" alt="Heat equation">
          </figure>
        </div>
        <div class="cell medium-5">
          <article class="home-feature">
            <h3><i class="fas fa-square-root-alt" aria-hidden="true"></i> Numerical methods</h3>
            <p>Tools for optimization, integration, differential equations, and statistics.</p>
          </article>
        </div>
      </div>

      <!-- graph right -->
      <div class="grid-x grid-margin-x align-middle home-zigzag">
        <div class="cell medium-5">
          <article class="home-feature">
            <h3><i class="fas fa-code" aria-hidden="true"></i> MATLAB-compatible scripting</h3>
            <p>Run many existing MATLAB-style scripts with little or no modification.</p>
          </article>
        </div>
        <div class="cell medium-7">
          <figure class="home-graph home-graph-right">
            <img src="{{ "/img/PDE2.svg" | relative_url }}" alt="Partial differential equation">
          </figure>
        </div>
      </div>

    </section>

  </div><!-- /.home-content -->
</div><!-- /.home -->
