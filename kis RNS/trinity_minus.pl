#!/usr/bin/perl
use Data::Dumper;

open (TRINITYFILE, "trinity_ch1ch2");
my @trinityarray = <TRINITYFILE>;

open (MINUSFILE, "SIG_CH.txt");
my @minusarray = <MINUSFILE>;

my @splitTrinity;
my %trinityHash;

my @splitminus;
my %minusHash;

open (NEWFILE, ">" . "trinity_minus_test.txt");

foreach my $trinitylines (@trinityarray)
{
	@splitTrinity = split ("\t", $trinitylines);
	if (!defined $trinityHash{$splitTrinity[0]})
	{
		$trinityHash{$splitTrinity[0]} = [];
	}
	push @{$trinityHash{$splitTrinity[0]}}, $splitTrinity[1];
}

foreach my $minuslines (@minusarray)
{
	@splitminus = split ("\t", $minuslines);
	if (!defined $minusHash{$splitminus[1]})
	{
		$minusHash{$splitminus[1]} = [];
	}
	push @{$minusHash{$splitminus[1]}}, $splitminus[2];

}
my @value;
my @minusvalues;
foreach my $k (keys %minusHash)
{
		@value =  @{$minusHash{$k}};
		foreach my $l (keys %trinityHash)
		{
			@minusvalues = @{$trinityHash{$l}};
			foreach my $trinlines (@minusvalues)
			{

				foreach my $valueLines(@value)
				{
					if ($k eq $trinlines)
					{
						print NEWFILE "$l\t$k\t$valueLines";
					}
				}
			}
		}
}
