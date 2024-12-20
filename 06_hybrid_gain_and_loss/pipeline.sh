# detect hybrid gain and loss
bedtools bamtobed -i BM_H3K4me3_rep1_R1_Mo17_CAU1_refseq.chr.bw2.bwt2merged.bam >BM_H3K4me3_rep1_R1_Mo17_CAU1_refseq.chr.bw2.bwt2merged.bam.bed

perl filter.pl BM_H3K4me3_rep1_R1_Mo17_CAU1_refseq.chr.bw2.bwt2merged.bam.bed

perl 01_get_read_position.pl BM_H3K27ac_rep1_R1_Zm-B73-REFERENCE-GRAMENE-4.0.bt2.bwt2merged.bam.bed.filter BM_H3K27ac_rep1_R1_Mo17_CAU1_refseq.chr.bw2.bwt2merged.bam.bed.filter BM_H3K27ac_rep1.test >BM_H3K27ac_rep1.pos

perl 02_get_read.pl H3K27ac.specific.bed BM_H3K27ac_rep1.pos >BM_H3K27ac_rep1.for_loop_gain.read

perl 03_get_read_position.pl BM_H3K27ac_rep1.for_loop_loss.read BM_H3K27ac_rep1_R1_Zm-B73-REFERENCE-GRAMENE-4.0.bt2.bwt2merged.bam.bed.filter BM_H3K27ac_rep1_R1_Mo17_CAU1_refseq.chr.bw2.bwt2merged.bam.bed.filter  >BM_H3K27ac_rep1.for_loop_loss.read.position

perl combine_info.pl BM_H3K4me3_rep1.for_loop_gain.read.position BM_H3K4me3_rep2.for_loop_gain.read.position H3K4me3.B73_specific.bed H3K4me3.Mo17_specific.bed >BM_H3K4me3.for_loop_gain.for_R
Rscript DMR_fisher_BH_correction.R  --input BM_H3K4me3.for_loop_gain.for_R --output BM_H3K4me3.for_loop_gain.for_R.fisher

perl combine_info.loop_loss.pl BM_H3K27ac_rep1.for_loop_loss.read.position BM_H3K27ac_rep3.for_loop_loss.read.position H3K27ac.conserved.bed >BM_H3K27ac.for_loop_loss.for_R
Rscript DMR_fisher_BH_correction.R  --input BM_H3K27ac.for_loop_loss.for_R --output BM_H3K27ac.for_loop_loss.for_R.fisher

perl get_results_for_plot.pl BM_H3K4me3.for_loop_loss.for_R.fisher

R --vanilla --slave <plot.R

# gene classification
perl 01_combine_reads_info.pl B73_FRRB202194484-1a_1.R1.clean.fastq.B73.bam.q20.sorted.bam B73_FRRB202194484-1a_1.R1.clean.fastq.Mo17.bam.q20.sorted.bam >B73_FRRB202194484-1a_1.stat
perl 02_extract_read.pl B73_FRRB202194484-1a_1.stat B73_FRRB202194484-1a_1.R1.clean.fastq.B73.bam.q20.sorted.bam B73_FRRB202194484-1a_1.R1.clean.fastq.Mo17.bam.q20.sorted.bam
samtools view -bS B73_FRRB202194484-1a_1-B73.sam | bedtools bamtobed -i - -cigar -tag >B73_FRRB202194484-1a_1-B73.sam.bed
bedtools getfasta -fi /mnt/maxuxu/data/genome/maize_v4_new/Zm-B73-REFERENCE-GRAMENE-4.0.fa -bed B73_FRRB202194484-1a_1-B73.sam.bed-fo B73_FRRB202194484-1a_1-B73.sam.bed.fa -name
perl extract_mismatch_info.pl BM_FRRB202194485-1a_1-B73.sam.bed BM_FRRB202194485-1a_1-B73.sam.bed.fa BM_FRRB202194485-1a_1-B73.fa >BM_FRRB202194485-1a_1-B73.SNP
perl check_read_info_use_SNP.pl B73_FRRB202194484-1a_1-B73.SNP B73_FRRB202194484-1a_1-Mo17.SNP >B73_FRRB202194484-1a_1.SNP_info
perl get_read_position.pl BM_FRRB202194485-1a_1-B73.fa BM_FRRB202194485-1a_1.SNP_info BM_FRRB202194485-1a_1_read_info
cat BM_FRRB202194485-1a_1_read_info.B73-ref BM_FRRB202194485-1a_1_read_info.Mo17-ref | bedtools intersect -a B73_and_Mo17_combined_gene.bed -b- -wao >BM_FRRB202194485-1a_1.overlap_with_gene
cat BM_FRRB202194485*gene | perl get_gene_read_number.pl - >BM_read_count.txt
perl combine.pl BM_read_count.txt >BM_read_count.for_fisher_test
perl combine.pl MB_read_count.txt >MB_read_count.for_fisher_test

perl classification.pl BM_single_rep.results.xls BM_read_count.for_fisher_test.results >BM.classification
perl classification.pl MB_single_rep.results.xls MB_read_count.for_fisher_test.results >MB.classification

perl classification.2.pl MB.classification >MB.classification.2
perl classification.2.pl BM.classification >BM.classification.2



# exprssion of hybrid gain and loss
perl get_anchor_position.pl BM_H3K27ac.for_loop_gain.for_R.fisher.2.for_plot.filter >BM_H3K27ac.for_loop_gain.position

bedtools intersect -a BM_H3K27ac.for_loop_gain.position -b B73_and_Mo17_combined_gene.bed -wao >BM_H3K27ac.for_loop_gain.position.overlap_with_gene

perl 03_get_gene_information.pl MB_H3K4me3.for_loop_gain.position.overlap_with_gene >MB_H3K4me3.loop_gain.gene_list

perl get_allele_specific_loop.pl BM.classification.2 BM_H3K27ac.loop_gain.gene_list >BM_H3K27ac.loop_gain.gene_list.class
