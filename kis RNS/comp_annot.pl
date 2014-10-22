#!/usr/bin/perl
use Data::Dumper;


open (FILE, "annotation_trinity.txt");
my @file = <FILE>;
open FILE;


open (NEWFILE, ">" . "comp_annot.txt");

open (TRINITYFILE, "abundant_trinity.txt");
my @trinityarray = <TRINITYFILE>;
close TRINITYFILE;

foreach my $lines (@file)
{
	my @split = split (" ", $lines);
	foreach my $trinityline (@trinityarray)
	{
		my @split_trinity = split (" ", $trinityline);
		foreach my $split_trinity_line (@split_trinity)
		{
			if ($split[0] eq $split_trinity_line)
			{
				print NEWFILE "$split_trinity_line\n";
			}
		}

	}
}
close NEWFILE;
