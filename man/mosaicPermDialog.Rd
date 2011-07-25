\name{mosaicPermDialog}
\alias{mosaicPermDialog}
\alias{mosaicSelectDialog}
\alias{margin.table.structable}
\alias{setMosaicPalette}
\alias{brewer.pal.ext}
\title{Visual interface to create an restructure mosaic and assoc plots
}
\description{
  Apply a function of multiple arguments to each cell of a ragged array, that is to each
  (non-empty) group of values given by a unique combination of the
  levels of certain factors. It is a hybrid of \code{tapply} and \code{mapply}.
}


\usage{
mosaicSelectDialog()

mosaicPermDialog(tablename,allow.collapsing=TRUE, start.active=NULL,
							displayPermCommand=TRUE, extendedOptions=TRUE)

margin.table.structable(x,margin)

setMosaicPalette(palettename,reverse=FALSE)							

brewer.pal.ext(n,name,reverse=FALSE)
}

\arguments{
  \item{tablename}{An object for which a mosaic plot or an assoc plot can be displayed: table or ftable or structable}
  \item{allow.collapsing}{Allows to omit dimensions from the table}
  \item{start.active}{boolean vector controlling active variables (variables to be used in plot)}
  \item{displayPermCommand}{controls if command producing plot is displayed in the dialog window}
  \item{extendedOptions}{allows finer control of result of using the dialog}
  \item{palettename}{name of one of the palettes defined in package \code{RColorBrewer}}
  \item{x}{structable to collapse}
  \item{margin}{dimensions to keep}
  \item{n}{number of colors in the ColorBrewer palette}
  \item{name}{name of ColorBrewer palette}
  \item{reverse}{reverse color order in palette}
}
\value{
\code{mosaicPermDialog} either returns the function call producing the last displayed plot
as string or the command producing the permuted table underlying th plot or the
permuted table itself.

\code{mosaicSelectDialog} does not return usable values. It just 
creates a dialog box to select the object to be plotted as mosaic or assoc plot.


\code{margin.table.structable} collapes a structable to a lower dimensional 
structable bh keeping the indicated dimensions and summing the values over
all dimensions not indicated. For a twodimensional table this would
compute row sums or column sums.

\code{brewer.pal.ext} is a modified version of \code{brewer.pal}
in package \code{RColorBrewer}. It allows palettes
with one or 2 colors (which RColorBrewer does not).
For documentatation see \code{\link{RColorBrewer}}.
}

\seealso{
  the functions \code{link{mosaic}} and
  \code{\link{assoc}}
}

\examples{
\dontrun{
data(Titanic)
myTitanic <- structable(Titanic)
mosaicPermDialog(myTitanic)
}
}


\note{Special thanks go to Richard Heiberger who invested quite some time in testing
uncharted territory and made valuable suggestions for improving this function}

