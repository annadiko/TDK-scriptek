#!/usr/bin/perl
use strict; use warnings;
use Data::Dumper;

open (FILE , $ARGV[0]);
my @lines = <FILE>;
close FILE;
my @splitline;

open (MYFILE, $ARGV[1]);
my @fileline = <MYFILE>;
my @splitfile;
open (NEWFILE, ">" . $ARGV[0] . "ch1ch2");

foreach my $variable1 (@lines)
{
	foreach my $variable2 (@fileline)
	{	
		chomp $variable1;
		chomp $variable2;
		@splitline = split ("\t", $variable1);
		@splitfile = split( "\t", $variable2);
		if( $splitfile[0] eq $splitline[0])
		{
			print NEWFILE $splitline[0] . "\t" . $splitline[2] . "\t" . $splitline[5] . "\n";
		}
	}
	
}
close NEWFILE;
close MYFILE;

