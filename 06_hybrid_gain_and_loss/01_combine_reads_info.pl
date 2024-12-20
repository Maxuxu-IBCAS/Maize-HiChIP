#!/usr/bin/perl
use strict;


open FILE,"samtools view -F 0x0040 -f 0x0080 $ARGV[0] |";
my %hash_B73_r1;
my %hash_B73_r2;

while(<FILE>){
        chomp;
        my @aa = split;
        my $nu;
        foreach my $aa(@aa){
                if($aa=~/NM/){
			$aa=~s/NM:i://;
                        $nu=$aa;
                }
        }
        my $label = "$aa[2]"."\t"."$aa[3]"."\t"."$aa[5]"."\t"."$nu";
        $hash_B73_r1{$aa[0]} = $label;
}
close FILE;

open FILE,"samtools view -F 0x0080 -f 0x0040 $ARGV[0] |";
while(<FILE>){
        chomp;
        my @aa = split;
        my $nu;
        foreach my $aa(@aa){
                if($aa=~/NM/){
                        $aa=~s/NM:i://;
                        $nu=$aa;
                }
        }
        my $label = "$aa[2]"."\t"."$aa[3]"."\t"."$aa[5]"."\t"."$nu";
        $hash_B73_r2{$aa[0]} = $label;}
close FILE;




my %hash_Mo17_r1;
my %hash_Mo17_r2;

open FILE,"samtools view -F 0x0040 -f 0x0080 $ARGV[1] |";
while(<FILE>){
        chomp;
        my @aa = split;
        my $nu;
        foreach my $aa(@aa){
                if($aa=~/NM/){
                        $aa=~s/NM:i://;
                        $nu=$aa;
                }
        }
        my $label = "$aa[2]"."\t"."$aa[3]"."\t"."$aa[5]"."\t"."$nu";
        $hash_Mo17_r1{$aa[0]} = $label;
}
close FILE;


open FILE,"samtools view -F 0x0080 -f 0x0040 $ARGV[1] |";
while(<FILE>){
        chomp;
        my @aa = split;
        my $nu;
        foreach my $aa(@aa){
                if($aa=~/NM/){
                        $aa=~s/NM:i://;
                        $nu=$aa;
                }
        }
        my $label = "$aa[2]"."\t"."$aa[3]"."\t"."$aa[5]"."\t"."$nu";
        $hash_Mo17_r2{$aa[0]} = $label;
}
close FILE;


foreach my $aa(keys %hash_B73_r1){
	print "$aa-1\t$hash_B73_r1{$aa}\t$hash_Mo17_r1{$aa}\n" if(exists $hash_Mo17_r1{$aa});
}

foreach my $aa(keys %hash_B73_r2){
        print "$aa-2\t$hash_B73_r2{$aa}\t$hash_Mo17_r2{$aa}\n" if(exists $hash_Mo17_r2{$aa});
}





