#!/usr/bin/perl
use strict;

my %hash_all;
my %hash1;
open FILE,"$ARGV[0]";
while(<FILE>){
	chomp;
	my @aa = split;
	next if($aa[-1]==0);
	my $label = "$aa[3]"."\t"."$aa[-2]";
	$hash1{$label}+=1;
	$hash_all{$aa[3]} = 1;
}
close FILE;



my %hash2;
open FILE,"$ARGV[1]";
while(<FILE>){
        chomp;
        my @aa = split;
        next if($aa[-1]==0);
        my $label = "$aa[3]"."\t"."$aa[-2]";
        $hash2{$label}+=1;
        $hash_all{$aa[3]} = 1;
}
close FILE;


my %hash3;
open FILE,"$ARGV[2]";
while(<FILE>){
        chomp;
        my @aa = split;
        next if($aa[-1]==0);
        my $label = "$aa[3]"."\t"."$aa[-2]";
        $hash3{$label}+=1;
        $hash_all{$aa[3]} = 1;
}
close FILE;



print "GeneID\tB73-rep1\tB73-rep2\tB73-rep3\tMo17-rep1\tMo17-rep2\tMo17-rep3\n";
foreach my $aa(keys %hash_all){
	my $b = "$aa"."\t"."B73";
	my $m = "$aa"."\t"."Mo17";
	$hash1{$b} = 0 unless(exists $hash1{$b});
	$hash1{$m} = 0 unless(exists $hash1{$m});
	$hash2{$b} = 0 unless(exists $hash2{$b});
        $hash2{$m} = 0 unless(exists $hash2{$m});
	$hash3{$b} = 0 unless(exists $hash3{$b});
        $hash3{$m} = 0 unless(exists $hash3{$m});
	print "$aa\t$hash1{$b}\t$hash2{$b}\t$hash3{$b}\t$hash1{$m}\t$hash2{$m}\t$hash3{$m}\n";
}

