#' DEGSet class
#' 
#' S4 class to store data from differentially expression analysis.
#' It should be compatible with different package and stores the information
#' in a way the methods will work with all of them.
#' 
#' @details
#' For now supporting only [DESeq2::results()] output.
#' Use constructor [degComps()] to create the object.
#' 
#' The list will contain one element for each comparison done.
#' Each element has the following structure:
#' 
#' * DEG table
#' * Optional table with shrunk Fold Change when it has been done.
#' 
#' To access the raw table use `degTable(dgs, "raw")``, to access the 
#' shrunken table use `degTable(dgs, "shrunk")`. 
#' 
#' @rdname DEGSet
#' @author Lorena Pantano
#' @examples
#' library(DESeq2)
#' dds <- makeExampleDESeqDataSet(betaSD = 1)
#' colData(dds)[["treatment"]] <- sample(colData(dds)[["condition"]], 12)
#' design(dds) <-  ~ condition + treatment
#' dds <- DESeq(dds)
#' res <- degComps(dds, combs = c("condition"))
#' deg(res[[1]])
#' deg(res[[1]], tidy = "tibble")
#' @export
DEGResults <- setClass("DEGSet",
                          contains = "list",
                          slots = c(default = "character"))

setValidity("DEGSet", function(object) TRUE)