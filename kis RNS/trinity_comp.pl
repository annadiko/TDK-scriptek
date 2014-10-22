#!/usr/bin/perl
use Data::Dumper;

open (FILE, "tmp");
my @annotation = <FILE>;
close FILE;


open (MYFILE, "abundant_trinity.txt");
my @myarray = <MYFILE>;
close MYFILE;
my @mysplit;

open (NEWFILE, ">" . "trinity_comp.txt");

my @splitannotation;
my @splitkettospont;

foreach my $anline (@annotation)
{
	@split_annotation = split (" ", $anline);
	@splitkettospont = split (":", $split_annotation[0]);
	foreach my $myline (@myarray)
	{
		@mysplit = split (" ", $myline);
		foreach my $lines (@mysplit)
		{
			if ($lines eq $splitkettospont[0])
			{
				print NEWFILE "$splitkettospont[0]\n";
			}
		}
	}


}