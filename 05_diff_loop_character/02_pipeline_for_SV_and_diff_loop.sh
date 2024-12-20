# check the SV of the ChIP-seq Peak of specific-loop anchor
bedtools intersect -a /mnt2/maxuxu_tmp/02_hicpro_used_V2/B73-H3K4me3_peaks.B73.narrowPeak -b H3K4me3.B73_specific.anchor.info.bed -wao | perl -e 'while(<>){chomp;@aa=split;next if($aa[-1]<50);print "$aa[0]\t$aa[1]\t$aa[2]\t$aa[3]\t$aa[10]\t$aa[11]\t$aa[12]\t$aa[13]\t$aa[14]\t$aa[15]\n"}' - >H3K4me3.B73_specific.anchor.info.peak

bedtools intersect -a H3K4me3.B73_specific.anchor.info.peak -b all_SV_needed.B73.V2.bed -wao | perl get_peak_cor_SV.pl - >H3K4me3.B73_specific.anchor.info.peak.SV


