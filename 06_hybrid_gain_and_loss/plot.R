library(ggplot2)

par(mfrow=c(8,1))


pdf("plot.pdf",width = 6,height = 4)
aa<-read.table("BM_H3K27ac.for_loop_loss.for_R.fisher.2.for_plot")
ggplot(aa,aes(aa$V3,aa$V2))+geom_jitter(height = 0.1,aes(color=aa$V4),alpha = 1/2,size = 1.3)+
  theme_bw()+theme(
    axis.line = element_line(colour = "black"), axis.text = element_text(color = "black",size = 14),
    legend.text = element_text(size = 14),legend.title=element_text(size=14),
    axis.title.x = element_text(size = 14),axis.title.y = element_text(size = 14))+
  xlab("% of B73 valid read pair in parents per interaction")+ylab("% of B73 valid read pair in F1 per interaction")+scale_color_manual(values = c("red","grey"))+
  ylim(0,1)+xlim(0,1)

aa<-read.table("MB_H3K27ac.for_loop_loss.for_R.fisher.2.for_plot")
ggplot(aa,aes(aa$V3,aa$V2))+geom_jitter(height = 0.1,aes(color=aa$V4),alpha = 1/2,size = 1.3)+
  theme_bw()+theme(
    axis.line = element_line(colour = "black"), axis.text = element_text(color = "black",size = 14),
    legend.text = element_text(size = 14),legend.title=element_text(size=14),
    axis.title.x = element_text(size = 14),axis.title.y = element_text(size = 14))+
  xlab("% of B73 valid read pair in parents per interaction")+ylab("% of B73 valid read pair in F1 per interaction")+scale_color_manual(values = c("red","grey"))+
  ylim(0,1)+xlim(0,1)

aa<-read.table("BM_H3K4me3.for_loop_loss.for_R.fisher.2.for_plot")
ggplot(aa,aes(aa$V3,aa$V2))+geom_jitter(height = 0.1,aes(color=aa$V4),alpha = 1/2,size = 1.3)+
  theme_bw()+theme(
    axis.line = element_line(colour = "black"), axis.text = element_text(color = "black",size = 14),
    legend.text = element_text(size = 14),legend.title=element_text(size=14),
    axis.title.x = element_text(size = 14),axis.title.y = element_text(size = 14))+
  xlab("% of B73 valid read pair in parents per interaction")+ylab("% of B73 valid read pair in F1 per interaction")+scale_color_manual(values = c("red","grey"))+
  ylim(0,1)+xlim(0,1)

aa<-read.table("MB_H3K4me3.for_loop_loss.for_R.fisher.2.for_plot")
ggplot(aa,aes(aa$V3,aa$V2))+geom_jitter(height = 0.05,aes(color=aa$V4),alpha = 1/2,size = 1.3)+
  theme_bw()+theme(
    axis.line = element_line(colour = "black"), axis.text = element_text(color = "black",size = 14),
    legend.text = element_text(size = 14),legend.title=element_text(size=14),
    axis.title.x = element_text(size = 14),axis.title.y = element_text(size = 14))+
  xlab("% of B73 valid read pair in parents per interaction")+ylab("% of B73 valid read pair in F1 per interaction")+scale_color_manual(values = c("red","grey"))+
  ylim(0,1)+xlim(0,1)


aa<-read.table("BM_H3K27ac.for_loop_gain.for_R.fisher.2.for_plot.filter")
ggplot(aa,aes(aa$V3,aa$V2))+geom_jitter(height = 0.2,aes(color=aa$V4),alpha = 1/2,size = 1.3)+
  theme_bw()+theme(
    axis.line = element_line(colour = "black"), axis.text = element_text(color = "black",size = 14),
    legend.text = element_text(size = 14),legend.title=element_text(size=14),
    axis.title.x = element_text(size = 14),axis.title.y = element_text(size = 14))+
  xlab("% of B73 valid read pair in parents per interaction")+ylab("% of B73 valid read pair in F1 per interaction")+scale_color_manual(values = c("red","grey"))+
  ylim(0,1)+xlim(0,1)


aa<-read.table("MB_H3K27ac.for_loop_gain.for_R.fisher.2.for_plot.filter")
ggplot(aa,aes(aa$V3,aa$V2))+geom_jitter(height = 0.2,aes(color=aa$V4),alpha = 1/2,size = 1.3)+
  theme_bw()+theme(
    axis.line = element_line(colour = "black"), axis.text = element_text(color = "black",size = 14),
    legend.text = element_text(size = 14),legend.title=element_text(size=14),
    axis.title.x = element_text(size = 14),axis.title.y = element_text(size = 14))+
  xlab("% of B73 valid read pair in parents per interaction")+ylab("% of B73 valid read pair in F1 per interaction")+scale_color_manual(values = c("red","grey"))+
  ylim(0,1)+xlim(0,1)


aa<-read.table("BM_H3K4me3.for_loop_gain.for_R.fisher.2.for_plot.filter")
ggplot(aa,aes(aa$V3,aa$V2))+geom_jitter(height = 0.2,aes(color=aa$V4),alpha = 1/2,size = 1.3)+
  theme_bw()+theme(
    axis.line = element_line(colour = "black"), axis.text = element_text(color = "black",size = 14),
    legend.text = element_text(size = 14),legend.title=element_text(size=14),
    axis.title.x = element_text(size = 14),axis.title.y = element_text(size = 14))+
  xlab("% of B73 valid read pair in parents per interaction")+ylab("% of B73 valid read pair in F1 per interaction")+scale_color_manual(values = c("red","grey"))+
  ylim(0,1)+xlim(0,1)


aa<-read.table("MB_H3K4me3.for_loop_gain.for_R.fisher.2.for_plot.filter")
ggplot(aa,aes(aa$V3,aa$V2))+geom_jitter(height = 0.2,aes(color=aa$V4),alpha = 1/2,size = 1.3)+
  theme_bw()+theme(
    axis.line = element_line(colour = "black"), axis.text = element_text(color = "black",size = 14),
    legend.text = element_text(size = 14),legend.title=element_text(size=14),
    axis.title.x = element_text(size = 14),axis.title.y = element_text(size = 14))+
  xlab("% of B73 valid read pair in parents per interaction")+ylab("% of B73 valid read pair in F1 per interaction")+scale_color_manual(values = c("red","grey"))+
  ylim(0,1)+xlim(0,1)


dev.off()
