#!/usr/bin/perl
use strict;

open FILE,"$ARGV[0]";
my %hash_peak_len;
my %hash_peak_SV;
while(<FILE>){
	chomp;
	my @aa = split;
	my $label = "$aa[4]"."\t"."$aa[5]"."\t"."$aa[6]"."\t"."$aa[7]"."\t"."$aa[8]";
	my $peak_len = $aa[2]-$aa[1];
	push @{$hash_peak_len{$label}},$peak_len;
	push @{$hash_peak_SV{$label}},$aa[-1];
}	
close FILE;


foreach my $aa(keys %hash_peak_len){
        my $len = join(",",@{$hash_peak_len{$aa}});
        my $sv = join(",",@{$hash_peak_SV{$aa}});
	my @len = @{$hash_peak_len{$aa}};
	my @sv = @{$hash_peak_SV{$aa}};
	my $total_len;
	my $total_sv;
	foreach my $tmp(@len){
		$total_len+=$tmp;
	}
	foreach my $tmp(@sv){
		$total_sv+=$tmp;
	}
	my $ratio = $total_sv/$total_len;
	if($ratio==0){
	        print "$aa\t$len\t$sv\twithout_SV\t$total_len\t$total_sv\t$ratio\n";
	}else{
		print "$aa\t$len\t$sv\twith_SV\t$total_len\t$total_sv\t$ratio\n";
	}
}
			
		
	
