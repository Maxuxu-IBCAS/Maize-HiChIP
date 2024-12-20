library(devtools)
install_github("rr1859/R.4Cker")
library(R.4Cker)
enz_file=read.table("/mnt/maxuxu/data/genome/maize_v4_new/oligoMatch/B73_dpnii.flanking_sites.130_unique_2.bed", stringsAsFactors = FALSE)
#my_obj = createR4CkerObjectFromFiles(files = c("BM1-4_L2_A041.R1.fastq.B73.q20.bedGraph","BM30-211028_L4_A038.R1.fastq.B73.q20.bedGraph"),bait_chr="Chr6",bait_coord= 2917401,bait_name = "Igh",primary_enz = "GATC",samples = c("Igh_H_1", "Igh_H_2"),conditions = "Igh",replicates = 2,species = "maize",output_dir = "/mnt2/maxuxu/data/minor/08_liuhan_4c-seq_interallelic/BM_B73",enz_file=enz_file)
#nb_results=nearBaitAnalysis(my_obj,k=5)


my_obj = createR4CkerObjectFromFiles(files = c("MB1-4-211217_L2_A039.R1.fastq.B73.q20.bedGraph","MB2-4-211217_L2_A042.R1.fastq.B73.q20.bedGraph"),bait_chr="Chr6",bait_coord= 2917401,bait_name = "Igh",primary_enz = "GATC",samples = c("Igh_H_1", "Igh_H_2"),conditions = "Igh",replicates = 2,species = "maize",output_dir = "/mnt2/maxuxu/data/minor/08_liuhan_4c-seq_interallelic/MB_B73",enz_file=enz_file)
nb_results=nearBaitAnalysis(my_obj,k=5)
