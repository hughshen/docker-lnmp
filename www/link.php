<?php

$mysqli = new mysqli(getenv('MYSQL_HOST'), 'root', getenv('MYSQL_ROOT_PASSWORD'), getenv('MYSQL_DATABASE'));

if ($mysqli->connect_errno) {
    echo "Sorry, this website is experiencing problems.";
    echo "Error: Failed to make a MySQL connection, here is why: \n";
    echo "Errno: " . $mysqli->connect_errno . "\n";
    echo "Error: " . $mysqli->connect_error . "\n";
    exit;
} else {
    print_r($mysqli);
}

$mysqli->close();

