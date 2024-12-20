#!/usr/bin/perl
use strict;

open FILE,"$ARGV[0]";
my %hash;
while(<FILE>){
	chomp;
	my @aa = split;
	my $label = "$aa[-6]"."\t"."$aa[-5]"."\t"."$aa[-4]"."\t"."$aa[-3]"."\t"."$aa[-2]"."\t"."$aa[-1]";
	$hash{$aa[0]} = $label;
}
close FILE;

open FILE,"$ARGV[1]";
my %hash2;
while(<FILE>){
        chomp;
        my @aa = split;
        my $label = "$aa[-6]"."\t"."$aa[-5]"."\t"."$aa[-4]"."\t"."$aa[-3]"."\t"."$aa[-2]"."\t"."$aa[-1]";
        $hash2{$aa[0]} = $label;
}
close FILE;


open FILE,"$ARGV[2]";
while(<FILE>){
	chomp;
	my @aa = split;
	$hash{$aa[0]} = "NA\tNA\tNA\tNA\tNA\tNA" unless(exists $hash{$aa[0]});
	$hash2{$aa[0]} = "NA\tNA\tNA\tNA\tNA\tNA" unless(exists $hash2{$aa[0]});
	print "$_\t$hash{$aa[0]}\t$hash2{$aa[0]}\n";
}
close FILE;
