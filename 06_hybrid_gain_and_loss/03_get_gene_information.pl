#!/usr/bin/perl
use strict;

open FILE,"$ARGV[0]";
my %hash;
while(<FILE>){
	chomp;
	my @aa = split;
	next if($aa[-1] == 0);
#	print "$_\n";
	push @{$hash{$aa[3]}},$aa[8];
}
close FILE;


foreach my $aa(keys %hash){
	my %hash_temp;
	my @temp = @{$hash{$aa}};
	foreach my $temp(@temp){
		$hash_temp{$temp} = 1;
	}
	foreach my $key (keys %hash_temp){
		print "$aa\t$key\n";
	}
}
close FILE;
