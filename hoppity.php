<?php

// theoretically you should check
// if ('cli' === php_sapi_name())
// but I'm tired and you get what you pay for, ;)

define('DEBUG', false);

if (!isset($argv[1])) {
    @file_put_contents('php://stderr', "You need to specify a filename!\n" . "Usage: " . basename($_SERVER['PHP_SELF']) . " <filename>\n", FILE_APPEND);
    exit(1);
}

if (!file_exists($argv[1])) {
    @file_put_contents('php://stderr', "That file doesn't exist!\n", FILE_APPEND);
    exit(1);
}
if (!is_readable($argv[1])) {
    @file_put_contents('php://stderr', "That file isn't readable!\n", FILE_APPEND);
    exit(1);
}

$to_count = rtrim(file_get_contents($argv[1]));

if (DEBUG) {
    echo "Got value of $to_count from file.\n";
}

for ($i = 1; $i <= $to_count; ++$i) {
    if (0 == $i % 15) {
        echo "Hop\n";
    }
    elseif (0 == $i % 3) {
        echo "Hoppity\n";
    }
    elseif (0 == $i % 5) {
        echo "Hophop\n";
    }
}

?>
