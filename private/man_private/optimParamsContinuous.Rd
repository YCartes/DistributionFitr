\name{optimParamsContinuous}
\alias{optimParamsContinuous}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Fit Optimal Parameters for a Distribution Family, for continuous parameter ranges only
}
\description{
  Given data and a distribution family, this function optimises over the given continuous parameters of the function and returns the best fitted parameters and information criteria.
}
\usage{
optimParamsContinuous(data, family, lower, upper, defaults, method = "MLE",
		      fixed = list(), prior = NULL, log = TRUE,
		      optim_method = "L-BFGS-B", n_starting_points = 1,
		      debug_error = TRUE, show_optim_progress = FALSE,
		      on_error_use_best_result = TRUE, no_second = TRUE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
     vector of data points
  }
  \item{family}{
     list of two elements. family: distribution family callable in the \code{package}, e.g. 'norm'; package: name of the R package, which contains the distribution family.
  }
  \item{fixed}{
     named vector of fixed parameters, which are not taken into account during the optimization process  
  }
  \item{prior}{
     named vector of user guesses for true parameters. Might improve optimisation speed and accuracy - giving priors for only some of the parameters is allowed.
  }
  \item{lower}{
     named vector of lower bounds of free parameters, if no lower bound \code{-Inf} 
  }
  \item{upper}{
     named vector of upper bounds of free parameters, if no upper bound \code{Inf}, names must coincide with \code{lower}
  }
  \item{defaults}{
     named vector of starting parameters for optimisation, names must coincide with \code{lower} and \code{upper}
  }
  \item{method}{
     so far only Maximum-Likelihood is implemented, thus argument must be \code{"MLE"}.
  }
  \item{log}{
     logical; if TRUE (default) optimization is run over log-likelihood, requires log-likelihood as parameter in selected distribution family
  }
  \item{optim_method}{
     character string; specifies which optimisation algorithm R is to use internally. Generally recommended: \code{"L-BFGS-B"} (default). See \code{optim} for details.
  }
  \item{n_starting_points}{
     integer; number of different starting values. Choosing more starting values might be helpful to avoid local but not global maxima.
  }  
  \item{on_error_use_best_result}{
     logical; if TRUE (default) if an error occurs/convergence is not established after the max. number of iterations, the best intermediate result achieved during optimisation process is returned as optimal parameter fit.
  }
  \item{debug_error}{
     logical; if TRUE (default) shows optimization progress in case an error occured during optimization
  }
  \item{show_optim_progress}{
    logical; if TRUE always show the optimisation progress: last two iterations.
  }
  \item{no_second}{
    logical; if TRUE the second run is ommitted. optimParams internally uses two optimisation runs: The first one is coarse and supplies us with intermediate parameters, which are in turn used during the second, more rigorous run.
  }
  \item{timeout}{
    either \code{FALSE}; no timeout \cr
    or positive numeric; seconds until timeout for underlying optimiser \code{\link{optim}}.
  }
  \item{...}{
    other arguments passed down to lower level functions such as \code{optimParamsContinuous} or d[family].
  }
}

\details{
  ** If necessary, more details than the description above **
}
\value{
  For \code{optimParam} a list with components:
  \item{par}{Optimal parameters as named vector, over which it was optimized.}
  \item{value}{(Log-)Likelihood of optimal parameters}
  \item{convergence}{An integer code. 0 indicates sucessful completion. Refer to \code{optim} in \code{stats} for further details}
  \item{AIC}{Akaike Information Criterion of optimal parameters}
  \item{BIC}{Bayes Information Criterion of optimal parameters}
  \item{AICc}{Akaike Information Criterion of optimal parameters, corrected for small sample sizes}
}
\references{
 ~put references to the literature/web site here ~
}
\author{
  Benedikt Geier, Moritz Kern
}
\note{
  **further notes**
}

% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
 \code{\link{optim}}
}
\examples{

\dontrun{
# Example 1 for optimParam
data <- rnorm(n=100, mean=70, sd= 4)
family <- list(family='norm', package="stats")
lower <- c('mean' = - Inf)
upper <- c('mean' = Inf)
fixed <- c('sd'=2)
start_parameters <- c('mean' = 0)
optimParamsContinuous(data = data, family=family, lower=lower, upper=upper, 
defaults = start_parameters, 
fixed=fixed, log = T, show_optim_progress = TRUE)

# Example 2 for optimParam
data <- rbeta(n=100, shape=10, shape2=2)
family <- list(family='beta', package="stats")
lower <- c('shape1' = 0, 'shape2' = 0)
upper <- c('shape1' = Inf, 'shape2' = Inf)
start_parameters <- c('shape1' = 1, 'shape2' = 1)
fixed <- list()
optimParamsContinuous(data =data, family = family, lower = lower, 
upper = upper, defaults = start_parameters, 
log = T, show_optim_progress = TRUE)
}

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{distribution}
