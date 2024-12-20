#!/usr/bin/perl
use strict;

open FILE,"$ARGV[0]";
my %hash;
while(<FILE>){
	chomp;
	my @aa = split;
	next if($aa[-1]==0);
	$hash{$aa[-2]} = 1;
}
close FILE;


open FILE,"$ARGV[1]";
while(<FILE>){
	chomp;
	my @aa = split;
	if(exists $hash{$aa[0]}){
		print "$aa[0]\t$aa[1]\tB73\t$ARGV[2]\n";
		print "$aa[0]\t$aa[4]\tMo17\t$ARGV[2]\n";
	}
}
close FILE;

