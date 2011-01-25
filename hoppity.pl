
use strict;
use warnings;

my $DEBUG = (1 != 1);

if ($#ARGV < 0) {
    print STDERR "You need to specify a filename!\n" .
                 "Usage: $0 <filename>\n";
    exit 1;
}

unless (-f $ARGV[0]) {
    print STDERR "That file doesn't exist!\n";
    exit 1;
}
unless (-r $ARGV[0]) {
    print STDERR "That file isn't readable!\n";
    exit 1;
}

print "Trying to open $ARGV[0]\n" if $DEBUG;

my $to_count;
open FILE, $ARGV[0];

{
    undef $/;
    $to_count = <FILE>;
}

$to_count =~ s/\D//g;
print "Got value of $to_count from file.\n" if $DEBUG;

for (my $i = 1; $i <= $to_count; ++$i) {
    if (0 eq $i % 15) {
        print "Hop\n";
    }
    elsif (0 eq $i % 3) {
        print "Hoppity\n";
    }
    elsif (0 eq $i % 5) {
        print "Hophop\n";
    }
}
