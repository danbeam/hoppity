if [ $# -le 0 ]; then
    cat <<EOT
You need to specify a filename!
Usage: `basename $0` <filename>
EOT
>&2 && exit 1;
fi

#DEBUG=1;

[ ! -z $DEBUG ] && echo "Attempting to read $1 ...";

if [ ! -f $1 ]; then
    echo "That file doesn't exist!" >&2 && exit 1;
elif [ ! -r $1 ]; then
    echo "That file isn't readable!" >&2 && exit 1;
fi

to_count=$(cat $1);

[ ! -z $DEBUG ] && echo "Got value of $to_count from file.";

for i in `seq 1 $to_count`; do
    if [ "0" -eq "$(($i % 15))" ]; then
        echo "Hop";
    elif [ "0" -eq "$(($i % 3))" ]; then
        echo "Hoppity";
    elif [ "0" -eq "$((i % 5))" ]; then
        echo "Hophop";
    fi
done
