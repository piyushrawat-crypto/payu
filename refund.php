<?php
// ======= PayU Refund Script =======
include 'db.php';
// Replace with your credentials
$merchantKey = "p55pXD";
$salt = "Ufw2TWA4JmbOpbFbrcWJadJY1KJieKZx";

// ======= Get Required Parameters from Request =======
$mihpayid = $_POST['mihpayid'] ?? '';  // ✅ MUST use PayU's transaction ID
$txnid = $_POST['txnid'] ?? '';  // ✅ MUST use PayU's transaction ID
$refundAmount = $_POST['amount'] ?? '1.00';
$refundReason = $_POST['reason'] ?? 'Customer Request';
$refundToken = uniqid('refund_', true); // Must be unique for each refund
$customerID = '2345';
$leadID = '1234';


// ======= Prepare Refund API Parameters =======
$command = "cancel_refund_transaction";
$hashString = "$merchantKey|$command|$mihpayid|$salt";
$hash = strtolower(hash('sha512', $hashString));


$postData = [
    "key"     => $merchantKey,
    "command" => $command,
    "hash"    => $hash,
    "var1"    => $mihpayid,       // ✅ Correct now
    "var2"    => $refundToken,    // ✅ Token ID — must be unique
    "var3"    => $refundAmount,   // ✅ Refund Amount
    // "var5" => $refundWebhook,  // Optional
];


// ======= Send CURL Request to PayU =======
$url = "https://test.payu.in/merchant/postservice?form=2";

$ch = curl_init($url);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($postData));
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, [
    "Content-Type: application/x-www-form-urlencoded",
    "accept: application/json"
]);

$response = curl_exec($ch);
curl_close($ch);

// ======= Show Response =======
echo "<h2>Refund API Response</h2>";


$responseData = json_decode($response, true);

$stmt = $conn->prepare("INSERT INTO refund_logs (customerID, leadID, txn_id, mihpayid, refund_amount, status, response, amount) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
$stmt->bind_param("ssssdiss", $customerID, $leadID, $txnid, $mihpayid, $refundAmount, $responseData['status'], $response, $refundAmount);
$stmt->execute();
$stmt->close();


if (isset($responseData['status']) && $responseData['status'] == 1) {
    echo "<h3>✅ Refund Request Sent Successfully</h3>";
    echo "Message: " . htmlspecialchars($responseData['msg']) . "<br>";
    echo "mihpayid: " . htmlspecialchars($mihpayid) . "<br>";
    echo "Amount Refunded: ₹" . htmlspecialchars($refundAmount) . "<br>";
} else {
    echo "<h3>❌ Refund Failed</h3>";
    echo "Error: " . htmlspecialchars($responseData['msg'] ?? 'Unknown error');
}

