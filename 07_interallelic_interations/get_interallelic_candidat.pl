#!/usr/bin/perl
use strict;


open FILE,"$ARGV[0]";
my %hash;
while(<FILE>){
	chomp;
	my @aa = split;
	my $len = @aa;
	$aa[4]=0; $aa[5] = 0;
	$aa[9]=0; $aa[10] = 0;
	$aa[14]=0; $aa[15] = 0;
	$aa[19]=0; $aa[20] = 0;
	my $line = join("\t",@aa[1..$len]);
	if($aa[-4]>0 and $aa[-3]==0 and $aa[-2]==0 and $aa[-1]>0){
		$hash{$line}  = 1;
	}
	if($aa[-4]==0 and $aa[-3]>0 and $aa[-2]>0 and $aa[-1]==0){
		$hash{$line}  = 1;
	}
}
close FILE;

my %hash2;
foreach my $aa(keys %hash){
	my @aa = split /\t/,$aa;
	next if($aa=~/B73V4/);
	if($aa[-4]>0 and $aa[-3]==0 and $aa[-2]==0 and $aa[-1]>0){
		my $start1 = int($aa[6]/5000)*5000;
		my $end1 = $start1+5000;
		my $start2 = int($aa[11]/5000)*5000;
		my $end2 = $start2+5000;
		
		my $start3 = int($aa[1]/5000)*5000;
                my $end3 = $start3+5000;
                my $start4 = int($aa[16]/5000)*5000;
                my $end4 = $start4+5000;
	
		my $label = "Chr$aa[5]"."\t"."$start1"."\t"."$end1"."\t"."$aa[10]"."\t"."$start2"."\t"."$end2"."\t"."Chr$aa[0]"."\t"."$start3"."\t"."$end3"."\t"."$aa[15]"."\t"."$start4"."\t"."$end4";
		$hash2{$label} += 1;
	}
	if($aa[-4]==0 and $aa[-3]>0 and $aa[-2]>0 and $aa[-1]==0){
		my $start1 = int($aa[1]/5000)*5000;
		my $end1 = $start1+5000;
		my $start2 = int($aa[16]/5000)*5000;
		my $end2 = $start2+5000;

		my $start3 = int($aa[6]/5000)*5000;
                my $end3 = $start3+5000;
                my $start4 = int($aa[11]/5000)*5000;
                my $end4 = $start4+5000;

		my $label = "Chr$aa[0]"."\t"."$start1"."\t"."$end1"."\t"."$aa[15]"."\t"."$start2"."\t"."$end2"."\t"."Chr$aa[5]"."\t"."$start3"."\t"."$end3"."\t"."$aa[10]"."\t"."$start4"."\t"."$end4";
		$hash2{$label} += 1;
	}
}
foreach my $aa(keys %hash2){
	print "$aa\t$hash2{$aa}\n";
}




