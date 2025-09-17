<?php
// checkout.php
// include 'db.php';
// Merchant credentials
$merchantKey = "p55pXD";
$salt = "Ufw2TWA4JmbOpbFbrcWJadJY1KJieKZx";




// $sql = "SELECT * FROM customer WHERE id=?";
// $stmt = $conn->prepare($sql);
// $stmt->bind_param("i", $id);
// $stmt->execute();
// $result = $stmt->get_result();
// $data = $result->fetch_assoc();


// if(!$data){
//     die("Transaction not found!");
// }

// $txnid     = $data['id'];   // using primary id as txnid
// $amount    = $data['amount'];
// $product   = $data['product'];
// $firstname = $data['name'];
// $email     = $data['email'];
// $phone     = $data['phone'];


// Transaction details
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

// Build data array
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
    'udf1' => $udf1,
    'udf2' => $udf2,
    'udf3' => $udf3,
    'udf4' => $udf4,
    'udf5' => $udf5,
    'hash' => $hash
];
?>
<!DOCTYPE html>
<html>

<head>
    <title>PayU Checkout</title>
</head>

<body>
    <h2>Redirecting to PayU...</h2>
    <form action="https://test.payu.in/_payment" method="post" name="payu_form" id="payu_form">
        <?php foreach ($data as $key => $value): ?>
            <input type="hidden" name="<?php echo htmlspecialchars($key) ?>" value="<?php echo htmlspecialchars($value) ?>">
        <?php endforeach; ?>
        <input type="submit" value="Pay Now">
    </form>
    <script type="text/javascript">
        document.getElementById('payu_form').submit();
    </script>
</body>

</html>