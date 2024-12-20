#!/usr/bin/perl
use strict;


my %hash;


open FILE,"$ARGV[0]";
while(<FILE>){
        chomp;
	$_=~s/\"//g;
        my @aa = split;
	$hash{$aa[0]} = $aa[-1];
}
close FILE;

open FILE,"$ARGV[1]";
my %hash_temp;
while(<FILE>){
	chomp;
	my @aa = split;
	$hash_temp{$aa[1]}+=1;
}
close FILE;

open FILE,"$ARGV[1]";
while(<FILE>){
        chomp;
        my @aa = split;
	next unless(exists $hash{$aa[1]});
	next unless($hash_temp{$aa[1]}==1);
#	next if($hash{$aa[1]} eq "Ambiguous" or $hash{$aa[1]} eq "Conserved" or  $hash{$aa[1]} eq "Cis+trans" or $hash{$aa[1]} eq "Cisxtrans");
	print "$_\t$hash{$aa[1]}\n";
}
close FILE;


	

		
