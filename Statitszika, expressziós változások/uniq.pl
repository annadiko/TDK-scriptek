#!/usr/bin/perl
use strict; use warnings;
use Data::Dumper;

open (FILE, "benthamiana_tabular.txt");
my @benthalmianaLine = <FILE>;
my @splitbenthamiana;
close FILE;
open (MYFILE, "SIG_STM.txt");
my @uniqLine = <MYFILE>;
my @splituniq;
close MYFILE;
open (NEWFILE, ">" . "uniq.txt");

foreach my $varbenthamiana (@benthalmianaLine)
{
	
	foreach my $varuniq (@uniqLine)
	{
		chomp $varbenthamiana;
		chomp $varuniq;
		@splitbenthamiana = split (" ", $varbenthamiana);
		@splituniq = split ("\t", $varuniq);
		if ($splitbenthamiana[0] eq $splituniq[0])
		{
			print NEWFILE $splitbenthamiana[0] . "\t" . $splitbenthamiana[1] . "\t" . $splitbenthamiana[2] . "\t" . $splitbenthamiana[3] . "\n";
		}
		
	}
	

}
close NEWFILE;
