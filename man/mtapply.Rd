\name{mtapply}
\alias{mtapply}
\title{Apply a Function of Multiple Arguments Over a Ragged Array
}
\description{
  Apply a function of multiple arguments to cells of a identically structures ragged arrays, that is to each set
  of (non-empty) groups of values given by a unique combination of the
  levels of certain factors. It is a hybrid of \code{tapply} and \code{mapply}.
}


\usage{
mtapply(X, INDEX, FUN = NULL, simplify = TRUE)
}
\arguments{
  \item{X}{a list of atomic objects, typically vectors, all of the same length}
  \item{INDEX}{list of factors, each of same length as \code{X}.  The
    elements are coerced to factors by \code{\link{as.factor}}.}
  \item{FUN}{the function to be applied, or \code{NULL}.  In the case of
    functions like \code{+}, \code{\%*\%}, etc., the function name must
    be backquoted or quoted.  If \code{FUN} is \code{NULL}, tapply
    returns a vector which can be used to subscript the multi-way array
    \code{mtapply} normally produces.}
  \item{simplify}{If \code{FALSE}, \code{tapply} always returns an array
    of mode \code{"list"}.  If \code{TRUE} (the default), then if
    \code{FUN} always returns a scalar, \code{tapply} returns an array
    with the mode of the scalar.}
}
\value{
  If \code{FUN} is not \code{NULL}, it is passed to
  \code{\link{match.fun}}, and hence it can be a function or a symbol or
  character string naming a function.
  
  When \code{FUN} is present, \code{mtapply} calls \code{FUN} for each
  set of cells that has any data in it.  If \code{FUN} returns a single atomic
  value for each such cell (e.g., functions \code{mean} or \code{var})
  and when \code{simplify} is \code{TRUE}, \code{tapply} returns a
  multi-way \link{array} containing the values, and \code{NA} for the
  empty cells.  The array has the same number of dimensions as
  \code{INDEX} has components; the number of levels in a dimension is
  the number of levels (\code{nlevels()}) in the corresponding component
  of \code{INDEX}.  Note that if the return value has a class (e.g. an
  object of class \code{"\link{Date}"}) the class is discarded.

  If \code{FUN} does not return a single atomic value, \code{tapply}
  returns an array of mode \code{\link{list}} whose components are the
  values of the individual calls to \code{FUN}, i.e., the result is a
  list with a \code{\link{dim}} attribute.

  When there is an array answer, its \code{\link{dimnames}} are named by
  the names of \code{INDEX} and are based on the levels of the grouping
  factors (possibly after coercion).

  For a list result, the elements corresponding to empty cells are
  \code{NULL}.
}
\references{
  Becker, R. A., Chambers, J. M. and Wilks, A. R. (1988)
  \emph{The New S Language}.
  Wadsworth & Brooks/Cole.
}
\seealso{
  the functions \code{\link{tapply}},
  \code{\link{mapply}},
  \code{\link{by}} and
  \code{\link{aggregate}} (using \code{tapply});
  \code{\link{apply}},
  \code{\link{lapply}} with its versions
  \code{\link{sapply}} and \code{\link{mapply}}.
}

\examples{
require(Hmisc)
x<-1:10
fc<-rep(c("a","b"),each=5)
wt<-1:10
mtapply(list(x,wt),fc,wtd.mean)
mtapply(list(x,rep(1/10,10)),fc,wtd.mean)
}
