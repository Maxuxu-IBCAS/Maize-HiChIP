#!/usr/bin/perl
use strict;

my %hash_pos;
open FILE,"$ARGV[0]";

while(<FILE>){
	chomp;
	my @aa = split;
	next if($aa[-1] =~ /I|D|S/);
	my $label = "$aa[0]"."\t"."$aa[1]"."\t"."$aa[2]"."\t"."$aa[-1]";
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
	$aa[0]=~s/-1/\/2/;
	$aa[0]=~s/-2/\/1/;
	next unless(exists $hash_pos{$aa[0]});
	my @pos = split /\t/,$hash_pos{$aa[0]};
	if($aa[-1] eq $hash_se{$aa[0]}){
		print "$_\tNA\tNA\tNA\tNA\n";
	}else{
		my @se = split //,$aa[-1];
		my @re = split //,$hash_se{$aa[0]};
		my @info;
		while($pos[-1] =~ /(\d+)(M|N)/g){
			for(my $n=1;$n<=$1;$n++){
				push @info,$2;
			}
		}
		my %hash_temp;
		for(my $n=0;$n<@re;$n++){
			$hash_temp{$n} = $info[$n];
		}
			my $ju1_re=-1;
			my $ju2_se=-1;
			for(my $n=0;$n<@re;$n++){
				if($hash_temp{$n} eq "M"){
					$ju1_re+=1;
					$ju2_se+=1;
					$pos[1]+=1;
					next if($se[$ju2_se] eq $re[$ju1_re]);
					my $weizhi = $pos[1];
					print "$_\t$pos[0]\t$weizhi\t$re[$ju1_re]\t$se[$ju2_se]\n";
				}else{
					$ju1_re+=1;
					$pos[1]+=1;
				}
					
			}
		}
	}

close FILE;	



