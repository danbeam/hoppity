use strict;

my $DEBUG = (1 != 1);

if ($#ARGV < 0) {
    print STDERR "You need to specify a file name!\n" .
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

my $to_count;
print "Trying to open $ARGV[0]\n" if $DEBUG;

{
    local $\ = undef;
    open FILE, $ARGV[0];
    $to_count = <FILE>;
}

chomp $to_count;
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
