# plot for expression level of genes on specific-loop anchor
perl -e 'while(<>){chomp;@aa=split;next if(/s1/);$nu+=1;print "$aa[0]\t$aa[1]\t$aa[2]\tLoop$nu-L\n";print "$aa[3]\t$aa[4]\t$aa[5]\tLoop$nu-R\n"}' H3K4me3.B73_specific.bed >H3K4me3.B73_specific.anchor.bed
bedtools intersect -a H3K4me3.B73_specific.anchor.info.specific_anchor -b B73_and_Mo17_combined_gene.bed -wao >H3K4me3.B73_specific.anchor.bed.gene
perl get_expression.pl H3K4me3.B73_specific.anchor.bed.gene FPKM.B73.combined.rep_combined H3K4me3_B73_specific >expression.for_plot.txtx
R --vanilla --slave <plot.1.R
