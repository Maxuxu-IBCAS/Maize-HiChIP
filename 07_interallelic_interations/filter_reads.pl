#!/usr/bin/perl
use strict;

open FILE,"$ARGV[0]";

while(<FILE>){
	chomp;
	my @aa = split;
	my $NA_nu = $_ =~ s/NA/NA/g;
	
	if($aa[4] >5 and $aa[9] >5 and $aa[14]>5 and $aa[19]>5){
		if($aa[3] =~ /D|I/ or $aa[8] =~ /D|I/ or $aa[13] =~ /D|I/ or $aa[18] =~ /D|I/){
		}else{
			next if($aa[5] == 0 and $aa[10] == 0);
			next if($aa[15] == 0 and $aa[20] == 0);
			print "$_\n";
		}
	}
	
	if($aa[1] eq "NA" and $aa[16] eq "NA"){
		if($aa[6] eq "NA" or $aa[11] eq "NA"){
		}else{
			next if($aa[8] =~ /D|I/ or $aa[13] =~ /D|I/);
			print "$_\n";
		}
	}

	if($aa[6] eq "NA" and $aa[11] eq "NA"){
		if($aa[1] eq "NA" or $aa[16] eq "NA"){
                }else{
			next if($aa[3] =~ /D|I/ or $aa[18] =~ /D|I/);
                        print "$_\n";
                }
        }
	
	if($aa[1] eq "NA" and $aa[6] ne "NA" and $aa[11] ne "NA" and $aa[16] ne "NA"){
		next if($aa[8] =~ /D|I/ or $aa[13] =~ /D|I/ or $aa[18] =~ /D|I/);
		next if ($aa[15] == 0 and $aa[20] == 0);
		print "$_\n";
	}

	if($aa[1] ne "NA" and $aa[6] eq "NA" and $aa[11] ne "NA" and $aa[16] ne "NA"){
		next if($aa[3] =~ /D|I/ or $aa[13] =~ /D|I/ or $aa[18] =~ /D|I/);
		next if ($aa[15] == 0 and $aa[20] == 0);
		print "$_\n";
	}

	if($aa[1] ne "NA" and $aa[6] ne "NA" and $aa[11] eq "NA" and $aa[16] ne "NA"){
                next if($aa[3] =~ /D|I/ or $aa[8] =~ /D|I/ or $aa[18] =~ /D|I/);
		next if($aa[5] == 0 and $aa[10] == 0);
                print "$_\n";
        }

	if($aa[1] ne "NA" and $aa[6] ne "NA" and $aa[11] ne "NA" and $aa[16] eq "NA"){
                next if($aa[3] =~ /D|I/ or $aa[13] =~ /D|I/ or $aa[8] =~ /D|I/);
		next if($aa[5] == 0 and $aa[10] == 0);
                print "$_\n";
        }

}
close FILE;

				
	
	
