debug = false

if ARGV.length <= 0
    warn "You need to specify a filename!"
    warn "Usage: " + File.basename(__FILE__) + " <filename>"
    exit 1
end

if debug
    puts "Trying to open " + ARGV[0]
end

if not File.exists?(ARGV[0])
    warn "That file doesn't exist!"
    exit 1
elsif not File.readable?(ARGV[0])
    warn "That file isn't readable!"
    exit 1
end

in_file = File.open(ARGV[0])
buffer = in_file.read.strip

if debug
    puts "Got value of " + buffer.strip + " from file."
end

for i in 1..Integer(buffer)
    if 0 == i % 15
        puts "Hop"
    elsif 0 == i % 3
        puts "Hoppity"
    elsif 0 == i % 5
        puts "Hophop"
    end
end
