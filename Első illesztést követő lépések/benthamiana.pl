#!usr/bin/perl;
use strict; use warnings;

open (FILE, "benthamianablast_1.txt");
my @line = <FILE>;
my $temp;
close(FILE);
foreach (@line) {
		if (/Query/) {
			if ($_ =~/(\sST\S+)/) {
		 		$temp=$1;}}
		if ($_ =~/Nbv/) {
					print "$temp\t$_";
		}
}
