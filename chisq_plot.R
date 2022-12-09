library(ggplot2)
setwd('~/Dropbox (PopGen)/Changyi/00article/EEcourse2022/Genomic_selection/Rmarkdown2/')
FET_result<-readRDS('rds/adapted_chisq_two_timepoints.rds')
for (i in 1:10){
  d1<-subset(FET_result, select = c("pos",paste("r",i,"_adj_p",sep="")))
  colnames(d1)<-c("pos","p")
  p3<-ggplot(d1,
           aes(x=pos, y=-log10(p)))+
  geom_point(cex=0.1)+
  geom_hline(yintercept = -log10(0.05), col="red", linetype=2)+
  labs(title = "2L", x="position", y ="-log10(FDR)")+ylim(0,25)
  tiff(paste("chisq_2time_r",i,".tiff",sep=""),units = "cm", width = 10, height = 10, res=300)
  plot(p3)
  dev.off()
}

FET_time<-readRDS('rds/adapted_chisq_timeseries.rds')
for (i in 1:10){
  d1<-subset(FET_time, select = c("pos",paste("r",i,"_adj_p",sep="")))
  colnames(d1)<-c("pos","p")
  p4<-ggplot(d1,
             aes(x=pos, y=-log10(p)))+
    geom_point(cex=0.1)+
    geom_hline(yintercept = -log10(0.05), col="red", linetype=2)+
    labs(title = "2L", x="position", y ="-log10(FDR)")+ylim(0,25)
  tiff(paste("chisq_timeseries_r",i,".tiff",sep=""),units = "cm", width = 10, height = 10, res=300)
  plot(p4)
  dev.off()
}