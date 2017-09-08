<!-- <!DOCTYPE html> -->

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="generator" content="pandoc" />

<meta name="viewport" content="width=device-width, initial-scale=1">



<!-- <title>R Package Development at ICES</title> -->






<link href="data:text/css,body%20%7B%0A%20%20background%2Dcolor%3A%20%23fff%3B%0A%20%20margin%3A%201em%20auto%3B%0A%20%20max%2Dwidth%3A%20700px%3B%0A%20%20overflow%3A%20visible%3B%0A%20%20padding%2Dleft%3A%202em%3B%0A%20%20padding%2Dright%3A%202em%3B%0A%20%20font%2Dfamily%3A%20%22Open%20Sans%22%2C%20%22Helvetica%20Neue%22%2C%20Helvetica%2C%20Arial%2C%20sans%2Dserif%3B%0A%20%20font%2Dsize%3A%2014px%3B%0A%20%20line%2Dheight%3A%201%2E35%3B%0A%7D%0A%0A%23header%20%7B%0A%20%20text%2Dalign%3A%20center%3B%0A%7D%0A%0A%23TOC%20%7B%0A%20%20clear%3A%20both%3B%0A%20%20margin%3A%200%200%2010px%2010px%3B%0A%20%20padding%3A%204px%3B%0A%20%20width%3A%20400px%3B%0A%20%20border%3A%201px%20solid%20%23CCCCCC%3B%0A%20%20border%2Dradius%3A%205px%3B%0A%0A%20%20background%2Dcolor%3A%20%23f6f6f6%3B%0A%20%20font%2Dsize%3A%2013px%3B%0A%20%20line%2Dheight%3A%201%2E3%3B%0A%7D%0A%20%20%23TOC%20%2Etoctitle%20%7B%0A%20%20%20%20font%2Dweight%3A%20bold%3B%0A%20%20%20%20font%2Dsize%3A%2015px%3B%0A%20%20%20%20margin%2Dleft%3A%205px%3B%0A%20%20%7D%0A%0A%20%20%23TOC%20ul%20%7B%0A%20%20%20%20padding%2Dleft%3A%2040px%3B%0A%20%20%20%20margin%2Dleft%3A%20%2D1%2E5em%3B%0A%20%20%20%20margin%2Dtop%3A%205px%3B%0A%20%20%20%20margin%2Dbottom%3A%205px%3B%0A%20%20%7D%0A%20%20%23TOC%20ul%20ul%20%7B%0A%20%20%20%20margin%2Dleft%3A%20%2D2em%3B%0A%20%20%7D%0A%20%20%23TOC%20li%20%7B%0A%20%20%20%20line%2Dheight%3A%2016px%3B%0A%20%20%7D%0A%0Atable%20%7B%0A%20%20margin%3A%201em%20auto%3B%0A%20%20border%2Dwidth%3A%201px%3B%0A%20%20border%2Dcolor%3A%20%23DDDDDD%3B%0A%20%20border%2Dstyle%3A%20outset%3B%0A%20%20border%2Dcollapse%3A%20collapse%3B%0A%7D%0Atable%20th%20%7B%0A%20%20border%2Dwidth%3A%202px%3B%0A%20%20padding%3A%205px%3B%0A%20%20border%2Dstyle%3A%20inset%3B%0A%7D%0Atable%20td%20%7B%0A%20%20border%2Dwidth%3A%201px%3B%0A%20%20border%2Dstyle%3A%20inset%3B%0A%20%20line%2Dheight%3A%2018px%3B%0A%20%20padding%3A%205px%205px%3B%0A%7D%0Atable%2C%20table%20th%2C%20table%20td%20%7B%0A%20%20border%2Dleft%2Dstyle%3A%20none%3B%0A%20%20border%2Dright%2Dstyle%3A%20none%3B%0A%7D%0Atable%20thead%2C%20table%20tr%2Eeven%20%7B%0A%20%20background%2Dcolor%3A%20%23f7f7f7%3B%0A%7D%0A%0Ap%20%7B%0A%20%20margin%3A%200%2E5em%200%3B%0A%7D%0A%0Ablockquote%20%7B%0A%20%20background%2Dcolor%3A%20%23f6f6f6%3B%0A%20%20padding%3A%200%2E25em%200%2E75em%3B%0A%7D%0A%0Ahr%20%7B%0A%20%20border%2Dstyle%3A%20solid%3B%0A%20%20border%3A%20none%3B%0A%20%20border%2Dtop%3A%201px%20solid%20%23777%3B%0A%20%20margin%3A%2028px%200%3B%0A%7D%0A%0Adl%20%7B%0A%20%20margin%2Dleft%3A%200%3B%0A%7D%0A%20%20dl%20dd%20%7B%0A%20%20%20%20margin%2Dbottom%3A%2013px%3B%0A%20%20%20%20margin%2Dleft%3A%2013px%3B%0A%20%20%7D%0A%20%20dl%20dt%20%7B%0A%20%20%20%20font%2Dweight%3A%20bold%3B%0A%20%20%7D%0A%0Aul%20%7B%0A%20%20margin%2Dtop%3A%200%3B%0A%7D%0A%20%20ul%20li%20%7B%0A%20%20%20%20list%2Dstyle%3A%20circle%20outside%3B%0A%20%20%7D%0A%20%20ul%20ul%20%7B%0A%20%20%20%20margin%2Dbottom%3A%200%3B%0A%20%20%7D%0A%0Apre%2C%20code%20%7B%0A%20%20background%2Dcolor%3A%20%23f7f7f7%3B%0A%20%20border%2Dradius%3A%203px%3B%0A%20%20color%3A%20%23333%3B%0A%20%20white%2Dspace%3A%20pre%2Dwrap%3B%20%20%20%20%2F%2A%20Wrap%20long%20lines%20%2A%2F%0A%7D%0Apre%20%7B%0A%20%20border%2Dradius%3A%203px%3B%0A%20%20margin%3A%205px%200px%2010px%200px%3B%0A%20%20padding%3A%2010px%3B%0A%7D%0Apre%3Anot%28%5Bclass%5D%29%20%7B%0A%20%20background%2Dcolor%3A%20%23f7f7f7%3B%0A%7D%0A%0Acode%20%7B%0A%20%20font%2Dfamily%3A%20Consolas%2C%20Monaco%2C%20%27Courier%20New%27%2C%20monospace%3B%0A%20%20font%2Dsize%3A%2085%25%3B%0A%7D%0Ap%20%3E%20code%2C%20li%20%3E%20code%20%7B%0A%20%20padding%3A%202px%200px%3B%0A%7D%0A%0Adiv%2Efigure%20%7B%0A%20%20text%2Dalign%3A%20center%3B%0A%7D%0Aimg%20%7B%0A%20%20background%2Dcolor%3A%20%23FFFFFF%3B%0A%20%20padding%3A%202px%3B%0A%20%20border%3A%201px%20solid%20%23DDDDDD%3B%0A%20%20border%2Dradius%3A%203px%3B%0A%20%20border%3A%201px%20solid%20%23CCCCCC%3B%0A%20%20margin%3A%200%205px%3B%0A%7D%0A%0Ah1%20%7B%0A%20%20margin%2Dtop%3A%200%3B%0A%20%20font%2Dsize%3A%2035px%3B%0A%20%20line%2Dheight%3A%2040px%3B%0A%7D%0A%0Ah2%20%7B%0A%20%20border%2Dbottom%3A%204px%20solid%20%23f7f7f7%3B%0A%20%20padding%2Dtop%3A%2010px%3B%0A%20%20padding%2Dbottom%3A%202px%3B%0A%20%20font%2Dsize%3A%20145%25%3B%0A%7D%0A%0Ah3%20%7B%0A%20%20border%2Dbottom%3A%202px%20solid%20%23f7f7f7%3B%0A%20%20padding%2Dtop%3A%2010px%3B%0A%20%20font%2Dsize%3A%20120%25%3B%0A%7D%0A%0Ah4%20%7B%0A%20%20border%2Dbottom%3A%201px%20solid%20%23f7f7f7%3B%0A%20%20margin%2Dleft%3A%208px%3B%0A%20%20font%2Dsize%3A%20105%25%3B%0A%7D%0A%0Ah5%2C%20h6%20%7B%0A%20%20border%2Dbottom%3A%201px%20solid%20%23ccc%3B%0A%20%20font%2Dsize%3A%20105%25%3B%0A%7D%0A%0Aa%20%7B%0A%20%20color%3A%20%230033dd%3B%0A%20%20text%2Ddecoration%3A%20none%3B%0A%7D%0A%20%20a%3Ahover%20%7B%0A%20%20%20%20color%3A%20%236666ff%3B%20%7D%0A%20%20a%3Avisited%20%7B%0A%20%20%20%20color%3A%20%23800080%3B%20%7D%0A%20%20a%3Avisited%3Ahover%20%7B%0A%20%20%20%20color%3A%20%23BB00BB%3B%20%7D%0A%20%20a%5Bhref%5E%3D%22http%3A%22%5D%20%7B%0A%20%20%20%20text%2Ddecoration%3A%20underline%3B%20%7D%0A%20%20a%5Bhref%5E%3D%22https%3A%22%5D%20%7B%0A%20%20%20%20text%2Ddecoration%3A%20underline%3B%20%7D%0A%0A%2F%2A%20Class%20described%20in%20https%3A%2F%2Fbenjeffrey%2Ecom%2Fposts%2Fpandoc%2Dsyntax%2Dhighlighting%2Dcss%0A%20%20%20Colours%20from%20https%3A%2F%2Fgist%2Egithub%2Ecom%2Frobsimmons%2F1172277%20%2A%2F%0A%0Acode%20%3E%20span%2Ekw%20%7B%20color%3A%20%23555%3B%20font%2Dweight%3A%20bold%3B%20%7D%20%2F%2A%20Keyword%20%2A%2F%0Acode%20%3E%20span%2Edt%20%7B%20color%3A%20%23902000%3B%20%7D%20%2F%2A%20DataType%20%2A%2F%0Acode%20%3E%20span%2Edv%20%7B%20color%3A%20%2340a070%3B%20%7D%20%2F%2A%20DecVal%20%28decimal%20values%29%20%2A%2F%0Acode%20%3E%20span%2Ebn%20%7B%20color%3A%20%23d14%3B%20%7D%20%2F%2A%20BaseN%20%2A%2F%0Acode%20%3E%20span%2Efl%20%7B%20color%3A%20%23d14%3B%20%7D%20%2F%2A%20Float%20%2A%2F%0Acode%20%3E%20span%2Ech%20%7B%20color%3A%20%23d14%3B%20%7D%20%2F%2A%20Char%20%2A%2F%0Acode%20%3E%20span%2Est%20%7B%20color%3A%20%23d14%3B%20%7D%20%2F%2A%20String%20%2A%2F%0Acode%20%3E%20span%2Eco%20%7B%20color%3A%20%23888888%3B%20font%2Dstyle%3A%20italic%3B%20%7D%20%2F%2A%20Comment%20%2A%2F%0Acode%20%3E%20span%2Eot%20%7B%20color%3A%20%23007020%3B%20%7D%20%2F%2A%20OtherToken%20%2A%2F%0Acode%20%3E%20span%2Eal%20%7B%20color%3A%20%23ff0000%3B%20font%2Dweight%3A%20bold%3B%20%7D%20%2F%2A%20AlertToken%20%2A%2F%0Acode%20%3E%20span%2Efu%20%7B%20color%3A%20%23900%3B%20font%2Dweight%3A%20bold%3B%20%7D%20%2F%2A%20Function%20calls%20%2A%2F%20%0Acode%20%3E%20span%2Eer%20%7B%20color%3A%20%23a61717%3B%20background%2Dcolor%3A%20%23e3d2d2%3B%20%7D%20%2F%2A%20ErrorTok%20%2A%2F%0A%0A" rel="stylesheet" type="text/css" />

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
<li><a href="#references-1"><span class="toc-section-number">5</span> References</a><ul>
<li><a href="#writing-r-packages"><span class="toc-section-number">5.1</span> Writing R packages</a></li>
<li><a href="#development-tools"><span class="toc-section-number">5.2</span> Development tools</a></li>
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
<p>This document provides a basic overview of how we might organize R package development at ICES. The intended audience is R programmers within the ICES community, who might contribute functions to R packages maintained by ICES.</p>
<p>The overview is organized as a quick walk through the inner structure of the <strong>icesAdvice</strong> package version 1.1-0 (CRAN version from 18 May 2016). Using this minimal example, the essential topics are visited by going through one file at a time.</p>
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
<p>The latest official release of the package is on CRAN:<br /><a href="https://cran.r-project.org/package=icesAdvice">https://cran.r-project.org/package=icesAdvice</a></p>
<p>The development of the package takes place on GitHub:<br /><a href="https://github.com/ices-tools-prod/icesAdvice">https://github.com/ices-tools-prod/icesAdvice</a></p>
<p>Previous releases are available on CRAN and GitHub, including version 1.1-0 that the following commentary is based on:<br /> <a href="https://cran.r-project.org/src/contrib/Archive/icesAdvice/">https://cran.r-project.org/src/contrib/Archive/icesAdvice/</a><br /><a href="https://github.com/ices-tools-prod/icesAdvice/releases">https://github.com/ices-tools-prod/icesAdvice/releases</a></p>
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
<p>Package documentation: annotated list of functions, where related functions are grouped together. This gives users a much better overview of the package than a dry alphabetical list of function.</p>
<p>References, such as publications and websites, can describe how the package is related to the world outside of R. Note how the Roxygen comments end up in <code>icesAdvice-package.Rd</code> and <code>NAMESPACE</code>.</p>
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
<p>The package version number is mainly referring to formal releases, and does not have to be changed during incremental development. At the time of release, the list of changes in the <code>NEWS</code> file are reviewed to determine the appropriate version number.</p>
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
<div id="references-1" class="section level1">
<h1><span class="header-section-number">5</span> References</h1>
<div id="writing-r-packages" class="section level2">
<h2><span class="header-section-number">5.1</span> Writing R packages</h2>
<ul>
<li><p>R Core Team. 2016. <strong><em>Writing R extensions</em></strong>. Vienna: R Foundation for Statistical Computing. Available at:<br /> <a href="https://cran.r-project.org/doc/manuals/r-release/R-exts.html">https://cran.r-project.org/doc/manuals/r-release/R-exts.html</a> and<br /> <a href="https://cran.r-project.org/doc/manuals/r-release/R-exts.pdf">https://cran.r-project.org/doc/manuals/r-release/R-exts.pdf</a></p></li>
<li><p>Wickham, H. 2015. <strong><em>R packages</em></strong>. Sebastopol: O’Reilly. Available at:<br /> <a href="http://r-pkgs.had.co.nz">http://r-pkgs.had.co.nz</a></p></li>
</ul>
</div>
<div id="development-tools" class="section level2">
<h2><span class="header-section-number">5.2</span> Development tools</h2>
<ul>
<li><p>Chacon, S. and B. Straub. 2014. <strong><em>Pro Git</em></strong>, 2nd ed. New York: Apress. Available at:<br /> <a href="https://git-scm.com/book/en/v2">https://git-scm.com/book/en/v2</a></p></li>
<li><p>ESS Developers. 2016. <strong><em>Emacs Speaks Statistics</em></strong>. User manual. Available at:<br /> <a href="http://ess.r-project.org/Manual/ess.html">http://ess.r-project.org/Manual/ess.html</a> and<br /> <a href="http://ess.r-project.org/ess.pdf">http://ess.r-project.org/ess.pdf</a></p></li>
<li><p>RStudio. 2016. <strong><em>RStudio cheat sheets: RStudio IDE, devtools, R Markdown</em></strong>. User manuals. Available at:<br /> <a href="https://www.rstudio.com/resources/cheatsheets/">https://www.rstudio.com/resources/cheatsheets/</a></p></li>
<li><p>Wickham, H. 2015. <strong><em>Introduction to roxygen2</em></strong>. R package vignette. Available at:<br /> <a href="https://cran.r-project.org/web/packages/roxygen2/vignettes/roxygen2.html">https://cran.r-project.org/web/packages/roxygen2/vignettes/roxygen2.html</a></p></li>
</ul>
</div>
</div>




</body>
</html>
