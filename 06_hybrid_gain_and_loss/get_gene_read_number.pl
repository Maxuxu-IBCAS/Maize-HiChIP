#!/usr/bin/perl
use strict;

my %hash_all;
my %hash;
open FILE,"$ARGV[0]";
while(<FILE>){
	chomp;
	my @aa = split;
	next if($aa[-1]==0);
	my $label = "$aa[3]"."\t"."$aa[-2]";
	$hash{$label}+=1;
	$hash_all{$aa[3]} = 1;
}
close FILE;

foreach my $aa(keys %hash_all){
	my $b = "$aa"."\t"."B73";
	my $m = "$aa"."\t"."Mo17";
	$hash{$b} = 0 unless(exists $hash{$b});
	$hash{$m} = 0 unless(exists $hash{$m});
	print "$aa\t$hash{$b}\t$hash{$m}\n";
}

