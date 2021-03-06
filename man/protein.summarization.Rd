% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/protein.summarization.R
\name{protein.summarization}
\alias{protein.summarization}
\title{Summarizing PSM level quantification to protein level quantification}
\usage{
protein.summarization(data, method = "MedianPolish", normalization = TRUE,
  MBimpute = TRUE, censoredInt = "NA", maxQuantileforCensored = NULL)
}
\arguments{
\item{data}{Name of the output of PDtoMSstatsTMTFormat function or PSM-level quantified data from other tools. It should have columns named Protein, PSM, Mixture, Run, Channel, Condition, BioReplicate, Intensity}

\item{method}{Five different summarization methods to protein-level can be performed : "MedianPolish"(default), "Huber", "LogSum", "Median", "Biweight".}

\item{normalization}{Normalization between MS runs. TRUE(default) needs at least one normalization channel in each MS run, annotated by 'Norm' in Condtion column. It will be performed after protein-level summarization. FALSE will not perform normalization step.}

\item{MBimpute}{only for summaryMethod="TMP" and censoredInt='NA' or '0'. TRUE (default) imputes 'NA' or '0' (depending on censoredInt option) by Accelated failure model. FALSE uses the values assigned by cutoffCensored.}

\item{censoredInt}{Missing values are censored or at random. 'NA' (default) assumes that all 'NA's in 'Intensity' column are censored. '0' uses zero intensities as censored intensity. In this case, NA intensities are missing at random.}

\item{maxQuantileforCensored}{Maximum quantile for deciding censored missing value, for instance, 0.999. Default is Null.}
}
\value{
data.frame with protein-level summarization for each run and channel
}
\description{
Protein-level summarization from PSM level quantification should be performed before testing differentially abundant proteins.
Then, normalization between MS runs using normalization channels will be implemented.
}
\examples{
head(required.input)
str(required.input)
quant.byprotein <- protein.summarization(required.input,
                                         method="MedianPolish",
                                         normalization=TRUE)
head(quant.byprotein)
}
