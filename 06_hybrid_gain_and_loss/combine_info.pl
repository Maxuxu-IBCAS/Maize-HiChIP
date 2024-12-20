#!/usr/bin/perl
use strict;


open FILE,"$ARGV[0]";
my %hash_temp;
while(<FILE>){
	chomp;
	my @aa = split;
	my $len = @aa;
	my $temp = join("\t",@aa[1..$len]);
	$hash_temp{$temp} = 1;
}
close FILE;

my %hash_hybrid_B73;
my %hash_hybrid_Mo17;
my %hash_hybrid;
foreach my $aa(keys %hash_temp){
	my @temp = split /\t/,$aa;
	my $label = "$temp[8]"."\t"."$temp[9]"."\t"."$temp[10]"."\t"."$temp[11]"."\t"."$temp[12]"."\t"."$temp[13]";
	my $B73 = $temp[14]+$temp[15];
	my $Mo17 = $temp[16]+$temp[17];
	next if($B73==0 and $Mo17==0);
	$hash_hybrid{$label}  = 1;
	if($B73==0 and $Mo17>0){
		$hash_hybrid_B73{$label} += 1;
	}
	if($B73>0 and $Mo17==0){
		$hash_hybrid_Mo17{$label} += 1;
	}
}

open FILE,"$ARGV[1]";
my %hash_temp;
while(<FILE>){
        chomp;
        my @aa = split;
        my $len = @aa;
        my $temp = join("\t",@aa[1..$len]);
        $hash_temp{$temp} = 1;
}
close FILE;

foreach my $aa(keys %hash_temp){
        my @temp = split /\t/,$aa;
        my $label = "$temp[8]"."\t"."$temp[9]"."\t"."$temp[10]"."\t"."$temp[11]"."\t"."$temp[12]"."\t"."$temp[13]";
        my $B73 = $temp[14]+$temp[15];
        my $Mo17 = $temp[16]+$temp[17];
        next if($B73==0 and $Mo17==0);
        $hash_hybrid{$label}  = 1;
        if($B73==0 and $Mo17>0){
                $hash_hybrid_B73{$label} += 1;
        }
        if($B73>0 and $Mo17==0){
                $hash_hybrid_Mo17{$label} += 1;
        }
}
open FILE,"$ARGV[2]";
my %hash_inbred_B73;
my %hash_inbred_Mo17;
while(<FILE>){
	chomp;
	my @aa = split;
	my $label = "$aa[0]"."\t"."$aa[1]"."\t"."$aa[2]"."\t"."$aa[3]"."\t"."$aa[4]"."\t"."$aa[5]";
	my $b73 = $aa[12]+$aa[14];
	my $mo17 = $aa[16]+$aa[18];
	$hash_inbred_B73{$label} = $b73;
	$hash_inbred_Mo17{$label} = $mo17;
}
close FILE;

open FILE,"$ARGV[3]";
#my %hash_inbred_B73;
#my %hash_inbred_Mo17;
while(<FILE>){
        chomp;
        my @aa = split;
        my $label = "$aa[0]"."\t"."$aa[1]"."\t"."$aa[2]"."\t"."$aa[3]"."\t"."$aa[4]"."\t"."$aa[5]";
        my $b73 = $aa[12]+$aa[14];
        my $mo17 = $aa[16]+$aa[18];
        $hash_inbred_B73{$label} = $b73;
        $hash_inbred_Mo17{$label} = $mo17;
}
close FILE;


	
foreach my $aa(keys %hash_inbred_B73){
	$hash_hybrid_B73{$aa} = 0 unless(exists $hash_hybrid_B73{$aa});
	$hash_hybrid_Mo17{$aa} = 0 unless(exists $hash_hybrid_Mo17{$aa});
	$hash_inbred_B73{$aa} = 0 unless(exists $hash_inbred_B73{$aa});
        $hash_inbred_Mo17{$aa} = 0 unless(exists $hash_inbred_Mo17{$aa});
	my @temp = split /\t/,$aa;
#	next if($hash_hybrid_B73{$aa} == 0 and $hash_hybrid_Mo17{$aa} ==0 );
	print "$temp[0]\t$temp[1]\t$temp[4]\t0\t$hash_hybrid_B73{$aa}\t$hash_hybrid_Mo17{$aa}\t0\t$hash_inbred_B73{$aa}\t$hash_inbred_Mo17{$aa}\n";
}






