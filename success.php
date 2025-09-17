<?php
// success.php
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
$mihpayid = $response['mihpayid'] ?? '';
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

// Validate hash to prevent tampering
// Reverse hash logic: (as per PayU docs)
$hashSequence = $salt . '|' . $status . '||||||' . $udf5 . '|' . $udf4 . '|' . $udf3 . '|' . $udf2 . '|' . $udf1 . '|' .
    $email . '|' . $firstname . '|' . $productinfo . '|' . $amount . '|' . $txnid . '|' . $merchantKey;
$calculated_hash = strtolower(hash('sha512', $hashSequence));

if ($calculated_hash !== $posted_hash) {
    echo "Invalid transaction. Hash mismatch.";
    exit;
}

// If hash matches, you can show success etc.
// But better to verify with PayU via API
echo "Payment Status: " . htmlspecialchars($status) . "<br>";
echo "Transaction ID: " . htmlspecialchars($txnid) . "<br>";

require_once 'verify-payment.php';
$verify_result = verifyPayment($txnid, $merchantKey, $salt);

$response_json = json_encode($verify_result, JSON_UNESCAPED_UNICODE);



$stmt = $conn->prepare("INSERT INTO payment_logs (customerID, leadID, txnid, mihpayid, apistatus, response, status, amount) VALUES (?, ?, ?, ?, ?, ?, 'success', ?)");
$stmt->bind_param("ssssdss", $customerID, $leadID, $txnid, $mihpayid, $verify_result['status'], $response_json, $amount);
$stmt->execute();
$stmt->close();

if ($verify_result['status'] == 1) {
    // get the status from transaction details

    $details = $verify_result['transaction_details'][$txnid];
    echo "Verified Status: " . htmlspecialchars($details['status']) . "<br>";
    $stmt = $conn->prepare("UPDATE payment_logs SET is_verified = 1 WHERE txnid = ?");
    $stmt->bind_param("s", $txnid);
    $stmt->execute();
    $stmt->close();


?>
    <form action="refund.php" method="post" name="payu_form">
        <input type="hidden" name="key" value="<?php echo $merchantKey; ?>" />
        <input type="hidden" name="txnid" value="<?php echo $txnid; ?>" />
        <input type="hidden" name="amount" value="<?php echo $amount; ?>" />
        <input type="hidden" name="productinfo" value="<?php echo $productinfo; ?>" />


        <input type="hidden" name="mihpayid" value="<?php echo $mihpayid; ?>" />

        <input type="submit" value="Refund Payment" />
    </form>

<?php
    // do DB updates, etc.
} else {
    echo "Could not verify payment.";
}
