#!/usr/bin/perl
use strict;

open FILE,"$ARGV[0]";
my %hash;
while(<FILE>){
	chomp;
	my @aa = split;
	$hash{$aa[0]} = 1;
	print "$_\n";
}
close FILE;


#open FILE2,">$ARGV[1].not_overlapped";
my $nu = 0;
open FILE,"$ARGV[1]";
while(<FILE>){
	chomp;
	my @aa = split;
	if(exists $hash{$aa[0]}){
		$nu+=1;
		print "$aa[0]-2\t$aa[1]\t$aa[2]\t$aa[3]\t$aa[4]\t$aa[5]\t$aa[6]\t$aa[7]\t$aa[8]\t$aa[8]\t$aa[9]\t$aa[10]\t$aa[11]\n";
	}else{
		print "$_\n";
#		print FILE2 "$_\n";
	}
}
close FILE;
#print FILE2 "$nu\n";
close FILE2;
