#!/usr/bin/perl
use strict;

open FILE,"$ARGV[0]";
my %hash;
while(<FILE>){
	chomp;
	my @aa = split;
	$hash{$aa[0]} = $_;
	
}
close FILE;

for(my $n=1;$n<=4;$n++){
	my @name = split /\./,$ARGV[$n];
	open FILE,"samtools view -h $ARGV[$n] |";
	open OUT1,">$name[0].$name[1].$name[2].sam";
	open OUT2,">$name[0].$name[1].$name[2].fa";
#	}
	while(<FILE>){
		chomp;
		my @aa = split;
		if(/^@/){
			print OUT1 "$_\n";
		}else{
			print OUT1 "$_\n" if(exists $hash{$aa[0]});
			if(exists $hash{$aa[0]}){
			#	if($n ==1 or $n==3){
					print OUT2 "$hash{$aa[0]}\t$aa[9]\n";
			#	}
			}
				
		}
	}
	close FILE;
	close OUT1;
#	if($n==1 or $n==3){
		close OUT2;
#	}
}


