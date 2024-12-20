#mapping and calculating expression level
hisat2 -p 4 --dta -x /mnt/maxuxu/data/genome/maize_v4_new/Zm-B73-REFERENCE-GRAMENE-4.0.fa.hisat2 -1 B73_FRRB202194484-1a_1.R1.clean.fastq -2 B73_FRRB202194484-1a_1.R2.clean.fastq | samtools view -bS - >B73_FRRB202194484-1a_1.R1.clean.fastq.B73.bam
hisat2 -p 4 --dta -x /mnt/maxuxu/data/genome/maize_Mo17/Mo17_CAU1_refseq.fasta.hisat2 -1 B73_FRRB202194484-1a_1.R1.clean.fastq -2 B73_FRRB202194484-1a_1.R2.clean.fastq | samtools view -bS - >B73_FRRB202194484-1a_1.R1.clean.fastq.Mo17.bam

samtools view -q 20 -b B73_FRRB202194484-1a_1.R1.clean.fastq.B73.bam | samtools sort -o B73_FRRB202194484-1a_1.R1.clean.fastq.B73.bam.q20.sorted.bam -
samtools view -q 20 -b B73_FRRB202194484-1a_1.R1.clean.fastq.Mo17.bam | samtools sort -o B73_FRRB202194484-1a_1.R1.clean.fastq.Mo17.bam.q20.sorted.bam -

stringtie -e -B -G /mnt/maxuxu/data/genome/maize_v4_new/Zm-B73-REFERENCE-GRAMENE-4.0_Zm00001d.2.gff3 -A B73_FRRB202194484-1a_1.B73/B73_FRRB202194484-1a_1.tab -o B73_FRRB202194484-1a_1.B73/B73_FRRB202194484-1a_1.gtf -l B73_FRRB202194484-1a_1 B73_FRRB202194484-1a_1.R1.clean.fastq.B73.bam.q20.sorted.bam
stringtie -e -B -G /mnt/maxuxu/data/genome/maize_Mo17/Mo17_CAU1_refseq_gene.gff3 -A B73_FRRB202194484-1a_1.Mo17/B73_FRRB202194484-1a_1.tab -o B73_FRRB202194484-1a_1.Mo17/B73_FRRB202194484-1a_1.gtf -l B73_FRRB202194484-1a_1 B73_FRRB202194484-1a_1.R1.clean.fastq.Mo17.bam.q20.sorted.bam


