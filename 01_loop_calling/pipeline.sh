# use B73 H3K4me3_rep1 data as sample
HiC-Pro -i /mnt2/maxuxu_tmp/02_hicpro_used_V2/B73_H3K4me3_rep1 -o B73_H3K4me3_rep1_map_to_B73 -c config_test_latest_B73.Ma.txt
HiC-Pro -i /mnt2/maxuxu_tmp/02_hicpro_used_V2/B73_H3K4me3_rep1 -o B73_H3K4me3_rep1_map_to_Mo17 -c config_test_latest_Mo17.txt
perl combine_allValidPairs.pl B73_H3K4me3_rep1.B73.allValidPairs B73_H3K4me3_rep1.Mo17.allValidPairs >B73_H3K4me3_rep1.combined.allValidPairs
sh FitHiChIP_HiCPro.sh -C configfile_BiasCorrection_CoverageBias_B73_H3K4me3_rep1.combined
