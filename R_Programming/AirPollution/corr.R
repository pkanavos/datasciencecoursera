corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations

        allNobs<-complete(directory)

        ids<-allNobs[allNobs$nobs>threshold,"id"]
        files<-sprintf("%s/%03d.csv",directory,ids)

        correlations<-lapply(files,function(x) cor(read.csv(x)[c(2,3)],use="na.or.complete")["sulfate","nitrate"])
		unlist(correlations)
}