% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stats.R
\name{nlStatParams}
\alias{nlStatParams}
\title{Get the parameters of an nlStat}
\usage{
nlStatParams(nlStatName)
}
\arguments{
\item{nlStatName}{the name of the nlStat to process}
}
\value{
named character A vector of parameters
}
\description{
Get the parameters of an nlStat
}
\examples{

Rnightlights:::nlStatParams("sum")

#returns
#...   na.rm = FALSE 
#"..."       "na.rm"

}
