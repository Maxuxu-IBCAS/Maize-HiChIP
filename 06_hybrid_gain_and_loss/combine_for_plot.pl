#!/usr/bin/perl
use strict;


my @file = glob("*loss*class");

foreach my $file(@file){
	open FILE,"$file";
	my @name = split /\./,$file;
	my %hash;
	my %hash_total;
	while(<FILE>){
		chomp;
		my @aa = split;
		next if(/ambiguous/);
		next if(@aa==2);
#		next if(/Zm00014a/);
		my $label = "$aa[0]"."\t"."$aa[2]";
		$hash_total{$aa[0]}+=1;
		$hash{$label}+=1;
	}
	close FILE;
	foreach my $aa(keys %hash){
		my @temp = split /\t/,$aa;
		my $value = $hash{$aa}/$hash_total{$temp[0]};
		print "$name[0]\t$aa\t$hash{$aa}\t$value\n";
	}
}

