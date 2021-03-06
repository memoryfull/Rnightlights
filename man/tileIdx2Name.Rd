% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tiles.R
\name{tileIdx2Name}
\alias{tileIdx2Name}
\title{Get the name of a tile given its index}
\usage{
tileIdx2Name(tileNum, nlType)
}
\arguments{
\item{tileNum}{index as given by getNlTiles()}

\item{nlType}{the nlType of interest}
}
\value{
Character name of the tile
}
\description{
Get the name of a VIIRS tile as given by getNlTiles() given its index
}
\examples{
Rnightlights:::tileName2Idx("00N060W", "VIIRS.M") #returns 6

}
