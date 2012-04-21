\name{mlapply}
\alias{mlapply}
\title{Apply a Function of Multiple Arguments 
}
\description{
  \code{mlapply} returns a list of the same length as each of the lists in \code{lol}.
  Each element of the resulting list is the result of applying \code{FUN}
  to all the first elements of the lists in lol, all the second elements
  of the lists in lol ...\cr
  It is the multivariate version of \code{lapply}
}


\usage{
mlapply(lol,FUN,...)
}
\arguments{
  \item{lol}{a list of lists, the elements of each list will be used as arguments to calls to \code{FUN}}
  \item{FUN}{the function to be applied.  In the case of
    functions like \code{+}, \code{\%*\%}, etc., the function name must
    be backquoted or quoted.}  
  \item{...}{Any additional arguments passed to each call to \code{FUN}} 	
}
\value{
   \code{FUN} is a function with the number of arguments being equal
   to the number of lists contained in \code{lol}.\cr
   \code{mlapply} makes a function call to \code{FUN} for all
   the first elements of all the lists in \code{lol},
   then a function call to all the second elements of all the lists in \code{lol},
   and returns all the results as a list.\cr
   If the first list in \code{lol} has named elements,
   the names will also be used for the elements of the resulting list.
}
\seealso{
  \code{\link{lapply}}
}

\examples{
mlapply(list(list(1,2,3),list(4,5,6)),function(x,y)x^2+y^2)
mlapply(list(list(a=1,b=2,c=3),list(4,5,6)),function(x,y)x^2+y^2)
mlapply(list(list(a=1,b=2,c=3),list(4,5,6)),function(x,y,e)x^e+y^e,3)
mlapply(list(list(1,2,3),list(4,5,6)),function(x,y,const=0)x^2+y^2+const)
}
