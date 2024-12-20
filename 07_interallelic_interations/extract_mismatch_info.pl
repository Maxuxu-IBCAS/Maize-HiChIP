#!/usr/bin/perl
use strict;

my %hash_pos;
open FILE,"$ARGV[0]";

while(<FILE>){
	chomp;
	my @aa = split;
	next if($aa[-1] =~ /I|D/);
	my $label = "$aa[0]"."\t"."$aa[1]"."\t"."$aa[2]"."\t"."$aa[-2]";
	$hash_pos{$aa[3]}  = $label;
}
close FILE;


my %hash_se;
open FILE,"$ARGV[1]";
while(<FILE>){
	chomp;
	my @aa = split;
	$aa[0]=~s/>//;
	chomp(my $line = <FILE>);
	$hash_se{$aa[0]} = $line if(exists $hash_pos{$aa[0]});
}
close FILE;

open FILE,"$ARGV[2]";
while(<FILE>){
	chomp;
	my @aa = split;	
	next unless(exists $hash_pos{$aa[0]});
	my @pos = split /\t/,$hash_pos{$aa[0]};
	if($aa[-1] eq $hash_se{$aa[0]}){
		print "$_\tNA\tNA\tNA\tNA\n";
	}else{
		my @se = split //,$aa[-1];
		my @re = split //,$hash_se{$aa[0]};
		my @temp;
#		if($pos[-1] eq "+"){
			for(my $n=0;$n<@re;$n++){
				next if($se[$n] eq $re[$n]);
				my $weizhi = $pos[1]+1+$n;
				print "$_\t$pos[0]\t$weizhi\t$re[$n]\t$se[$n]\n";
			}
#		}else{
#			for(my $n=0;$n<@re;$n++){
#				next if($se[$n] eq $re[$n]);
#				my $weizhi = $pos[2]-$n;
#				print "$_\t$pos[0]\t$weizhi\t$re[$n]\t$se[$n]\n";
#			}
		}
	}

close FILE;	



