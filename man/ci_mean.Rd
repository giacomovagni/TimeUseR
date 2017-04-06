
\name{ci_mean}
\alias{ci_mean}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Compute Confidence Intervals ready to be ggplot plotted
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
ci_mean(x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{Must be a dataframe with at least two variables.}
  \item{normal}{Default is Student Distribution. Normal = T for a Normal Distribution.}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
x = mtcars [,c('mpg', 'disp', 'hp')]
# or even the entire dataset #
x = mtcars

ci_mean(x, normal = F)

# barplot with CI #
library(dplyr)
library(ggplot2)
library(ggthemes)

xyz = ci_mean(x, normal = F)

ggplot(xyz, aes(reorder(variable, desc(mean)), mean, fill = variable)) +
geom_bar(stat = 'identity') + theme_tufte() +
xlab('') +
geom_errorbar(aes(ymin=low, ymax=high), width=.1, colour = 'black') +
geom_rangeframe(show.legend = F) +
geom_text(aes(label = paste(round(mean), 'min', sep = '')), size = 5, colour = 'gray77', vjust = -1, position=position_dodge(width=0.9)) +
scale_fill_calc(guide = F)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
