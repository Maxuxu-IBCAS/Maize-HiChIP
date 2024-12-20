#!/usr/bin/perl
use strict;


open FILE,"$ARGV[0]";
open FILE2,">$ARGV[0].filter";


while(<FILE>){
	chomp;
	my @aa = split;
	if($aa[-6] eq $aa[-3] or $aa[-6] == $aa[-3]){
		next if($aa[-5] == $aa[-2]);
		print FILE2 "$_\n";
	}
}
close FILE;
close FILE2;

	



