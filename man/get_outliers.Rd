% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_outliers.R
\name{get_outliers}
\alias{get_outliers}
\title{Identify temperature-precipitation outliers}
\usage{
get_outliers(tp, validate = TRUE)
}
\arguments{
\item{tp}{A two column \code{matrix}, \code{data.frame} or \code{data.table} object.
First column must refer to mean annual temperatures in Celsius degrees.
Second column must refer to annual precipitations in cm.
This two-column table represents all temperature-precipitation pairs (rows)
to be tested if they fall inside or outside of the Whittaker biome polygons.}

\item{validate}{Should the input be validated?
Variable containing a single logical constant (\code{TRUE} or \code{FALSE}).
Default is \code{TRUE}, meaning that some input checking is carried out by default.
For example, it checks if \code{tp} variable contains exactly a two column
\code{matrix}, \code{data.frame} or \code{data.table} object, if its columns are of
\code{numeric} type and if the values are within certain ranges
(e.g. temperature must be within -55 and 40 Celsius degrees
and precipitation must not be above 1200 cm).
See \strong{Details} section for additional information.}
}
\value{
Returns a \code{data.table} with tree columns:
\tabular{rlllllr}{
\tab \strong{Column} \tab   \tab \strong{Type}    \tab   \tab \strong{Description} \cr
[, 1] \tab row_idx    \tab , \tab \emph{integer}   \tab : \tab Outlier row index\cr
[, 2] \tab temp       \tab , \tab \emph{numeric}   \tab : \tab Outlier mean annual temperature (Celsius degrees)\cr
[, 3] \tab pp_cm      \tab , \tab \emph{numeric}   \tab : \tab Outlier annual precipitation (cm)
}
The indices in \code{row_idx} connect to the row indices in \code{tp} table.
}
\description{
Identifies temperature-precipitation pairs (points)
that are outside of the Whittaker biome polygons.
}
\details{
Usually, for getting temperature-precipitation values one would most probably
have pairs of spatial coordinates. These coordinates would be used for raster
extraction (see \code{raster::extract()}).

The ranges used for input validation are slightly wider that those encountered in the
(\href{http://chelsa-climate.org/}{CHELSA v 1.2} BIO1 & BIO12 raster datasets.
The following can throw an error
(also possible reasons are given in the error messages):
\itemize{
\item Temperatures were switched with precipitations
(temperature must be the first column);
\item Temperature values were extracted from a raster that stores values as integers
(for saving space, raster datasets could store data as integer type
instead of full floating point accuracy; usually division by 10 solves the issue);
\item Precipitations are in mm and not cm (divide by 10 to get cm);
\item The given values are simply not temperature nor precipitation values.
Perhaps other raster datasets were accidently used for point extraction.
}

We consider useful and informative to include input validation.
There is always the option to turn the validation off by setting the argument \code{validate = FALSE}.
}
\author{
Valentin Stefan
}
