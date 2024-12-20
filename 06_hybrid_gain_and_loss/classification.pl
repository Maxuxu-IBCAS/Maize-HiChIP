#!/usr/bin/perl
use strict;


my %hash_all;
my %hash1;
open FILE,"B73_and_Mo17_expression.results.xls";
while(<FILE>){
	chomp;
	my @aa = split;
	$aa[0]=~s/gene://;
	next if(/NA/);
	$hash_all{$aa[0]} = 1;
	if($aa[6]<0.05 and $aa[2]>1){
		$hash1{$aa[0]} = "sig-B73";
	}elsif($aa[6]<0.05 and $aa[2]<-1){
		$hash1{$aa[0]} = "sig-Mo17";
	}else{
		$hash1{$aa[0]} = "unsig";
	}
}
close FILE;

open FILE,"B73_and_Mo17_expression.Mo17.results.xls";
while(<FILE>){
        chomp;
	my @aa = split;
        $aa[0]=~s/gene://;
        next if(/NA/);
        $hash_all{$aa[0]} = 1;
        if($aa[6]<0.05 and $aa[2]>1){
                $hash1{$aa[0]} = "sig-B73";
        }elsif($aa[6]<0.05 and $aa[2]<-1){
                $hash1{$aa[0]} = "sig-Mo17";
        }else{
                $hash1{$aa[0]} = "unsig";
        }
}
close FILE;

my %hash2;
open FILE,"$ARGV[0]";
while(<FILE>){
        chomp;
	my @aa = split;
        $aa[0]=~s/gene://;
	next if(/NA/);
	$hash_all{$aa[0]} = 1;
	if($aa[6]<0.05 and $aa[2]>1){
                $hash2{$aa[0]} = "sig-B73";
        }elsif($aa[6]<0.05 and $aa[2]<-1){
                $hash2{$aa[0]} = "sig-Mo17";
        }else{
                $hash2{$aa[0]} = "unsig";
        }
}
close FILE;


my %hash3;
open FILE,"$ARGV[1]";
while(<FILE>){
        chomp;
	my @aa = split;
        $aa[0]=~s/gene://;
	next if(/NA/);
	$hash_all{$aa[0]} = 1;
	if($aa[-1]<0.01){
		$hash3{$aa[0]} = "sig";
	}else{
		$hash3{$aa[0]} = "unsig";
	}
}
close FILE;


foreach my $aa(keys %hash_all){
	$hash1{$aa} = "NA" unless(exists $hash1{$aa});
	$hash2{$aa} = "NA" unless(exists $hash2{$aa});
	$hash3{$aa} = "NA" unless(exists $hash3{$aa});
	print "$aa\t$hash1{$aa}\t$hash2{$aa}\t$hash3{$aa}\n";
}

	







