#!/usr/bin/perl
use Data::Dumper;


open (FILE, "annotation_trinity.txt");
my @file = <FILE>;
open FILE;


open (NEWFILE, ">" . "trinity_annotation_ready.txt");

foreach my $lines (@file)
{
	my @split = split("\t", $lines);
	foreach my $splitlines (@split)
	{
		chomp $split[1];
		$split[1] =~ s/GO:/ /g;
		chomp $split[0];
		print NEWFILE $split[0] . " ". "=". $split[1] . "\n";

	}
	


}
