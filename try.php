<?php

// show output in a html format
$merchantKey = "p55pXD";
$salt = "Ufw2TWA4JmbOpbFbrcWJadJY1KJieKZx";

$txnid = substr(hash('sha256', mt_rand() . microtime()), 0, 20);
$amount = "10.00";
$productinfo = "iPhone";
$firstname = "Ashish";
$email = "test@gmail.com";
$phone = "9988776655";

// Redirect URLs
$surl = "http://localhost/payment/success.php";
$furl = "http://localhost/payment/failure.php";

// UDF fields (optional)
$udf1 = $udf2 = $udf3 = $udf4 = $udf5 = "";

// Generate the hash string as per PayU docs
$hashString = $merchantKey . '|' . $txnid . '|' . $amount . '|' . $productinfo . '|' . $firstname . '|' . $email . '|' .
    $udf1 . '|' . $udf2 . '|' . $udf3 . '|' . $udf4 . '|' . $udf5 . '||||||' . $salt;
$hash = strtolower(hash('sha512', $hashString));


// POST data
$data = [
    'key' => $merchantKey,
    'txnid' => $txnid,
    'amount' => $amount,
    'productinfo' => $productinfo,
    'firstname' => $firstname,
    'email' => $email,
    'phone' => $phone,
    'surl' => $surl,
    'furl' => $furl,
    'hash' => $hash
];

// PayU test URL
$url = "https://test.payu.in/_payment";

// Initialize cURL
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, [
    "Content-Type: application/x-www-form-urlencoded"
]);

$response = curl_exec($ch);

if (curl_errno($ch)) {
    echo "CURL Error: " . curl_error($ch);
} else {
    echo "<h3>PayU Response</h3>";
    echo "<pre>" . htmlspecialchars($response) . "</pre>";
}

curl_close($ch);
?>
