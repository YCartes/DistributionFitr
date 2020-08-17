How To: Development Setup for Contribution
==========================================

Install Languages
-----------------

-   Install current version of R from
    [CRAN](https://cran.r-project.org/bin/windows/base/).
-   Install current version of [Python
    3](https://www.python.org/downloads/).
-   Install current version of [Git](https://git-scm.com/downloads) and
    clone the Repository from
    [Git](https://github.com/YCartes/DistributionFitr) via `git clone`.

Install Tools
-------------

-   Install current version of
    [Pandoc](https://pandoc.org/installing.html).
-   Set environment variable `RSTUDIO_PANDOC` to the folder where you
    installed pandoc.
-   Install [Poetry](https://python-poetry.org/docs/#installation/) as
    package manager for python.
-   Install `renv` as package manager for R: Run
    `install.packages("renv")` in R.

Setup Environment with Package Manager
--------------------------------------

-   Run the following files in the base of the project directory as
    working directory.
-   Python Environment: Run `poetry install` in Terminal.
-   R Environment: Run `renv::init()`.

Develop
-------

Now you should be able to develop….enjoy it :)

Testing
-------

tbd

    devtools::load_all()

For further details refer to
<a href="http://r-pkgs.had.co.nz/check.html" class="uri">http://r-pkgs.had.co.nz/check.html</a>.

Commit your changes
-------------------

If you changed one of the R-Markdown `.Rmd` files, the new Markdown
\```` .md`` files must be generated. This is done by ```rmarkdown::render(“input.Rmd”,
md\_document(variant = “gfm”))\`\`\` in R.

Make sure you save your current environment to the lock file:

    renv::snapshot()

As you commit `precommit` is running automatically and checking your
code.

tbd