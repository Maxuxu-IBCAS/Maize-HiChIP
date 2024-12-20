#!/usr/bin/perl
use strict;

my %hash_B73;
my %hash_Mo17;

open FILE,"$ARGV[0]";
while(<FILE>){
	chomp;
	my @aa = split;
	if($aa[5]=~/chr/){
		$hash_Mo17{$aa[0]} = "$aa[1]"."\t"."$aa[2]"."\t"."$aa[3]"."\t"."$aa[4]";
	}
	if($aa[5]=~/Chr/){
		$hash_B73{$aa[0]} = "$aa[1]"."\t"."$aa[2]"."\t"."$aa[3]"."\t"."$aa[4]";
	}
}
close FILE;

open FILE,"$ARGV[1]";
while(<FILE>){
	chomp;
	my @aa = split;
	print "$_\t$hash_B73{$aa[0]}\n" if(exists $hash_B73{$aa[0]});
}
close FILE;

open FILE,"$ARGV[2]";
while(<FILE>){
        chomp;
        my @aa = split;
        print "$_\t$hash_Mo17{$aa[0]}\n" if(exists $hash_Mo17{$aa[0]});
}
close FILE;



