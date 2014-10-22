#!/usr/bin/perl
use strict; use warnings;
use Data::Dumper;

my $tempID;
my @templine;
my $filename;
my $writeout = 0;
my $is_benthamiana = 0;
open (FILE, $ARGV[0]); #a beadott fájllal dolgozik

foreach (<FILE>)
{
	if (/^!Sample_title =/) 
		{
			if (/!Sample_title = (N_benthamiana.*)/)
			{		
			$tempID = $1;
			$is_benthamiana = 1;
			open (FILE, ">$tempID.txt");
			}
			else
			{
				$is_benthamiana = 0;
			}
	
		}
	if (/!sample_table_begin/)
		{
			$writeout = 1;
			next;
		}
	if (/!sample_table_end/)
		{
			$writeout = 0;
			close FILE;
		}
	if ($writeout == 1 && $is_benthamiana == 1)
		{
			print FILE $_;
		}

}
close FILE;
