<?php
include 'db.php';

// Merchant credentials
$merchantKey = "p55pXD";
$salt = "Ufw2TWA4JmbOpbFbrcWJadJY1KJieKZx";

// Receive POST from PayU
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    die("Invalid request");
}

$response = $_POST;

// Extract values
$txnid = $response['txnid'] ?? '';
$status = $response['status'] ?? '';
$email = $response['email'] ?? '';
$firstname = $response['firstname'] ?? '';
$productinfo = $response['productinfo'] ?? '';
$amount = $response['amount'] ?? '';
$posted_hash = $response['hash'] ?? '';
$udf1 = $response['udf1'] ?? '';
$udf2 = $response['udf2'] ?? '';
$udf3 = $response['udf3'] ?? '';
$udf4 = $response['udf4'] ?? '';
$udf5 = $response['udf5'] ?? '';
$customerID = '2345';
$leadID = '1234';


// Validate hash
$hashSequence = $salt . '|' . $status . '||||||' . $udf5 . '|' . $udf4 . '|' . $udf3 . '|' . $udf2 . '|' . $udf1 . '|' .
    $email . '|' . $firstname . '|' . $productinfo . '|' . $amount . '|' . $txnid . '|' . $merchantKey;
$calculated_hash = strtolower(hash('sha512', $hashSequence));

if ($calculated_hash !== $posted_hash) {
    echo "Invalid transaction. Hash mismatch.";
    exit;
}

echo "Payment Failed! <br>";
echo "Transaction ID: " . htmlspecialchars($txnid) . "<br>";
echo "Status from PayU: " . htmlspecialchars($status) . "<br>";

require_once 'verify-payment.php';
$verify_result = verifyPayment($txnid, $merchantKey, $salt);

$response_json = json_encode($verify_result, JSON_UNESCAPED_UNICODE);


$stmt = $conn->prepare("INSERT INTO payment_logs (customerID, leadID, txnid, mihpayid, apistatus, response, status, amount) VALUES (?, ?, ?, ?, ?, ?, 'failed', ?)");
$stmt->bind_param("ssssdss", $customerID, $leadID, $txnid, $mihpayid, $verify_result['status'], $response_json, $amount);
$stmt->execute();
$stmt->close();
if ($verify_result['status'] == 1) {

    $details = $verify_result['transaction_details'][$txnid];
    echo "Verified Status: " . htmlspecialchars($details['status']) . "<br>";
    $stmt = $conn->prepare("UPDATE payment_logs SET is_verified = 1 WHERE txnid = ?");
    $stmt->bind_param("s", $txnid);
    $stmt->execute();
    $stmt->close();
} else {
    echo "Could not verify payment.";
}
