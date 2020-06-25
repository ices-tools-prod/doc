<!-- <!DOCTYPE html> -->

<html>

<head>

<meta charset="utf-8" />
<meta name="generator" content="pandoc" />
<meta http-equiv="X-UA-Compatible" content="IE=EDGE" />

<meta name="viewport" content="width=device-width, initial-scale=1" />



<!-- <title>R Package Development at ICES</title> -->






<!-- <style type="text/css">body {
background-color: #fff;
margin: 1em auto;
max-width: 700px;
overflow: visible;
padding-left: 2em;
padding-right: 2em;
font-family: "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
font-size: 14px;
line-height: 1.35;
}
#TOC {
clear: both;
margin: 0 0 10px 10px;
padding: 4px;
width: 400px;
border: 1px solid #CCCCCC;
border-radius: 5px;
background-color: #f6f6f6;
font-size: 13px;
line-height: 1.3;
}
#TOC .toctitle {
font-weight: bold;
font-size: 15px;
margin-left: 5px;
}
#TOC ul {
padding-left: 40px;
margin-left: -1.5em;
margin-top: 5px;
margin-bottom: 5px;
}
#TOC ul ul {
margin-left: -2em;
}
#TOC li {
line-height: 16px;
}
table {
margin: 1em auto;
border-width: 1px;
border-color: #DDDDDD;
border-style: outset;
border-collapse: collapse;
}
table th {
border-width: 2px;
padding: 5px;
border-style: inset;
}
table td {
border-width: 1px;
border-style: inset;
line-height: 18px;
padding: 5px 5px;
}
table, table th, table td {
border-left-style: none;
border-right-style: none;
}
table thead, table tr.even {
background-color: #f7f7f7;
}
p {
margin: 0.5em 0;
}
blockquote {
background-color: #f6f6f6;
padding: 0.25em 0.75em;
}
hr {
border-style: solid;
border: none;
border-top: 1px solid #777;
margin: 28px 0;
}
dl {
margin-left: 0;
}
dl dd {
margin-bottom: 13px;
margin-left: 13px;
}
dl dt {
font-weight: bold;
}
ul {
margin-top: 0;
}
ul li {
list-style: circle outside;
}
ul ul {
margin-bottom: 0;
}
pre, code {
background-color: #f7f7f7;
border-radius: 3px;
color: #333;
white-space: pre-wrap; 
}
pre {
border-radius: 3px;
margin: 5px 0px 10px 0px;
padding: 10px;
}
pre:not([class]) {
background-color: #f7f7f7;
}
code {
font-family: Consolas, Monaco, 'Courier New', monospace;
font-size: 85%;
}
p > code, li > code {
padding: 2px 0px;
}
div.figure {
text-align: center;
}
img {
background-color: #FFFFFF;
padding: 2px;
border: 1px solid #DDDDDD;
border-radius: 3px;
border: 1px solid #CCCCCC;
margin: 0 5px;
}
h1 {
margin-top: 0;
font-size: 35px;
line-height: 40px;
}
h2 {
border-bottom: 4px solid #f7f7f7;
padding-top: 10px;
padding-bottom: 2px;
font-size: 145%;
}
h3 {
border-bottom: 2px solid #f7f7f7;
padding-top: 10px;
font-size: 120%;
}
h4 {
border-bottom: 1px solid #f7f7f7;
margin-left: 8px;
font-size: 105%;
}
h5, h6 {
border-bottom: 1px solid #ccc;
font-size: 105%;
}
a {
color: #0033dd;
text-decoration: none;
}
a:hover {
color: #6666ff; }
a:visited {
color: #800080; }
a:visited:hover {
color: #BB00BB; }
a[href^="http:"] {
text-decoration: underline; }
a[href^="https:"] {
text-decoration: underline; }

code > span.kw { color: #555; font-weight: bold; } 
code > span.dt { color: #902000; } 
code > span.dv { color: #40a070; } 
code > span.bn { color: #d14; } 
code > span.fl { color: #d14; } 
code > span.ch { color: #d14; } 
code > span.st { color: #d14; } 
code > span.co { color: #888888; font-style: italic; } 
code > span.ot { color: #007020; } 
code > span.al { color: #ff0000; font-weight: bold; } 
code > span.fu { color: #900; font-weight: bold; } 
code > span.er { color: #a61717; background-color: #e3d2d2; } 
</style> -->




</head>

<body>




<h1 class="title toc-ignore">R Package Development at ICES</h1>


<div id="TOC">
<ul>
<li><a href="#introduction"><span class="toc-section-number">1</span> Introduction</a><ul>
<li><a href="#this-document"><span class="toc-section-number">1.1</span> This document</a></li>
<li><a href="#where-ices-packages-live"><span class="toc-section-number">1.2</span> Where ICES packages live</a></li>
<li><a href="#the-icesadvice-package"><span class="toc-section-number">1.3</span> The icesAdvice package</a></li>
</ul></li>
<li><a href="#root-files"><span class="toc-section-number">2</span> Root files</a><ul>
<li><a href="#rbuildignore"><span class="toc-section-number">2.1</span> .Rbuildignore</a></li>
<li><a href="#travis.yml"><span class="toc-section-number">2.2</span> .travis.yml</a></li>
<li><a href="#description"><span class="toc-section-number">2.3</span> DESCRIPTION</a></li>
<li><a href="#namespace"><span class="toc-section-number">2.4</span> NAMESPACE</a></li>
<li><a href="#news"><span class="toc-section-number">2.5</span> NEWS</a></li>
<li><a href="#readme.md"><span class="toc-section-number">2.6</span> README.md</a></li>
</ul></li>
<li><a href="#r-files"><span class="toc-section-number">3</span> R files</a><ul>
<li><a href="#bpa.r"><span class="toc-section-number">3.1</span> Bpa.R</a></li>
<li><a href="#fpa.r-sigmaci.r-sigmapa.r"><span class="toc-section-number">3.2</span> Fpa.R, sigmaCI.R, sigmaPA.R</a></li>
<li><a href="#icesadvice-package.r"><span class="toc-section-number">3.3</span> icesAdvice-package.R</a></li>
</ul></li>
<li><a href="#development-guidelines"><span class="toc-section-number">4</span> Development guidelines</a><ul>
<li><a href="#build-and-check"><span class="toc-section-number">4.1</span> Build and check</a></li>
<li><a href="#document-user-visible-changes"><span class="toc-section-number">4.2</span> Document user-visible changes</a></li>
<li><a href="#version-number"><span class="toc-section-number">4.3</span> Version number</a></li>
<li><a href="#dependencies"><span class="toc-section-number">4.4</span> Dependencies</a></li>
<li><a href="#adding-a-new-function"><span class="toc-section-number">4.5</span> Adding a new function</a></li>
<li><a href="#help-page-sections"><span class="toc-section-number">4.6</span> Help page sections</a></li>
<li><a href="#style"><span class="toc-section-number">4.7</span> Style</a></li>
</ul></li>
<li><a href="#release-procedure"><span class="toc-section-number">5</span> Release procedure</a><ul>
<li><a href="#pre-release"><span class="toc-section-number">5.1</span> Pre-release</a></li>
<li><a href="#submit"><span class="toc-section-number">5.2</span> Submit</a></li>
<li><a href="#post-release"><span class="toc-section-number">5.3</span> Post-release</a></li>
</ul></li>
<li><a href="#references-1"><span class="toc-section-number">6</span> References</a><ul>
<li><a href="#writing-r-packages"><span class="toc-section-number">6.1</span> Writing R packages</a></li>
<li><a href="#development-tools"><span class="toc-section-number">6.2</span> Development tools</a></li>
</ul></li>
</ul>
</div>

<p><br></p>
<div id="introduction" class="section level1">
<h1><span class="header-section-number">1</span> Introduction</h1>
<div id="this-document" class="section level2">
<h2><span class="header-section-number">1.1</span> This document</h2>
<div id="a-guided-tour" class="section level3">
<h3><span class="header-section-number">1.1.1</span> A guided tour</h3>
<p>This document provides a basic overview of how we might organize R package development at ICES. The intended audience is R programmers within the ICES community, who might contribute functions to R packages maintained by the ICES Secretariat.</p>
<p>The overview is organized as a quick walk through the inner structure of the <strong>icesAdvice</strong> package version <a href="https://github.com/ices-tools-prod/icesAdvice/tree/1.1-0">1.1-0</a> (CRAN version from 18 May 2016). Using this minimal example, the essential topics are visited by going through one file at a time.</p>
</div>
<div id="references" class="section level3">
<h3><span class="header-section-number">1.1.2</span> References</h3>
<p>The overview concludes with a list of free books and manuals related to R package development, where topics are covered in greater depth.</p>
</div>
</div>
<div id="where-ices-packages-live" class="section level2">
<h2><span class="header-section-number">1.2</span> Where ICES packages live</h2>
<div id="cran" class="section level3">
<h3><span class="header-section-number">1.2.1</span> CRAN</h3>
<p>CRAN is the official R archive for distributing packages to the global user community. Packages on CRAN are the latest official release, guaranteed to pass integrity tests of code and documentation.</p>
</div>
<div id="github" class="section level3">
<h3><span class="header-section-number">1.2.2</span> GitHub</h3>
<p>GitHub is a code repository, where development versions of packages reside. Several people can have write-access and work together on development and maintenance. ICES provides two GitHub areas for R packages:</p>
<ul>
<li><p>github.com/<strong>ices-tools-prod</strong> contains packages that are operational and maintained by the ICES Secretariat</p></li>
<li><p>github.com/<strong>ices-tools-dev</strong> contains everything else (operational packages maintained by scientists outside the Secretariat, experimental projects, etc.)</p></li>
</ul>
</div>
</div>
<div id="the-icesadvice-package" class="section level2">
<h2><span class="header-section-number">1.3</span> The icesAdvice package</h2>
<div id="on-cran-and-github" class="section level3">
<h3><span class="header-section-number">1.3.1</span> On CRAN and GitHub</h3>
<p>The latest official release of the package is on CRAN:<br />
<a href="https://cran.r-project.org/package=icesAdvice" class="uri">https://cran.r-project.org/package=icesAdvice</a></p>
<p>The development of the package takes place on GitHub:<br />
<a href="https://github.com/ices-tools-prod/icesAdvice" class="uri">https://github.com/ices-tools-prod/icesAdvice</a></p>
<p>Previous releases are available on CRAN and GitHub, including version 1.1-0 that the following commentary is based on:<br />
<a href="https://cran.r-project.org/src/contrib/Archive/icesAdvice/" class="uri">https://cran.r-project.org/src/contrib/Archive/icesAdvice/</a><br />
<a href="https://github.com/ices-tools-prod/icesAdvice/releases" class="uri">https://github.com/ices-tools-prod/icesAdvice/releases</a><br />
<a href="https://github.com/ices-tools-prod/icesAdvice/tree/1.1-0" class="uri">https://github.com/ices-tools-prod/icesAdvice/tree/1.1-0</a></p>
</div>
<div id="roxygen" class="section level3">
<h3><span class="header-section-number">1.3.2</span> Roxygen</h3>
<p>The icesAdvice package is developed using Roxygen. This means that the <code>NAMESPACE</code> and <code>*.Rd</code> documentation files are produced automatically from the main <code>*.R</code> source files.</p>
<p><br><br></p>
</div>
</div>
</div>
<div id="root-files" class="section level1">
<h1><span class="header-section-number">2</span> Root files</h1>
<div id="rbuildignore" class="section level2">
<h2><span class="header-section-number">2.1</span> .Rbuildignore</h2>
<p>List of files that are not a part of the R package itself.</p>
</div>
<div id="travis.yml" class="section level2">
<h2><span class="header-section-number">2.2</span> .travis.yml</h2>
<p>Configuration file that enables automatic Travis build tests.</p>
</div>
<div id="description" class="section level2">
<h2><span class="header-section-number">2.3</span> DESCRIPTION</h2>
<p>The backbone of an R package: version number, authors, required packages, license, etc.</p>
</div>
<div id="namespace" class="section level2">
<h2><span class="header-section-number">2.4</span> NAMESPACE</h2>
<p>List of functions that the package provides for users, as well as functions required from other packages. (This file is automatically generated by Roxygen.)</p>
</div>
<div id="news" class="section level2">
<h2><span class="header-section-number">2.5</span> NEWS</h2>
<p>Version history and user-visible changes in each release.</p>
</div>
<div id="readme.md" class="section level2">
<h2><span class="header-section-number">2.6</span> README.md</h2>
<p>GitHub front page, including Travis and CRAN badges.</p>
<p><br><br></p>
</div>
</div>
<div id="r-files" class="section level1">
<h1><span class="header-section-number">3</span> R files</h1>
<div id="bpa.r" class="section level2">
<h2><span class="header-section-number">3.1</span> Bpa.R</h2>
<p>Source code and documentation for the <code>Bpa</code> function. Note how the Roxygen comments end up in <code>man/Bpa.Rd</code> and <code>NAMESPACE</code>.</p>
</div>
<div id="fpa.r-sigmaci.r-sigmapa.r" class="section level2">
<h2><span class="header-section-number">3.2</span> Fpa.R, sigmaCI.R, sigmaPA.R</h2>
<p>Similar to the <code>Bpa.R</code> file.</p>
</div>
<div id="icesadvice-package.r" class="section level2">
<h2><span class="header-section-number">3.3</span> icesAdvice-package.R</h2>
<p>Package help page: annotated list of functions, where related functions are grouped together. This gives users a much better overview of the package than a dry alphabetical list of functions. To view the package help page, the user simply types <code>?icesAdvice</code> in the R console.</p>
<p>A link to this main page is found in the See Also section of all help pages in the package. References, such as publications and websites, can describe how the package is related to the world outside of R. Note how the Roxygen comments end up in <code>icesAdvice-package.Rd</code>.</p>
<p><br><br></p>
</div>
</div>
<div id="development-guidelines" class="section level1">
<h1><span class="header-section-number">4</span> Development guidelines</h1>
<p>The first two points are important: to build and check, and to document user-visible changes.</p>
<div id="build-and-check" class="section level2">
<h2><span class="header-section-number">4.1</span> Build and check</h2>
<p>When developers make changes to the package, they should check if the package builds without errors or warnings, before committing changes to the central repository. This can be done in the command line by running</p>
<pre><code>R CMD build icesAdvice
R CMD check --as-cran icesAdvice_1.1-0.tar.gz</code></pre>
<p>or inside an R session using the <code>devtools</code> package,</p>
<pre><code>library(devtools)
check()</code></pre>
<p>along with related <code>devtools</code> functions such as <code>document()</code>, <code>install()</code>, and <code>load_all()</code>.</p>
<p>The same test is used by Travis and CRAN to test whether the package is broken.</p>
</div>
<div id="document-user-visible-changes" class="section level2">
<h2><span class="header-section-number">4.2</span> Document user-visible changes</h2>
<p>Whenever user-visible functionality is added/modified, this should be documented in the <code>NEWS</code> file. Keeping track of new functions/arguments/behavior is very useful for package developers and users.</p>
</div>
<div id="version-number" class="section level2">
<h2><span class="header-section-number">4.3</span> Version number</h2>
<p>The tradition for R packages is to use version numbers that consist of three counters, for example 1.2-3. It’s practical to have the three counters indicate the nature of changes between releases:</p>
<ol style="list-style-type: decimal">
<li><p>The first counter (<em>major</em>) is incremented when existing user scripts will not give the same output as before. Breaking backward compatibility with a major release can be inconvenient for users, but is sometimes done to adopt an improved overall design.</p></li>
<li><p>The second counter (<em>minor</em>) means new functions, new arguments, or the like. A minor release suggests that it’s worthwhile for the user to read about the new functionality.</p></li>
<li><p>The third counter (<em>patch</em>) is used for other improvements. A patch release may introduce bug fixes, improved documentation, etc.</p></li>
</ol>
<p>The package version number is mainly referring to formal releases, and does not have to be changed during incremental development. At the time of release, the list of changes in the <code>NEWS</code> file is reviewed to determine the appropriate version number.</p>
</div>
<div id="dependencies" class="section level2">
<h2><span class="header-section-number">4.4</span> Dependencies</h2>
<p>The number of required packages should be kept at an absolute minimum. This will make the package more reliable and easier to maintain. Furthermore, many users will appreciate if the package can be used without installing additional packages.</p>
<p>A key difference between personal R scripts and a general R package is that scripts tend to require many packages, but R packages should ideally require only the core R packages, like <strong>base</strong>, <strong>graphics</strong>, and <strong>stats</strong>.</p>
<p>It is fine for developers to use dependency-intensive tools like <strong>devtools</strong>, <strong>knitr</strong>, <strong>rmarkdown</strong>, and <strong>roxygen2</strong> for developing packages. The end user does not require these tools to install and use the package.</p>
<p>R programmers work in a variety of development environments: Linux/Windows, Emacs/RStudio, etc. When collaborating with others in package development and maintenance, files or pathways that are specific to one development environment should be avoided.</p>
</div>
<div id="adding-a-new-function" class="section level2">
<h2><span class="header-section-number">4.5</span> Adding a new function</h2>
<p>Adding a new function to an existing ICES R package typically involves modifying more than one file:</p>
<ol style="list-style-type: decimal">
<li><p><code>myfunction.R</code> defining and documenting the function.</p></li>
<li><p><code>otherfunctions.R</code> adding cross references (See Also) from other related help pages.</p></li>
<li><p><code>ices*-package.R</code> describing where the function fits logically with the rest of the package.</p></li>
<li><p><code>NEWS</code> adding the function to a news entry, corresponding to a version number and date.</p></li>
<li><p><code>DESCRIPTION</code> updating the version number and date.</p></li>
</ol>
</div>
<div id="help-page-sections" class="section level2">
<h2><span class="header-section-number">4.6</span> Help page sections</h2>
<p>R pages have several sections informing the user how the function can be used.</p>
<p><strong><em>Title</em></strong> is the main heading of an R help page. It should use only a few words, including words from the function name itself, to describe some computation or action. Use title case (most words capitalized).</p>
<p><strong><em>Description</em></strong> should be short, extending the title into a proper sentence or two.</p>
<p><strong><em>Arguments</em></strong> entries start in lowercase and end with a period.</p>
<p><strong><em>Details</em></strong> can be used to elaborate on specific function arguments. This allows for relatively brief entries in the arguments section.</p>
<p><strong><em>Notes</em></strong> can be used for all further commentary.</p>
<p>This division is efficient for the reader skimming through the help page, since the <em>Details</em> section appears right after the arguments, and the <em>Notes</em> section right after the returned value.</p>
</div>
<div id="style" class="section level2">
<h2><span class="header-section-number">4.7</span> Style</h2>
<p>There is no need to enforce some ICES style of R code appearance when it comes to indentation, spaces between characters, maximum length of lines, naming of objects, etc. It is nevertheless helpful to have a consistent style within a given file. The easiest way to achieve this is polite coding:</p>
<ul>
<li><p>When modifying an existing file, follow (exactly) the style found within that file.</p></li>
<li><p>When creating a new file, use a consistent style within that file.</p></li>
</ul>
<p>This means that within a given project (e.g., a package) several styles may coexist, but each file uses a consistent style. Among the common characteristics of good programming styles are that trailing spaces should be avoided, and at the very end of a text file the last character should be a newline.</p>
<p><br><br></p>
</div>
</div>
<div id="release-procedure" class="section level1">
<h1><span class="header-section-number">5</span> Release procedure</h1>
<div id="pre-release" class="section level2">
<h2><span class="header-section-number">5.1</span> Pre-release</h2>
<div id="documentation" class="section level3">
<h3><span class="header-section-number">5.1.1</span> Documentation</h3>
<p>New user-visible functionality should be documented, both in R help pages and as entries in the <code>NEWS</code> file. To get an overview of functionality that has been added since the last release, it may be useful to view the commit log entries:</p>
<pre><code>git log 1.0-0..HEAD</code></pre>
<p>All user functions should have R help pages that cross-reference related pages, and also have an entry in the package help page.</p>
<p>After reviewing the news entries, the date and version number can be finalized in the <code>DESCRIPTION</code> and <code>NEWS</code> files.</p>
</div>
<div id="repository-maintenance" class="section level3">
<h3><span class="header-section-number">5.1.2</span> Repository maintenance</h3>
<p>Once the package has been built and checked, one can merge the most recent changes into the stable branch, for example:</p>
<pre><code>git checkout master
git merge develop</code></pre>
<p>This is also a good time to tag the release:</p>
<pre><code>git tag 1.1-0</code></pre>
</div>
</div>
<div id="submit" class="section level2">
<h2><span class="header-section-number">5.2</span> Submit</h2>
<p>In the case of a CRAN release, the submission form can be found at <a href="https://cran.r-project.org/submit.html" class="uri">https://cran.r-project.org/submit.html</a> along with instructions.</p>
<p>This can also be done inside an R session using the <code>release()</code> function in the <code>devtools</code> package.</p>
</div>
<div id="post-release" class="section level2">
<h2><span class="header-section-number">5.3</span> Post-release</h2>
<p>The TAF package maintenance page (<a href="https://ices-taf-dev.github.io/r.html" class="uri">https://ices-taf-dev.github.io/r.html</a>) provides a compact overview of the release history of many ICES packages (icesAdvice, icesDatras, icesSAG, icesSD, icesTAF, icesVocab).</p>
<p>To update this page, add a line with the following information: version number, date in description file, date of <code>tar.gz</code> file on CRAN, size of <code>tar.gz</code> file on CRAN, GitHub SHA code, and new functions introduced in this release.</p>
<p><br><br></p>
</div>
</div>
<div id="references-1" class="section level1">
<h1><span class="header-section-number">6</span> References</h1>
<div id="writing-r-packages" class="section level2">
<h2><span class="header-section-number">6.1</span> Writing R packages</h2>
<ul>
<li><p>R Core Team. <strong><em>Writing R extensions</em></strong>. Vienna: R Foundation for Statistical Computing. Available at:<br />
<a href="https://cran.r-project.org/doc/manuals/r-release/R-exts.html" class="uri">https://cran.r-project.org/doc/manuals/r-release/R-exts.html</a> and<br />
<a href="https://cran.r-project.org/doc/manuals/r-release/R-exts.pdf" class="uri">https://cran.r-project.org/doc/manuals/r-release/R-exts.pdf</a></p></li>
<li><p>Wickham, H. 2015. <strong><em>R packages</em></strong>. Sebastopol: O’Reilly. Available at:<br />
<a href="http://r-pkgs.had.co.nz" class="uri">http://r-pkgs.had.co.nz</a></p></li>
</ul>
</div>
<div id="development-tools" class="section level2">
<h2><span class="header-section-number">6.2</span> Development tools</h2>
<ul>
<li><p>Chacon, S. and B. Straub. 2014. <strong><em>Pro Git</em></strong>, 2nd ed. New York: Apress. Available at:<br />
<a href="https://git-scm.com/book/en/v2" class="uri">https://git-scm.com/book/en/v2</a></p></li>
<li><p>ESS Developers. <strong><em>Emacs Speaks Statistics</em></strong>. User manual. Available at:<br />
<a href="http://ess.r-project.org/Manual/ess.html" class="uri">http://ess.r-project.org/Manual/ess.html</a> and<br />
<a href="http://ess.r-project.org/ess.pdf" class="uri">http://ess.r-project.org/ess.pdf</a></p></li>
<li><p>RStudio. <strong><em>RStudio cheat sheets: RStudio IDE, devtools, R Markdown</em></strong>. User manuals. Available at:<br />
<a href="https://www.rstudio.com/resources/cheatsheets/" class="uri">https://www.rstudio.com/resources/cheatsheets/</a></p></li>
<li><p>Wickham, H. <strong><em>Introduction to roxygen2</em></strong>. R package vignette. Available at:<br />
<a href="https://cran.r-project.org/web/packages/roxygen2/vignettes/roxygen2.html" class="uri">https://cran.r-project.org/web/packages/roxygen2/vignettes/roxygen2.html</a></p></li>
</ul>
</div>
</div>



<!-- code folding -->



</body>
</html>
