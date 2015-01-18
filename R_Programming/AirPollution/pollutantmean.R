pollutantmean <- function(directory, pollutant, id = 1:332) {
	files<-sprintf("%s/%03d.csv",directory,id)
	frames<-sapply(files,read.csv)
	measurements<-unlist(frames[pollutant,])
	round(mean(measurements,na.rm=TRUE),3)
}