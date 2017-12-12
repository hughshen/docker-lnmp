<?php

ini_set('display_errors', 1);
error_reporting(E_ALL);

try {
    $redis = new Redis();
    $redis->connect('redis', 6379);

    //check whether server is running or not 
    echo "Connection to server sucessfully<br>";
    echo "Server is running: " . $redis->ping() . "<br>";

    // Test
    $redis->set('name', 'World');
    echo "Hello " . $redis->get('name') . ".<br>";
} catch (Exception $e) {
    throw new $e;
}

