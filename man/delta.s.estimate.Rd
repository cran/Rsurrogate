\name{delta.s.estimate}
\alias{delta.s.estimate}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
Calculates model-based or robust residual treatment effect

}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
This function calculates the model-based or robust estimate of the residual treatment effect i.e. the hypothetical treatment effect if the distribution of the surrogate in the treatment group looks like the distribution of the surrogate in the control group. Ideally this function is only used as a helper function and is not directly called. 

}
\usage{
delta.s.estimate(sone, szero, yone, yzero, weight.perturb = NULL, number, type)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{sone}{
%%     ~~Describe \code{yone} here~~
numeric vector or matrix; surrogate marker for treated observations, assumed to be continuous. If there are multiple surrogates then this should be a matrix with n (number of treated observations) rows and n.s (number of surrogate markers) columns.
}
  \item{szero}{
%%     ~~Describe \code{yzero} here~~
numeric vector or matrix; surrogate marker for control observations, assumed to be continuous. If there are multiple surrogates then this should be a matrix with n (number of control observations) rows and n.s (number of surrogate markers) columns. 
}
  \item{yone}{
%%     ~~Describe \code{yone} here~~
numeric vector; primary outcome for treated observations.
}
  \item{yzero}{
%%     ~~Describe \code{yzero} here~~
numeric vector; primary outcome for control observations.
}
  \item{weight.perturb}{
%%     ~~Describe \code{weight} here~~
a n1+n0 by x matrix of weights where n1 = length of yone and n0 = length of yzero; generally used for variance estimation and confidence interval construction, default is null.
}
  \item{number}{
%%     ~~Describe \code{number} here~~
specifies the number of surrogate markers; choices are "multiple" or "single", default is "single" 
}
  \item{type}{
%%     ~~Describe \code{type} here~~
specifies the type of estimation; choices are "robust" or "model", default is "robust"
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
Details are included in the documentation for R.s.estimate

}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
\eqn{\hat{\Delta}_S}, the model-based or robust residual treatment effect estimate

}
\note{If the treatment effect is not significant, the user will receive the following message: "Warning: it looks like the treatment effect is not significant; may be difficult to interpret the residual treatment effect in this setting". If the treatment effect is negative, the user will receive the following message: "Warning: it looks like you need to switch the treatment groups". In the single marker case with the robust estimation approach, if the observed support of the surrogate marker for the control group is outside the observed support of the surrogate marker for the treatment group, the user will receive the following message: "Warning: observed supports to not appear equal, may need to consider a transformation or extrapolation"}

\references{
%% ~put references to the literature/web site here ~
Parast, L., McDermott, M., Tian, L. (2015). Robust estimation of the proportion of treatment effect explained by surrogate marker information. Statistics in medicine, to appear.

Wang, Y., & Taylor, J. M. (2002). A measure of the proportion of treatment effect explained by a surrogate marker. Biometrics, 58(4), 803-812.
}
\author{
%%  ~~who you are~~
Layla Parast
}
\examples{
data(d_example)
names(d_example)
delta.s.estimate(yone=d_example$y1, yzero=d_example$y0, sone=d_example$s1.a, szero=
d_example$s0.a, number = "single", type = "robust")
delta.s.estimate(yone=d_example$y1, yzero=d_example$y0, sone=d_example$s1.a, szero=
d_example$s0.a, number = "single", type = "model")
delta.s.estimate(yone=d_example$y1, yzero=d_example$y0, sone=cbind(d_example$s1.a, 
d_example$s1.b, d_example$s1.c), szero=cbind(d_example$s0.a, d_example$s0.b, d_example$s0.c), 
number = "multiple", type = "robust")
delta.s.estimate(yone=d_example$y1, yzero=d_example$y0, sone=cbind(d_example$s1.a, 
d_example$s1.b, d_example$s1.c), szero=cbind(d_example$s0.a, d_example$s0.b, d_example$s0.c),
number = "multiple", type = "model")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{regression}
\keyword{models}
\keyword{smooth}
\keyword{robust}
\keyword{nonparametric}

