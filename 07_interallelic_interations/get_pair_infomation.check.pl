#!/usr/bin/perl
use strict;

open FILE,"samtools view $ARGV[0] |";
my %hash_all;
my %hash_B73_r1;
while(<FILE>){
        chomp;
        my @aa = split;
	next unless($aa[2] == 10);
        foreach my $aa(@aa){
                if($aa=~/NM/){
			$aa=~s/NM:i://;
                        my $label = "$aa[2]"."\t"."$aa[3]"."\t"."$aa[5]"."\t"."$aa[4]"."\t"."$aa";
			$hash_all{$aa[0]} = 1;
                        $hash_B73_r1{$aa[0]} = $label;
                }
        }
}
close FILE;

my %hash_B73_r2;
open FILE,"samtools view $ARGV[1] |";
while(<FILE>){
        chomp;
        my @aa = split;
	next unless($aa[2] == 10);
        foreach my $aa(@aa){
                if($aa=~/NM/){
                        $aa=~s/NM:i://;
                        my $label = "$aa[2]"."\t"."$aa[3]"."\t"."$aa[5]"."\t"."$aa[4]"."\t"."$aa";
                        $hash_all{$aa[0]} = 1;
                        $hash_B73_r2{$aa[0]} = $label;
                }
        }
}
close FILE;


my %hash_Mo17_r1;
open FILE,"samtools view $ARGV[2] |";
while(<FILE>){
        chomp;
        my @aa = split;
	next unless($aa[2] eq "chr10");
        foreach my $aa(@aa){
                if($aa=~/NM/){
                        $aa=~s/NM:i://;
                        my $label = "$aa[2]"."\t"."$aa[3]"."\t"."$aa[5]"."\t"."$aa[4]"."\t"."$aa";
                        $hash_all{$aa[0]} = 1;
			$hash_Mo17_r1{$aa[0]} = $label;
		}
	}
}
close FILE;


my %hash_Mo17_r2;
open FILE,"samtools view $ARGV[3] |";
while(<FILE>){
        chomp;
        my @aa = split;
	next unless($aa[2] eq "chr10");
        foreach my $aa(@aa){
                if($aa=~/NM/){
                        $aa=~s/NM:i://;
                        my $label = "$aa[2]"."\t"."$aa[3]"."\t"."$aa[5]"."\t"."$aa[4]"."\t"."$aa";
                        $hash_all{$aa[0]} = 1;
                        $hash_Mo17_r2{$aa[0]} = $label;
                }
        }
}
close FILE;


foreach my $aa(keys %hash_all){
	$hash_B73_r1{$aa} = "NA"."\t"."NA"."\t"."NA"."\t"."NA"."\t"."NA" unless(exists $hash_B73_r1{$aa});
	$hash_B73_r2{$aa} = "NA"."\t"."NA"."\t"."NA"."\t"."NA"."\t"."NA" unless(exists $hash_B73_r2{$aa});
	$hash_Mo17_r1{$aa} = "NA"."\t"."NA"."\t"."NA"."\t"."NA"."\t"."NA" unless(exists $hash_Mo17_r1{$aa});
        $hash_Mo17_r2{$aa} = "NA"."\t"."NA"."\t"."NA"."\t"."NA"."\t"."NA" unless(exists $hash_Mo17_r2{$aa});
	print "$aa\t$hash_B73_r1{$aa}\t$hash_B73_r2{$aa}\t$hash_Mo17_r1{$aa}\t$hash_Mo17_r2{$aa}\n";
}
	






