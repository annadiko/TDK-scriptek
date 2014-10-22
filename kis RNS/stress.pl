#!/usr/bin/perl
use Data::Dumper;

open (FILE, "tmp");
my @annotation = <FILE>;
close FILE;


open (MYFILE, "comp_uniq.txt");
my @trinityarray = <MYFILE>;
close MYFILE;
my @split_annotation;
my @splitkettospont;
open (NEWFILE, ">" . "stress.txt"); 

foreach my $annotationLine (@annotation)
{
	
		@split_annotation = split (" ", $annotationLine);
		@splitkettospont = split (":", $split_annotation[0]);
		foreach my $annline (@split_annotation)
		{
				foreach my $trinityline (@trinityarray)
				{
					chomp ($trinityline);
					if ($trinityline eq $splitkettospont[0])
					{
						foreach my $annline (@split_annotation)
						{
							if ($annline =~ /stress/)
							{
								print NEWFILE "$split_annotation[0]\t$annline\n";					
							}
						}
					}
				}
			
		}
}
close NEWFILE;