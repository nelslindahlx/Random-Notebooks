#!/usr/bin/perl
use strict;
use warnings;
use LWP::Simple;
use File::Basename;

my ($year, $mon, $mday) = (localtime())[5,4,3]; # Time related information
my $ymd = sprintf("%04d%02d%02d",$year+1900,$mon+1,$mday); # Date format
my $dir = $ENV{HOME} . "/html/data/"; # Set directory
chdir "$dir" or die "cannot change directory: $!"; # Set directory to data 
mkdir("$ymd", 0755) || die "Cannot mkdir newdir: $!"; # Create daily directory
chdir($ymd); # Set directory to year month date

getstore('http://www.nuxeo.com', 'nuxeo_001.html');
getstore('https://www.nuxeo.com/content-services-platform/features/', 'nuxeo_002.html');

@ARGV = ('nuxeo_001.html', 'nuxeo_002.html');

open SEL, '>', 'daily.txt' or die $!;

while (<>) {
  print SEL;
}

unlink("nuxeo_001.html");
unlink("nuxeo_002.html");

exit 0;

__END__