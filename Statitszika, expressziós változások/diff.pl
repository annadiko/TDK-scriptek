#!/usr/bin/perl
use strict; use warnings;
use Data::Dumper;
open (FILE, $ARGV[0]);
open (NEWFILE, ">" . $ARGV[0] . "ID2");
my @tmpArray;
my $tmpSEQ;
my @STM;
my $tmpSTM;
my $str;
foreach my $lines (<FILE>)
{

        @tmpArray = split ("\t", $lines);
        foreach (@tmpArray)
        {
                if  ($_ =~ /XA:Z/)
                {
                        $tmpSEQ = $tmpArray[9];
                        $tmpSTM = $tmpArray[2];
                        while ($tmpArray[-1] =~ m/(^ST.*\d+$)/)
                        {
                                push @STM, $1;
                        }
                      
                        print NEWFILE "$tmpSTM\t$str\t$tmpSEQ\n";
                }
        }

}

close NEWFILE;
close FILE;

