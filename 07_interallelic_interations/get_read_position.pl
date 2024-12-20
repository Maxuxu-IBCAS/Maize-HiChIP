#!/usr/bin/perl
use strict;


open FILE,"$ARGV[0]";
my %hash;
while(<FILE>){
	chomp;
	my @aa = split;
	next unless($aa[0]==4);
	$hash{$aa[1]} = "$aa[2]"."\t"."$aa[3]"."\t"."$aa[4]"."\t"."$aa[5]";
}
close FILE;

open FILE,"$ARGV[1]";
while(<FILE>){
	chomp;
	my @aa = split;
	print "$_\t$hash{$aa[0]}\n" if(exists $hash{$aa[0]});
}
close FILE;
	
