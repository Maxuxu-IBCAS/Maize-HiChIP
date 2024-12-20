#!/usr/bin/perl
use strict;

open FILE,"$ARGV[0]";
open FILE2,">$ARGV[0].2.for_plot";
while(<FILE>){
	chomp;
	my @aa = split;
	next if($aa[4] ==0 and $aa[5] == 0);
	my $B73 = $aa[4]/($aa[4]+$aa[5]);
	my $B73_2 = $aa[7]/($aa[7]+$aa[8]);
	my $cha = abs($B73-$B73_2);
	next if(/stt/);
	if($aa[-1]<0.05 and $cha>0.3){
	#	print FILE2 "$aa[0]-$aa[1]-$aa[2]\t$B73\t$B73_2\tsignificant\n";
	}else{
		print FILE2 "$aa[0]-$aa[1]-$aa[2]\t$B73\t$B73_2\tunsignificant\n";
	}
}
close FILE;


open FILE,"$ARGV[0]";
while(<FILE>){
        chomp;
        my @aa = split;
        next if($aa[4] ==0 and $aa[5] == 0);
        my $B73 = $aa[4]/($aa[4]+$aa[5]);
        my $B73_2 = $aa[7]/($aa[7]+$aa[8]);
        my $cha = abs($B73-$B73_2);
        next if(/stt/);
        if($aa[-1]<0.05 and $cha>0.3){
		print FILE2 "$aa[0]-$aa[1]-$aa[2]\t$B73\t$B73_2\tsignificant\n";
	}
}

close FILE;

close FILE2;
		
