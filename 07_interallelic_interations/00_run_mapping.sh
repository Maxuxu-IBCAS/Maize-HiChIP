# detect interallelic interactions
bowtie2 -t -q -N 0 -L 25 -p 4 -x /mnt/maxuxu/data/genome/maize_Mo17/Mo17_CAU1_refseq.bw2 -U BM_H3K27ac_rep1.R1.fastq.gz --un BM_H3K27ac_rep1.R1.fastq.gz.Mo17.unmmapped | samtools view -bS - >BM_H3K27ac_rep1.R1.fastq.gz.Mo17.bam
bowtie2 -t -q -N 0 -L 25 -p 4 -x /mnt/maxuxu/data/genome/maize_v4/B73_V4/Zea_mays.AGPv4.dna.toplevel -U BM_H3K27ac_rep1.R1.fastq.gz --un BM_H3K27ac_rep1.R1.fastq.gz.unmmapped | samtools view -bS - >BM_H3K27ac_rep1.R1.fastq.gz.B73.bam
bowtie2 -t -q -N 0 -L 25 -p 4 -x /mnt/maxuxu/data/genome/maize_v4/B73_V4/Zea_mays.AGPv4.dna.toplevel -U BM_H3K27ac_rep1.R1.fastq.gz.B73.unmmapped.trimmed | samtools view -bS - >BM_H3K27ac_rep1.R1.fastq.gz.B73.unmmapped.trimmed.bam
bowtie2 -t -q -N 0 -L 25 -p 4 -x /mnt/maxuxu/data/genome/maize_Mo17/Mo17_CAU1_refseq.bw2 -U BM_H3K27ac_rep1.R1.fastq.gz.Mo17.unmmapped.trimmed | samtools view -bS - >BM_H3K27ac_rep1.R1.fastq.gz.Mo17.unmmapped.trimmed.bam





