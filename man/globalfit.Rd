\name{globalfit}
\alias{globalfit}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Detect continuity and fit multiple distributions to given data
}
\description{
  Given a numerical data vector, this function fits multiple distributions 
  with the maximum likelihood method and returns a list of the best 
  fitted parameters and information criteria.
}
\usage{
globalfit(data, continuity = NULL, method = "MLE", progress = TRUE,
  packages = "stats", append_packages = FALSE,
  perform_check = TRUE, cores = NULL, max_dim_discrete, sanity_level=1, ...)
}

%- maybe also 'usage' for other objects documented here.

\arguments{
  \item{data}{
    vector of data points.
  }
  \item{continuity}{
    logical; if \code{TRUE}, data is fitted with continuous distributions.
    If no input is given, the data will be tested for continuity.
  }
  \item{method}{
    method for parameter estimation. So far only Maximum-Likelihood is 
    implemented, thus this argument must
    be \code{"MLE"}.
  }
  \item{progress}{
   logical; if \code{TRUE}, always show progress
  }
  \item{packages}{
    default: \dQuote{stats} \cr
    either a character vector with names of packages; \cr
    or a list such as those returned by \command{getFamilies}\cr
    or \code{NULL}, i.e. all families recognized by the package (recommended)   
  } 
  \item{append_packages}{
   logical; if \code{TRUE} (default) appends packages specified in the 
   equally-named argument above to the standard search list, if \code{FALSE} 
   \code{globalfit} will use only those packages.
  }
  \item{perform_check}{
   logical; if \code{TRUE} (default) obviously bad fits will be filtered out 
   (DistributionFitr generally depends on other packages to supply reasonable 
   distribution functions).
  }
  \item{max_dim_discrete}{
   non-negative integer; as a final step, all distributions with more 
   non-continuous parameters than \code{max_dim_discrete} will not be 
   considered. Manual setting is recommended if calculation speed has to
   be cut down.
  }
  \item{cores}{
   integer; Number of CPU cores to be used in the calculations of best fitted 
   parameters and information criteria
  }
  \item{sanity_level}{
	positive number; default set to 1; the smaller the number, the stricter 
	the check will be executed and more potential distributions will be rejected
  }
  \item{...}{
  Further named arguments that can are passed on to optimParamsDiscrete
  }
}

\details{
  If there is no continuity input given, this function first tests via multiple 
  criteria whether the data is   continuously or discretely distributed. 
  Given that information, the related distributions from \code{getFamilies()} 
  are fitted to the data with the maximum likelihood method and information 
  criteria are calculated. For discrete data that is not in the form of 
  integers only, an appropriate linear transformation is applied to guarantee 
  stable optimization.
}

\value{
  \code{globalfit} returns an object of \code{\link{globalfit-class}}.
}

\author{
  Moritz Lauff, Kiril Dik, Nadine Tampe, Borui Niklas Zhu, 
  Benedikt Geier, Moritz Kern
}

\examples{ %  library(DistributionFitr)  ## bitte lassen 
  # Example 1
  data <- rnorm(n=100, mean=70, sd= 4)
  r <- globalfit(data, packages="stats", append_packages=FALSE) 
  summary(r)
  % bitte entweder eine ordentliche print-Funktion schreiben oder 'str' lassen
  
  # Alternatively, it is possible to input whether the data is
  # continuous or discrete
  \dontrun{
  globalfit(data, continuity = TRUE,
            packages="stats", append_packages=FALSE) 
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{distribution}