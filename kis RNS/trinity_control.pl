#!/usr/bin/perl
use Data::Dumper;

open (TRINITY, $ARGV[0]);

my @trinityarray = <TRINITY>;
my %trinityHash;
my @splitTrinity;
my $pos = 0;
my $neg = 0;
my @values;
foreach my $trinitylines (@trinityarray)
{
	@splitTrinity = split ("\t", $trinitylines);
	if (!defined $trinityHash{$splitTrinity[0]})
	{
		$trinityHash{$splitTrinity[0]} = [];
	}
	push @{$trinityHash{$splitTrinity[0]}}, $splitTrinity[1];
}
foreach my $k (keys %trinityHash)
{
	@values = @{%trinityHash{$k};
	foreach my $lines (@values)
	{
		if ($lines > 0)
		{
			$pos = 1;
		}
		if ($lines < 0)
		{
			$neg = 1;
		}
		if ($pos ==1  && $neg ==1)
		{
			print "Hiba";
		}
	}

}
