#detect different loop between B73 and Mo17 based on H3K4me3
Rscript DiffAnalysisHiChIP.r --AllLoopList B73_H3K4me3_rep1.interactions_FitHiC.bed,B73_H3K4me3_rep2.interactions_FitHiC.bed,Mo17_H3K4me3_rep1.interactions_FitHiC.bed,Mo17_H3K4me3_rep2.interactions_FitHiC.bed --ChrSizeFile /mnt2/maxuxu_tmp/02_hicpro_used/test/combined.chromosome_size --FDRThr 0.01 --CovThr 25 --ChIPAlignFileList B73_H3K4me3.combined.bdg,Mo17_H3K4me3.combined.bdg --OutDir ./B73-Mo17-H3K4me3 --CategoryList B73H3K4me3,Mo17H3K4me3 --ReplicaCount 2,2 --ReplicaLabels1 R1,R2 --ReplicaLabels2 R1,R2 --FoldChangeThr 2 --DiffFDRThr 0.05 --bcv 0.4
