<?php
$server = '13.126.51.67';
$database = 'sabkaloancrm';
$username = 'sabkaloan_user';
$password = 'sabk@Loan123';

// Create connection
$conn = mysqli_connect($server, $username, $password, $database);

// Check connection
if ($conn) {
    echo '✅ Connected successfully to remote database.';
} else {
    echo '❌ Connection failed: ' . mysqli_connect_error();
}
?>
