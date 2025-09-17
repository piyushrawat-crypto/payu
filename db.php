<?php
$server = 'localhost';
$database = 'payment';
$username = 'root';
$password = '';

$conn = mysqli_connect($server, $username, $password, $database);

if ($conn) {
    echo 'Connected successfully';
} else {
    echo 'Connection failed: ' . mysqli_connect_error();
}
?>
