#!/usr/bin/perl
use strict;

open FILE,"$ARGV[0]";
my %hash;
while(<FILE>){
	chomp;
	my @aa = split;
	next if($aa[4] == 0 and $aa[8]==0);
	$hash{$aa[0]} = $_;
}
close FILE;

for(my $n=1;$n<=2;$n++){
	my @name = split /\./,$ARGV[$n];


	open FILE,"samtools view -h -F 0x0040 -f 0x0080 $ARGV[$n] |";
	open OUT1,">$name[0]-$name[4].sam";
	open OUT2,">$name[0]-$name[4].fa";
	while(<FILE>){
		chomp;
		my @aa = split;
		if(/^@/){
			print OUT1 "$_\n";
		}else{
			$aa[0]="$aa[0]"."-1";
			print OUT1 "$_\n" if(exists $hash{$aa[0]});
			if(exists $hash{$aa[0]}){
				print OUT2 "$hash{$aa[0]}\t$aa[9]\n";
			}
				
		}
	}
	close FILE;

	open FILE,"samtools view -h -F 0x0080 -f 0x0040 $ARGV[$n] |";
	while(<FILE>){
                chomp;
                my @aa = split;
                if(/^@/){
                #        print OUT1 "$_\n";
                }else{
                        $aa[0]="$aa[0]"."-2";
                        print OUT1 "$_\n" if(exists $hash{$aa[0]});
                        if(exists $hash{$aa[0]}){
                                print OUT2 "$hash{$aa[0]}\t$aa[9]\n";
                        }
                                
                }
        }
        close FILE;

	close OUT1;
	close OUT2;
}


