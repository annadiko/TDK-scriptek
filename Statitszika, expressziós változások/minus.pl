#!/usr/bin/perl
use strict; use warnings;
use Data::Dumper;

open (FILE, $ARGV[0]);
my @fileline = <FILE>;
my @splitfile;
close FILE;
my $dif;
my @difarray;

open (NEWFILE, ">" . $ARGV[0] . "minus");

print NEWFILE "ID\tDIFFERENCE\n";
foreach (@fileline)
{
	@splitfile = split ("\t", $_);
	$dif = $splitfile [2] - $splitfile[1];
	print NEWFILE $splitfile[0] . "\t" . $dif . "\n";

}
close NEWFILE;
