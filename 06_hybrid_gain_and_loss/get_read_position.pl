#!/usr/bin/perl
use strict;


my %hash;
open FILE,"$ARGV[0]";
while(<FILE>){
	chomp;
	my @aa = split;
	my $label = "$aa[1]"."\t"."$aa[2]"."\t"."$aa[3]"."\t"."$aa[5]"."\t"."$aa[6]"."\t"."$aa[7]";
	$hash{$aa[0]} = $label;
}
close FILE;

open FILE,"$ARGV[1]";
my %hash2;

while(<FILE>){
	chomp;
	my @aa = split;
	my $label = "$hash{$aa[0]}"."\t"."$aa[1]"."\t"."$aa[2]";
	$hash2{$label}  = 1;
}
close FILE;

open OUT1,">$ARGV[2].B73-ref";
open OUT2,">$ARGV[2].Mo17-ref";

foreach my $aa(keys %hash2){
	my @temp = split /\t/,$aa;
	my $end = $temp[1]+150;
	if($temp[-2] == 0 and $temp[-1]>0){
		print OUT1 "$temp[0]\t$temp[1]\t$end\tB73\n";
	}elsif($temp[-2] > 0 and $temp[-1] == 0){
		print OUT1 "$temp[0]\t$temp[1]\t$end\tMo17\n";
	}
	
	my $end2 = $temp[4]+150;
	if($temp[-2] == 0 and $temp[-1]>0){
		print OUT2 "$temp[3]\t$temp[4]\t$end2\tB73\n";
	}elsif($temp[-2] > 0 and $temp[-1] == 0){
                print OUT2 "$temp[3]\t$temp[4]\t$end2\tMo17\n";
        }


}
close FILE;
