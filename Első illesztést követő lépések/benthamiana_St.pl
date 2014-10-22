#!usr/bin/perl
use strict; use warnings;
use Math::Cartesian::Product;
use Data::Dumper;

my @split_gpl1 = ();
my @split_gpl2 = ();

open (FILE, "gpl1901.txt");
my @gpl1_line = <FILE>;
close(FILE);

open (FILE, "gpl1902.txt");
my @gpl2_line = <FILE>;
close(FILE);

open (FILE, "benthamiana_tabular.txt");
my @benthamiana_line = <FILE>;
close(FILE);

my @gpl = ();
my %gplHash = ();

foreach (@gpl1_line)
{
	@split_gpl1 = split (" ", $_);
	push @gpl, \@split_gpl1; #\@tomb a @tomb valtozora referencia
	if (defined $split_gpl1[0] )
	{
		if (!defined $gplHash{ $split_gpl1[1] } )
		{
			$gplHash{ $split_gpl1[1] }= [];
		}
		push @{$gplHash{ $split_gpl1[1] } }, $split_gpl1[0] if (defined $gplHash{ $split_gpl1[1]}) ;  
	}
}
foreach (@gpl2_line)
{
	@split_gpl2 = split (" ", $_);
	push @gpl, \@split_gpl2; #\@tomb a @tomb valtozora referencia
	if (defined $split_gpl2[1] )
	{
		if (!defined $gplHash{ $split_gpl2[1] } )
		{
			$gplHash{ $split_gpl2[1] }= [];
		}
		push @{$gplHash{ $split_gpl2[1] } }, $split_gpl2[0] if (defined $gplHash{ $split_gpl2[1]}) ;  
	}
}
my @benthamiana_array = ();
my %benthamiana_hash = ();
my @split_benthamiana = ();
foreach (@benthamiana_line)
{
	@split_benthamiana = split (" ", $_);
	push @benthamiana_array, \@split_benthamiana;
	if (!defined $benthamiana_hash{ $split_benthamiana[0] } )
	{
		$benthamiana_hash{ $split_benthamiana[0] } = [];
	}	
	push @{$benthamiana_hash{$split_benthamiana[0]}}, join ( ' ', @split_benthamiana[1..3] ) if (defined $benthamiana_hash{$split_benthamiana[0]});
}

open (FILE, '>>output_benthamiana.txt');
foreach (keys %benthamiana_hash)
{
	if (defined $gplHash{$_} )
	{
		my $k = $_;	
		cartesian{print "$k @_\n"} $gplHash{$_}, $benthamiana_hash{$_};
	}
}

