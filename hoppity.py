import sys;
import os;

debug = False

if len(sys.argv) <= 1:
    sys.stderr.write("You need to specify a filename!\n")
    sys.stderr.write("Usage: " + __file__ + " <filename>\n")
    sys.exit(1)

if debug:
    print "Trying to open " + sys.argv[1]

if not os.path.exists(sys.argv[1]):
    sys.stderr.write("That file doesn't exist!\n")
    sys.exit(1)
elif not os.access(sys.argv[1], os.R_OK):
    sys.stderr.write("That file isn't readable!\n")
    sys.exit(1)

in_file = open(sys.argv[1], 'r')
to_count = in_file.readline().strip()
in_file.close()

if debug:
    print "Got value of " + to_count + " from file"

to_count = int(to_count)

for i in range(1, to_count + 1):
    if 0 == i % 15:
        print 'Hop'
    elif 0 == i % 3:
        print 'Hoppity'
    elif 0 == i % 5:
        print 'Hophop'
