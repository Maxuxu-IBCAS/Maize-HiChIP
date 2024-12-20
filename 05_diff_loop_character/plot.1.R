aa<-read.table("C:\\Users\\13070\\Desktop\\expression.for_plot.txtx")

aa$V4<-factor(aa$V4,levels=c("H3K4me3_B73_specific","H3K4me3_Mo17_specific","H3K27ac_B73_specific","H3K27ac_Mo17_specific"))
#aa$V5<-factor(aa$V5,levels = c("Y","N"),labels=c("shared-anchor","specific-anchor"))
ggplot(aa,aes(aa$V3,log2(aa$V2+0.1)))+geom_boxplot(width = 0.5,color = "black",aes(fill = aa$V3))+
  facet_grid(.~aa$V4,scale = "free")+
  theme(panel.grid.minor = element_blank(),
        axis.title=element_text(size=15,family="serif"),
        axis.text.y =element_text(size=12,family="serif"),
        panel.background = element_rect(
          fill = "transparent", color = "white"),
        axis.text.x = element_text(size=12,vjust=1,hjust=1,angle=45,family="serif"),
        plot.margin=unit(c(0.5,0.5,0.2,0.5),"cm"),
        legend.title=element_blank(),legend.text = element_text(family="serif",size = 13),
        legend.position = "bottom",
        strip.text.x = element_text(family="serif",size = 10),
        axis.line=element_line(colour="black"))+ylab("Percentage")+xlab("")+
  scale_fill_manual(values = c("#F8F7E8","#2E7B7F"))
bb<-aa[aa$V4=="H3K4me3_Mo17_specific",]
bb1<-bb[bb$V3=="B73",]
bb2<-bb[bb$V3=="Mo17",]
t.test(log2(bb1[,2]+0.1),log(bb2[,2]+0.1))
