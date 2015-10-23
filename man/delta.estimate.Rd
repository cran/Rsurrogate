\name{delta.estimate}
\alias{delta.estimate}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
Calculates treatment effect
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
This function calculates the treatment effect estimate, the difference in the average outcome in the treatment group minus the control group. The user can also request a variance estimate, estimated using perturbating-resampling, and a 95\% confidence interval. If a confidence interval is requested two versions are provided: a normal approximation based interval and a quantile based interval, both use perturbation-resampling. 
}
\usage{
delta.estimate(yone,yzero, var = FALSE, conf.int = FALSE, weight = NULL, 
weight.perturb = NULL)}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{yone}{
%%     ~~Describe \code{yone} here~~
numeric vector; primary outcome for treated observations.
}
  \item{yzero}{
%%     ~~Describe \code{yzero} here~~
numeric vector; primary outcome for control observations.
}
  \item{var}{
%%     ~~Describe \code{var} here~~
TRUE or FALSE; indicates whether a variance estimate for delta is requested, default is FALSE.
}
  \item{conf.int}{
%%     ~~Describe \code{var} here~~
TRUE or FALSE; indicates whether a 95\% confidence interval for delta is requested, default is FALSE
}
  \item{weight}{
%%     ~~Describe \code{weight} here~~
a n1+n0 by x matrix of weights where n1 = length of yone and n0 = length of yzero, default is null.
}
  \item{weight.perturb}{
%%     ~~Describe \code{weight} here~~
a n1+n0 by x matrix of weights where n1 = length of yone and n0 = length of yzero, default is null.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
Let \eqn{Y^{(A)}} and \eqn{Y^{(B)}} denote the primary outcome under the treatment and primary outcome under the control,respectively. The treatment effect, \eqn{\Delta}, is the expected difference in \eqn{Y^{(A)}} compared to \eqn{Y^{(B)}}, \eqn{ \Delta=E(Y^{(A)}-Y^{(B)}).}   The observed data consist of \eqn{n_A} independent identically distributed (i.i.d) copies of \eqn{(Y^{(A)}, S^{(A)}),} \eqn{\{(Y_{Ai}, S_{Ai}), i=1, \cdots, n_A\},} from the treatment group \eqn{G=A} and \eqn{n_B} i.i.d copies of \eqn{(Y^{(B)}, S^{(B)}),} \eqn{\{(Y_{Bi}, S_{Bi}), i=1, \cdots, n_B\},} from the control group \eqn{G=B.} We estimate \eqn{\Delta} as \deqn{\hat{\Delta}
= n_A^{-1} \sum_{i=1}^{n_A} Y_{Ai}  - n_B^{-1} \sum_{i=1}^{n_B}  Y_{Bi}} where \eqn{Y_{Ai}} is the observed primary outcome for person \eqn{i} in the treated group and \eqn{Y_{Bi}} is the observed primary outcome for person \eqn{i} in the treated group. Randomized treatment assignment is assumed throughout this package.

Variance estimation and confidence interval construction is performed using perturbation-resampling. Specifically, let \eqn{\left \{ V^{(b)} = (V_{A1}^{(b)}, ...V_{An_A}^{(b)}, V_{B1}^{(b)}, ...V_{Bn_B}^{(b)})^T, b=1,....,D \right \}} be \eqn{n \times D} independent copies of a positive random variables \eqn{V} from a known distribution with unit mean and unit variance, such as the standard exponential distribution and \eqn{D=500} is an appropriate choice. Let
\deqn{\hat{\Delta}^{(b)}  = \frac{  \sum_{i=1}^{n_A} V_{Ai}^{(b)} Y_{Ai}}{ \sum_{i=1}^{n_A} V_{Ai}^{(b)}}  - \frac{  \sum_{i=1}^{n_B} V_{Bi}^{(b)} Y_{Bi}}{ \sum_{i=1}^{n_B} V_{Bi}^{(b)}}.}The variance of \eqn{\hat{\Delta}} is obtained as the empirical variance of \eqn{\{\hat{\Delta}^{(b)}, b = 1,...,D\}.} We construct two versions of the \eqn{95\%} confidence interval for \eqn{\hat{\Delta}}: one based on a normal approximation confidence interval using the estimated variance and another taking the 2.5th and 97.5th empirical percentiles of \eqn{\hat{\Delta}^{(b)}}.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
A list is returned:
 \item{delta }{the estimate, \eqn{\hat{\Delta}}, described above }
 \item{var }{the variance estimate of \eqn{\hat{\Delta}}; if var = TRUE or conf.int = TRUE}
 \item{conf.int.normal}{a vector of size 2; the 95\% confidence interval for \eqn{\hat{\Delta}} based on a normal approximation; if conf.int = TRUE}
 \item{conf.int.quantile}{a vector of size 2; the 95\% confidence interval for \eqn{\hat{\Delta}} based on sample quantiles of the perturbed values, described above; if conf.int = TRUE} 
}
\author{
%%  ~~who you are~~
Layla Parast
}
\examples{
data(d_example)
names(d_example)
delta.estimate(yone=d_example$y1, yzero=d_example$y0)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{univar}
