<?php
// verify-payment.php

/**
 * Verifies a PayU transaction via API using txnid
 *
 * @param string $txnid
 * @param string $merchantKey
 * @param string $salt
 * @return array Response of verify_payment API
 */
function verifyPayment($txnid, $merchantKey, $salt)
{
    $command = "verify_payment";
    $url = "https://test.payu.in/merchant/postservice.php?form=2";

    // Generate hash for verify API
    $hashString = $merchantKey . '|' . $command . '|' . $txnid . '|' . $salt;
    $verify_hash = strtolower(hash('sha512', $hashString));

    $post_data = [
        'key' => $merchantKey,
        'command' => $command,
        'var1' => $txnid,
        'hash' => $verify_hash
    ];

    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($post_data));
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

    $response = curl_exec($ch);

    if ($response === false) {
        return [
            'status' => 0,
            'msg' => 'cURL error: ' . curl_error($ch)
        ];
    }
    // $stmt = $conn->prepare("UPDATE transactions SET status = 'success', payu_response = ? WHERE txnid = ?");
    // $resp = json_encode($_POST);
    // $stmt->bind_param("ss", $resp, $txnid);
    // $stmt->execute();
    // $stmt->close();

    curl_close($ch);

    $json = json_decode($response, true);
    return $json;
}
