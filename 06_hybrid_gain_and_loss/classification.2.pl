#!/usr/bin/perl
use strict;


open FILE,"$ARGV[0]";
while(<FILE>){
	chomp;
	my @aa = split;
	if($aa[1] =~ /sig-/  and $aa[2] =~ /sig-/ and $aa[3] eq "unsig"){
		print "$_\tcis\n";
	}elsif($aa[1] =~ /sig-/  and $aa[2] eq "unsig" and $aa[3] eq "sig"){
		print "$_\ttrans\n";
	}elsif($aa[1] =~ /sig-/  and $aa[2] =~ /sig-/ and $aa[3] eq "sig"){
		print "$_\ttrans\n";
	}elsif($aa[1] eq "unsig" and $aa[2] =~ /sig-/ and $aa[3] eq "sig"){
		print "$_\tcompensotory\n";
	}else{
		print "$_\tambiguous\n";
	}
}
close FILE;
