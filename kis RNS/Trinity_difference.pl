#!/usr/bin/perl
use strict; use warnings;
use Data::Dumper;
use Math::Cartesian::Product;

open (FILE, "Trinity_diff_uniq.txt");
my @trinityarray = <FILE>;
close FILE;
my @split_1;
my @split_2;
my %treatmentHash = ();
my %id;
my %seq;
my $ids;
my $ref;
my @id;
my @treatment;
my @tr_array;
my @tmparray;
my @split1;
my @split2;
my @values;
my $scalar;
open (NEWFILE, ">" . "abundant_trinity.txt");

foreach my $trinityline (@trinityarray)
{
	my @splittrinity = split ("\t", $trinityline);
	push @tr_array, \@splittrinity;
}

foreach my $splittrinityline (@tr_array)
{
		my @split1 = split (",", $$splittrinityline[1]);
		my @split2 = split (",", $$splittrinityline[2]);
		foreach my $positive (@split1)
		{
			foreach my $negative(@split2)
			{
				if ($positive eq $negative)
				{
					next;
				}
				my $ids = $positive . " " . $negative;
				
				if (!defined $treatmentHash{$ids})
				{
					$treatmentHash{$ids} = {};
				}
				${$treatmentHash{$ids}}{$$splittrinityline[3]} = 1;
			}
		}		
		
}
foreach my $k (keys %treatmentHash)
{
	@values = keys %{$treatmentHash{$k}};
	$scalar = @values;
	
		if ($#values > 0)
		{	 
			print NEWFILE "$k\t$scalar\n";
		}
	
}
