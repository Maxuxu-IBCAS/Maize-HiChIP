cat B73_H3K27ac_rep1.test.position.can B73_H3K27ac_rep3.test.position.can | perl -e 'while(<>){chomp;@aa=split;$label = "$aa[0]"."\t"."$aa[1]"."\t"."$aa[2]"."\t"."$aa[3]"."\t"."$aa[4]"."\t"."$aa[5]"."\t"."$aa[6]"."\t"."$aa[7]"."\t"."$aa[8]"."\t"."$aa[9]"."\t"."$aa[10]"."\t"."$aa[11]";$hash{$label}+=$aa[-1]}foreach my $aa(keys %hash){print "$aa\t$hash{$aa}\n"}' - >B73_H3K27ac.combined &
cat B73_H3K4me3_rep1.test.position.can B73_H3K4me3_rep2.test.position.can | perl -e 'while(<>){chomp;@aa=split;$label = "$aa[0]"."\t"."$aa[1]"."\t"."$aa[2]"."\t"."$aa[3]"."\t"."$aa[4]"."\t"."$aa[5]"."\t"."$aa[6]"."\t"."$aa[7]"."\t"."$aa[8]"."\t"."$aa[9]"."\t"."$aa[10]"."\t"."$aa[11]";$hash{$label}+=$aa[-1]}foreach my $aa(keys %hash){print "$aa\t$hash{$aa}\n"}' - >B73_H3K4me3.combined &
cat BM_H3K27ac_rep1.test.position.can BM_H3K27ac_rep3.test.position.can | perl -e 'while(<>){chomp;@aa=split;$label = "$aa[0]"."\t"."$aa[1]"."\t"."$aa[2]"."\t"."$aa[3]"."\t"."$aa[4]"."\t"."$aa[5]"."\t"."$aa[6]"."\t"."$aa[7]"."\t"."$aa[8]"."\t"."$aa[9]"."\t"."$aa[10]"."\t"."$aa[11]";$hash{$label}+=$aa[-1]}foreach my $aa(keys %hash){print "$aa\t$hash{$aa}\n"}' - >BM_H3K27ac.combined &
cat BM_H3K4me3_rep1.test.position.can BM_H3K4me3_rep2.test.position.can | perl -e 'while(<>){chomp;@aa=split;$label = "$aa[0]"."\t"."$aa[1]"."\t"."$aa[2]"."\t"."$aa[3]"."\t"."$aa[4]"."\t"."$aa[5]"."\t"."$aa[6]"."\t"."$aa[7]"."\t"."$aa[8]"."\t"."$aa[9]"."\t"."$aa[10]"."\t"."$aa[11]";$hash{$label}+=$aa[-1]}foreach my $aa(keys %hash){print "$aa\t$hash{$aa}\n"}' - >BM_H3K4me3.combined &
cat MB_H3K27ac_rep1.test.position.can MB_H3K27ac_rep2.test.position.can MB_H3K27ac_rep3.test.position.can | perl -e 'while(<>){chomp;@aa=split;$label = "$aa[0]"."\t"."$aa[1]"."\t"."$aa[2]"."\t"."$aa[3]"."\t"."$aa[4]"."\t"."$aa[5]"."\t"."$aa[6]"."\t"."$aa[7]"."\t"."$aa[8]"."\t"."$aa[9]"."\t"."$aa[10]"."\t"."$aa[11]";$hash{$label}+=$aa[-1]}foreach my $aa(keys %hash){print "$aa\t$hash{$aa}\n"}' - >MB_H3K27ac.combined &
cat MB_H3K4me3_rep1.test.position.can MB_H3K4me3_rep2.test.position.can | perl -e 'while(<>){chomp;@aa=split;$label = "$aa[0]"."\t"."$aa[1]"."\t"."$aa[2]"."\t"."$aa[3]"."\t"."$aa[4]"."\t"."$aa[5]"."\t"."$aa[6]"."\t"."$aa[7]"."\t"."$aa[8]"."\t"."$aa[9]"."\t"."$aa[10]"."\t"."$aa[11]";$hash{$label}+=$aa[-1]}foreach my $aa(keys %hash){print "$aa\t$hash{$aa}\n"}' - >MB_H3K4me3.combined &
cat Mo17_H3K27ac_rep1.test.position.can Mo17_H3K27ac_rep3.test.position.can | perl -e 'while(<>){chomp;@aa=split;$label = "$aa[0]"."\t"."$aa[1]"."\t"."$aa[2]"."\t"."$aa[3]"."\t"."$aa[4]"."\t"."$aa[5]"."\t"."$aa[6]"."\t"."$aa[7]"."\t"."$aa[8]"."\t"."$aa[9]"."\t"."$aa[10]"."\t"."$aa[11]";$hash{$label}+=$aa[-1]}foreach my $aa(keys %hash){print "$aa\t$hash{$aa}\n"}' - >Mo17_H3K27ac.combined &
cat Mo17_H3K4me3_rep1.test.position.can Mo17_H3K4me3_rep3.test.position.can | perl -e 'while(<>){chomp;@aa=split;$label = "$aa[0]"."\t"."$aa[1]"."\t"."$aa[2]"."\t"."$aa[3]"."\t"."$aa[4]"."\t"."$aa[5]"."\t"."$aa[6]"."\t"."$aa[7]"."\t"."$aa[8]"."\t"."$aa[9]"."\t"."$aa[10]"."\t"."$aa[11]";$hash{$label}+=$aa[-1]}foreach my $aa(keys %hash){print "$aa\t$hash{$aa}\n"}' - >Mo17_H3K4me3.combined &
