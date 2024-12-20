#!/usr/bin/perl
use strict;

my %hash_B73;
my %hash_Mo17;
open FILE,"$ARGV[0]";
while(<FILE>){
	chomp;
	my @aa = split;
	if(/^chr/){
		my $label = "$aa[0]"."\t"."$aa[1]"."\t"."$aa[2]"."\t"."$aa[3]"."\t"."$aa[4]"."\t"."$aa[5]";
		$hash_Mo17{$label} = 1;
	}else{
		my $label = "$aa[0]"."\t"."$aa[1]"."\t"."$aa[2]"."\t"."$aa[3]"."\t"."$aa[4]"."\t"."$aa[5]";
		$hash_B73{$label} = 1;
	}
}
close FILE;


open FILE,"$ARGV[1]";
while(<FILE>){
	chomp;
	my @aa = split;
	my $label1 = "$aa[5]"."\t"."$aa[6]"."\t"."$aa[7]"."\t"."$aa[8]"."\t"."$aa[9]"."\t"."$aa[10]";
	my $label2 = "$aa[11]"."\t"."$aa[12]"."\t"."$aa[13]"."\t"."$aa[14]"."\t"."$aa[15]"."\t"."$aa[16]";
	if(exists $hash_B73{$label1}){
		print "$aa[0]\t$aa[1]\t$aa[2]\t$aa[3]\t$aa[4]\t$label1\n";
	}
	if(exists $hash_Mo17{$label2}){
		print "$aa[0]\t$aa[1]\t$aa[2]\t$aa[3]\t$aa[4]\t$label2\n";
	}
}
close FILE;

		
