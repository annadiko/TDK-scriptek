#!/usr/bin/perl
use Data::Dumper;

open (FILE, $ARGV[0]);
my @diffarray = <FILE>;
open (NEWFILE, ">" . "abundant_sequences");

my %diffHash;
my @splitdiff;
my $count;
my @actID;
my @output;
foreach my $diffLines (@diffarray)
{
	@splitdiff = split("\t", $diffLines);	
	if(!defined $diffHash{$splitdiff[3]})
	{
		$diffHash{$splitdiff[3] =  [];
	}
	push @{$diffHash{$splitdiff[3]}}, $splitdiff[0];
}
foreach my $k (keys %diffHash)
{
	@actID = @{$diffHash{$k}};
	foreach my $actLines (@actID)
	{
		print "$actLines\t$k"
	}


}