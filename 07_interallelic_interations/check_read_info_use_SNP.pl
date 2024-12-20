#!/usr/bin/perl
use strict;

open FILE,"/mnt/maxuxu/data/minor/29_liuhan_syri_SV/B73_ref_Mo17_SNP.txt";
my %hash_B73;
while(<FILE>){
	chomp;
	my @aa = split;
	$aa[0] =~ s/Chr//;
	my $label = "$aa[0]"."\t"."$aa[1]";
	$hash_B73{$label} = 1;
}
close FILE;

open FILE,"/mnt/maxuxu/data/minor/29_liuhan_syri_SV/Mo17_ref_B73_SNP.txt";
my %hash_Mo17;
while(<FILE>){
        chomp;
        my @aa = split;
        my $label = "$aa[0]"."\t"."$aa[1]";
        $hash_Mo17{$label} = 1;
}
close FILE;

my %hash_all;
my %hash1;
my %hash1_tmp;
open FILE,"$ARGV[0]";
while(<FILE>){
	chomp;
	my @aa = split;
	$hash_all{$aa[0]}=1;
	my $label = "$aa[-4]"."\t"."$aa[-3]";
	next if($aa[-1] eq "N" or $aa[-2] eq "N");
	$hash1{$aa[0]} += 1 if(exists $hash_B73{$label});
}
close FILE;

#
open FILE,"$ARGV[1]";
my %hash2;
my %hash2_tmp;
while(<FILE>){
        chomp;
        my @aa = split;
	if(exists $hash2_tmp{$aa[0]}){
	}else{
		$hash2_tmp{$aa[0]}=1;
		$hash_all{$aa[0]}+=1;
	}
	        
	my $label = "$aa[-4]"."\t"."$aa[-3]";
	next if($aa[-1] eq "N" or $aa[-2] eq "N");
	$hash2{$aa[0]} += 1 if(exists $hash_B73{$label});
}
close FILE;

#
open FILE,"$ARGV[2]";
my %hash3;
my %hash3_tmp;
while(<FILE>){
        chomp;
        my @aa = split;
        if(exists $hash3_tmp{$aa[0]}){
        }else{  
                $hash3_tmp{$aa[0]}=1;
                $hash_all{$aa[0]}+=1;
        }  
	my $label = "$aa[-4]"."\t"."$aa[-3]";
        next if($aa[-1] eq "N" or $aa[-2] eq "N");
        $hash3{$aa[0]} += 1 if(exists $hash_Mo17{$label});
}
close FILE;

#
open FILE,"$ARGV[3]";
my %hash4;
my %hash4_tmp;
while(<FILE>){
        chomp;
        my @aa = split;
        if(exists $hash4_tmp{$aa[0]}){
        }else{  
                $hash4_tmp{$aa[0]}=1;
                $hash_all{$aa[0]}+=1; 
        }
	my $label = "$aa[-4]"."\t"."$aa[-3]";
        next if($aa[-1] eq "N" or $aa[-2] eq "N");
        $hash4{$aa[0]} += 1 if(exists $hash_Mo17{$label});
}
close FILE;



foreach my $aa(keys %hash_all){
#	next unless($hash_all{$aa} == 4);
	$hash1{$aa} = 0 unless(exists $hash1{$aa});
	$hash2{$aa} = 0 unless(exists $hash2{$aa});
	$hash3{$aa} = 0 unless(exists $hash3{$aa});
	$hash4{$aa} = 0 unless(exists $hash4{$aa});
	print "$hash_all{$aa}\t$aa\t$hash1{$aa}\t$hash2{$aa}\t$hash3{$aa}\t$hash4{$aa}\n";
}

