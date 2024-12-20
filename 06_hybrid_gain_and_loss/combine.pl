#!/usr/bin/perl
use strict;


my %hash_B;
my %hash_M;
open FILE,"B73_and_Mo17_expression.list";
while(<FILE>){
	chomp;
	my @aa = split;
	my $b = $aa[1]+$aa[2]+$aa[3];
	my $m = $aa[4]+$aa[5]+$aa[6];
	$aa[0]=~s/gene://;
	$hash_B{$aa[0]} = $b;
	$hash_M{$aa[0]} = $m;
}
close FILE;

open FILE,"B73_and_Mo17_expression.Mo17.list";
while(<FILE>){
        chomp;
	my @aa = split;
        my $b = $aa[1]+$aa[2]+$aa[3];
        my $m = $aa[4]+$aa[5]+$aa[6];
        $aa[0]=~s/gene://;
        $hash_B{$aa[0]} = $b;
        $hash_M{$aa[0]} = $m;
}
close FILE;

open FILE,"$ARGV[0]";

while(<FILE>){
	chomp;
	my @aa = split;
	print "$aa[0]\t-\t-\t0\t$hash_B{$aa[0]}\t$hash_M{$aa[0]}\t0\t$aa[1]\t$aa[2]\n";
}
close FILE;	






