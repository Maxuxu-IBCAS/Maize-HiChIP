#!/usr/bin/perl
use strict;

open FILE,"$ARGV[0]";
while(<FILE>){
	chomp;
	my @aa = split;
	my @bb = split /-/,$aa[0];
	my $start1 = $bb[1];
	my $end1 = $bb[1]+5000;
	my $start2 = $bb[2];
	my $end2 = $start2+5000;
	if($aa[-1] eq "unsignificant"){
		print "$bb[0]\t$start1\t$end1\tunexpected\t$aa[0]-L\n";
		print "$bb[0]\t$start2\t$end2\tunexpected\t$aa[0]-R\n";
	}else{
		print "$bb[0]\t$start1\t$end1\texpected\t$aa[0]-L\n";
                print "$bb[0]\t$start2\t$end2\texpected\t$aa[0]-R\n";
	}
}
close FILE;


