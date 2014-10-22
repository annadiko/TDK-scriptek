#!/usr/bin/perl
use Data::Dumper;


open (FILE, "annotation.txt");
my @array = <FILE>;
close FILE;
my @split;
my %compHash;
my @values;

open (MYFILE, "abundant_trinity.txt");
my @myarray = <MYFILE>;
close MYFILE;
my @splitline;

open (NEWFILE, ">". "annotation_correct.txt");

foreach my $fileline (@array)
{
	@split = split ("\t", $fileline);
	if (!defined $compHash{$split[0]})
	{
		$compHash{$split[0]} = [];
	}
	push @{$compHash{$split[0]}}, $split[1];
}

foreach my $myline (@myarray)
{
	@splitline = split (" ", $myline);
	foreach my $lines (@splitline)
	{
		foreach my $k (keys %compHash)
		{
			if ($lines eq $k)
			{
				@values = @{$compHash{$k}};
				foreach my $v (@values)
				{
				
						print NEWFILE "$k\t$v";
				
				}
			}
		}
	}

}