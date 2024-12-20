#mapping and loop calling
bowtie2 -t -q -N 0 -L 25 -X 1000 -p 8 -x /mnt/maxuxu/data/genome/maize_v4_new/Zm-B73-REFERENCE-GRAMENE-4.0.bt2 -1 B73_H3K4me3_rep1.R1.gz.clean.fastq -2 B73_H3K4me3_rep1.R2.gz.clean.fastq | samtools view -bS - >B73_H3K4me3_rep1.R1.gz.clean.fastq.bam
bowtie2 -t -q -N 0 -L 25 -X 1000 -p 8 -x /mnt/maxuxu/data/genome/maize_Mo17/Mo17_CAU1_refseq.chr.bw2 -1 B73_H3K4me3_rep1.R1.gz.clean.fastq -2 B73_H3K4me3_rep1.R2.gz.clean.fastq | samtools view -bS - >B73_H3K4me3_rep1.R1.gz.clean.fastq.Mo17.bam
samtools view -q 20 -b B73_H3K4me3_rep1.R1.gz.clean.fastq.bam | samtools sort -o B73_H3K4me3_rep1.R1.gz.clean.fastq.bam.q20.sorted.bam -
samtools view -q 20 -b B73_H3K4me3_rep1.R1.gz.clean.fastq.Mo17.bam | samtools sort -o B73_H3K4me3_rep1.R1.gz.clean.fastq.Mo17.bam.q20.sorted.bam -
macs2 callpeak -t B73_H3K4me3_rep1.R1.gz.clean.fastq.bam.q20.sorted.bam -n B73_H3K4me3_rep1 --shift -100 --extsize 200 --nomodel -B --SPMR -g 1700000000 --outdir B73_H3K4me3_rep1 --tempdir ./
macs2 callpeak -t B73_H3K4me3_rep1.R1.gz.clean.fastq.Mo17.bam.q20.sorted.bam -n B73_H3K4me3_rep1.Mo17 --shift -100 --extsize 200 --nomodel -B --SPMR -g 1700000000 --outdir B73_H3K4me3_rep1.Mo17 --tempdir ./

# IDR calcultion
idr --sample B73_H3K4me3_rep1/B73_H3K4me3_rep1_peaks.narrowPeak.sorted.narrowPeak B73_H3K4me3_rep2/B73_H3K4me3_rep2_peaks.narrowPeak.sorted.narrowPeak --output-file B73_H3K4me3_rep1/idr_output.txt --plot --log-output-file B73_H3K4me3_rep1/sample.idr.log
