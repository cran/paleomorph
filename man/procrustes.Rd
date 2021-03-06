% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/procrustes.R
\name{procrustes}
\alias{procrustes}
\title{Conducts Procrustes superimposition to align 3D shapes with or without scaling to centroid size.}
\usage{
procrustes(A, scale = TRUE, scaleDelta = FALSE, maxiter = 1000,
  tolerance = 1e-05)
}
\arguments{
\item{A}{N x 3 x M matrix where N is the number of landmarks, 3 is the number of dimensions, and M is the number of specimens}

\item{scale}{Logical indicating whether objects should be scaled to unit centroid size}

\item{scaleDelta}{Logical determining whether deltaa should be scaled by the total number of landmarks.}

\item{maxiter}{Maximum number of iterations to attempt}

\item{tolerance}{Difference between two iterations that will cause the search to stop.}
}
\value{
A new (N x 3 x M) array, where each 3d vector has been rotated and translated to minimize distances among specimens, and scaled to unit centroid size if requested.
}
\description{
Conducts Procrustes superimposition to align 3D shapes with or without scaling to centroid size.
Skips any missing values in computation of Procrustes coordinates.
}
\details{
A number of computations are run until the difference between two iterations is less than \code{tolerance}.
  The more specimens and landmarks you have, the less each landmark is allowed to move before this tolerance
  is reached. Setting \code{scaleDelta = TRUE} will make the alignment run faster but have potentially less 
  well aligned results. But the alignment between a large and small array of shapes should be more comparable
  with \code{scaleDelta = TRUE}. However, preliminary tests imply that run time scales linearly with 
  \code{scaleDelta} set to \code{TRUE} or \code{FALSE}.
}
\examples{
# Make an array with 6 specimens and 20 landmarks
A <- array(rep(rnorm(6 * 20, sd = 20), each = 6) + rnorm(20 * 3 * 6 ), 
      dim = c(20, 3, 6))

# Align the data (although it is already largely aligned)
aligned <- procrustes(A)

plotSpecimens(aligned)




}
