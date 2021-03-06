\name{DRplot}
\alias{DRplot}
\title{
Visualization of DRLs
}
\description{
	Graphical Representation of TF2target_DCL-centered and TF_bridged_DCL-centered networks
}
\usage{
DRplot(DCGs, DCLs, tf2target, expGenes,
	type = c("both", "TF2target_DCL", "TF_bridged_DCL")[1], 
	intgenelist = NULL, 
	vsize=5,asize=0.25,lcex=0.3,ewidth=1,
	figname = c("TF2target_DCL.pdf", "TF_bridged_DCL.pdf"))
}
\arguments{
  \item{DCGs}{ a data frame or matrix for DCGs list. }
  \item{DCLs}{ a data frame or matrix for DCLs list. }
  \item{tf2target}{ a data frame or matrix for TF-to-target interaction pairs. }
  \item{expGenes}{ a list for measured genes by array}
  \item{type}{ a character string to determine which type of DRLs ('TF2target_DCL' or 'TF_bridged_DCL' or 'both') will be plotted; default is 'both'.}
  \item{intgenelist}{a list of gene symbols, which contains only one column to display your interesting genes symbol; default is NULL}
  \item{vsize}{a numeric of node size}
  \item{asize}{a numeric of arrow size}
  \item{lcex}{a numeric of lable size}
  \item{ewidth}{a numeric of edge width}
  \item{figname}{two character strings of graph names.}
}
\details{
  We built a function DRplot to display combined information of DCGs/DCLs and DRGs/DRLs. DRpolt generates two figures which are 1): 
  TF2target_DCL-centered network and 2): TF_bridged_DCL-centered network. In both networks, we rely on different node shapes differentiate 
  TFs and non-TFs (square for TFs, circle for non-TFs), different node colors to categorize genes (pink for DCGs, blue for non-DCGs, gray for 
  TFs which are not tested in expression microarray data), and different edge types to express different relations of gene pairs (solid for 
  DCLs, dashed for non-DCLs; edges with arrow indicate TF-to-target relations).
}
\value{
  One or Two graphs as users' wish have been saved in currently working directory.
  And a list of two components:
  \item{TF2target_DCL}{One kind of DRLs termed TF2target_DCL.}
  \item{TF_bridged_DCL}{Another kind of DRLs termed TF_bridged_DCL.}
}
\author{ Jing Yang, Hui Yu }
\examples{
data(exprs)
## divide exprs into two parts corresponding to condition 1 
## (exprs.1) and condition 2 (exprs.2) respectively
exprs.1<-exprs[1:100,1:16]
exprs.2<-exprs[1:100,17:63]
expGenes<-rownames(exprs)

data(tf2target)
DCp.res<-DCp(exprs.1,exprs.2,link.method = 'qth',cutoff=0.25)
DCe.res<-DCe(exprs.1,exprs.2,link.method = 'qth',cutoff=0.25,nbins=10,p=0.1)
DCsum.res<-DCsum(DCp.res,DCe.res,DCpcutoff=0.25,DCecutoff=0.4)
DRplot.res<-DRplot(DCsum.res$DCGs,DCsum.res$DCLs,
	tf2target,
	expGenes,
	type='TF_bridged_DCL',
	intgenelist=NULL,
	vsize=5,asize=0.25,lcex=0.3,ewidth=1,
	figname=c('TF2target_DCL.pdf','TF_bridged_DCL.pdf'))

## two types of Differentially Regulated Links which were plotted
DRplot.res$TF2target_DCL[1:3,]
DRplot.res$TF_bridged_DCL[1:3,]

## plot sub-network by predefined gene(s)
data(intgenelist)
DRplot.int.res<-DRplot(DCsum.res$DCGs,DCsum.res$DCLs,
	tf2target,
	expGenes,
	type='TF_bridged_DCL',
	intgenelist=intgenelist,
	vsize=5,asize=0.25,lcex=0.3,ewidth=1,
	figname=c('TF2target_DCL_int.pdf','TF_bridged_DCL_int.pdf'))
DRplot.int.res$TF2target_DCL[1:3,]
DRplot.int.res$TF_bridged_DCL[1:3,]

}
\keyword{ visualization }
\keyword{ DRL }
