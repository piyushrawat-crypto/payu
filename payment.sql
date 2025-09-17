-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 17, 2025 at 03:06 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `payment`
--

-- --------------------------------------------------------

--
-- Table structure for table `payment_logs`
--

CREATE TABLE `payment_logs` (
  `id` int(11) NOT NULL,
  `txnid` varchar(255) NOT NULL,
  `mihpayid` varchar(255) DEFAULT NULL,
  `apistatus` varchar(225) DEFAULT NULL,
  `customerID` varchar(255) DEFAULT NULL,
  `leadID` varchar(255) DEFAULT NULL,
  `response` longtext DEFAULT NULL,
  `status` varchar(225) NOT NULL,
  `is_verified` tinyint(2) NOT NULL DEFAULT 0,
  `amount` int(225) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_logs`
--

INSERT INTO `payment_logs` (`id`, `txnid`, `mihpayid`, `apistatus`, `customerID`, `leadID`, `response`, `status`, `is_verified`, `amount`, `created_at`) VALUES
(1, 'a3b34f79d0ad727b78f9', '403993715534826729', NULL, '2345', '1234', NULL, '', 0, 0, '2025-09-17 09:53:57'),
(2, '82207452e6e1134ed033', '403993715534826928', NULL, '2345', '1234', NULL, '', 0, 0, '2025-09-17 10:03:40'),
(3, '6c267c733c390dad1a63', '403993715534826988', '1', '2345', '1234', 'Array', '', 0, 0, '2025-09-17 10:06:44'),
(4, '6c267c733c390dad1a63', '403993715534826988', '1', '2345', '1234', '{\"status\":1,\"msg\":\"1 out of 1 Transactions Fetched Successfully\",\"transaction_details\":{\"6c267c733c390dad1a63\":{\"mihpayid\":\"403993715534826988\",\"request_id\":\"\",\"bank_ref_num\":\"688414734930801500\",\"amt\":\"10.00\",\"transaction_amount\":\"10.00\",\"txnid\":\"6c267c733c390dad1a63\",\"additional_charges\":\"0.00\",\"productinfo\":\"iPhone\",\"firstname\":\"Ashish\",\"bankcode\":\"CC\",\"udf1\":\"\",\"udf2\":\"\",\"udf3\":\"\",\"udf4\":\"\",\"udf5\":\"\",\"field2\":\"409174\",\"field9\":\"Transaction is Successful\",\"error_code\":\"E000\",\"addedon\":\"2025-09-17 15:35:54\",\"payment_source\":\"payu\",\"card_type\":\"MAST\",\"error_Message\":\"NO ERROR\",\"net_amount_debit\":10,\"disc\":\"0.00\",\"mode\":\"CC\",\"PG_TYPE\":\"CC-PG\",\"card_no\":\"XXXXXXXXXXXX2346\",\"status\":\"success\",\"unmappedstatus\":\"captured\",\"Merchant_UTR\":null,\"Settled_At\":\"0000-00-00 00:00:00\",\"name_on_card\":null,\"card_token\":null,\"offerAvailed\":null}}}', '', 0, 0, '2025-09-17 10:08:57'),
(5, '07052850bb2e0f169b81', '403993715534827278', '1', '2345', '1234', '{\"status\":1,\"msg\":\"1 out of 1 Transactions Fetched Successfully\",\"transaction_details\":{\"07052850bb2e0f169b81\":{\"mihpayid\":\"403993715534827278\",\"request_id\":\"\",\"bank_ref_num\":\"634791654562638800\",\"amt\":\"10.00\",\"transaction_amount\":\"10.00\",\"txnid\":\"07052850bb2e0f169b81\",\"additional_charges\":\"0.00\",\"productinfo\":\"iPhone\",\"firstname\":\"Ashish\",\"bankcode\":\"CC\",\"udf1\":\"\",\"udf2\":\"\",\"udf3\":\"\",\"udf4\":\"\",\"udf5\":\"\",\"field2\":\"283281\",\"field9\":\"Transaction is Successful\",\"error_code\":\"E000\",\"addedon\":\"2025-09-17 15:50:40\",\"payment_source\":\"payu\",\"card_type\":\"MAST\",\"error_Message\":\"NO ERROR\",\"net_amount_debit\":10,\"disc\":\"0.00\",\"mode\":\"CC\",\"PG_TYPE\":\"CC-PG\",\"card_no\":\"XXXXXXXXXXXX2346\",\"status\":\"success\",\"unmappedstatus\":\"captured\",\"Merchant_UTR\":null,\"Settled_At\":\"0000-00-00 00:00:00\",\"name_on_card\":null,\"card_token\":null,\"offerAvailed\":null}}}', 'success', 0, 0, '2025-09-17 10:21:10'),
(6, '07052850bb2e0f169b81', '403993715534827278', '1', '2345', '1234', '{\"status\":1,\"msg\":\"1 out of 1 Transactions Fetched Successfully\",\"transaction_details\":{\"07052850bb2e0f169b81\":{\"mihpayid\":\"403993715534827278\",\"request_id\":\"\",\"bank_ref_num\":\"634791654562638800\",\"amt\":\"10.00\",\"transaction_amount\":\"10.00\",\"txnid\":\"07052850bb2e0f169b81\",\"additional_charges\":\"0.00\",\"productinfo\":\"iPhone\",\"firstname\":\"Ashish\",\"bankcode\":\"CC\",\"udf1\":\"\",\"udf2\":\"\",\"udf3\":\"\",\"udf4\":\"\",\"udf5\":\"\",\"field2\":\"283281\",\"field9\":\"Transaction is Successful\",\"error_code\":\"E000\",\"addedon\":\"2025-09-17 15:50:40\",\"payment_source\":\"payu\",\"card_type\":\"MAST\",\"error_Message\":\"NO ERROR\",\"net_amount_debit\":10,\"disc\":\"0.00\",\"mode\":\"CC\",\"PG_TYPE\":\"CC-PG\",\"card_no\":\"XXXXXXXXXXXX2346\",\"status\":\"success\",\"unmappedstatus\":\"captured\",\"Merchant_UTR\":null,\"Settled_At\":\"0000-00-00 00:00:00\",\"name_on_card\":null,\"card_token\":null,\"offerAvailed\":null}}}', 'success', 0, 0, '2025-09-17 10:21:36'),
(7, '0c542e127919ce72e44a', NULL, '1', '2345', '1234', '{\"status\":1,\"msg\":\"1 out of 1 Transactions Fetched Successfully\",\"transaction_details\":{\"0c542e127919ce72e44a\":{\"mihpayid\":\"403993715534827299\",\"request_id\":null,\"bank_ref_num\":null,\"amt\":\"10.00\",\"transaction_amount\":\"10.00\",\"txnid\":\"0c542e127919ce72e44a\",\"additional_charges\":\"0.00\",\"productinfo\":\"iPhone\",\"firstname\":\"Ashish\",\"bankcode\":\"CC\",\"udf1\":\"\",\"udf2\":\"\",\"udf3\":\"\",\"udf4\":\"\",\"udf5\":\"\",\"field2\":null,\"field9\":\"Technical Failure\",\"error_code\":\"E501\",\"addedon\":\"2025-09-17 15:51:42\",\"payment_source\":\"payu\",\"card_type\":\"MAST\",\"error_Message\":\"Bank was unable to authenticate.\",\"net_amount_debit\":\"0.00\",\"disc\":\"0.00\",\"mode\":\"CC\",\"PG_TYPE\":\"CC-PG\",\"card_no\":\"XXXXXXXXXXXX2346\",\"status\":\"failure\",\"unmappedstatus\":\"failed\",\"Merchant_UTR\":null,\"Settled_At\":null,\"name_on_card\":null,\"card_token\":null,\"offerAvailed\":null}}}', 'failure', 0, 0, '2025-09-17 10:22:13'),
(8, '9b1963412f50b67423e7', '403993715534828898', '1', '2345', '1234', '{\"status\":1,\"msg\":\"1 out of 1 Transactions Fetched Successfully\",\"transaction_details\":{\"9b1963412f50b67423e7\":{\"mihpayid\":\"403993715534828898\",\"request_id\":\"\",\"bank_ref_num\":\"751658319327153300\",\"amt\":\"10.00\",\"transaction_amount\":\"10.00\",\"txnid\":\"9b1963412f50b67423e7\",\"additional_charges\":\"0.00\",\"productinfo\":\"iPhone\",\"firstname\":\"Ashish\",\"bankcode\":\"CC\",\"udf1\":\"\",\"udf2\":\"\",\"udf3\":\"\",\"udf4\":\"\",\"udf5\":\"\",\"field2\":\"236699\",\"field9\":\"Transaction is Successful\",\"error_code\":\"E000\",\"addedon\":\"2025-09-17 17:18:13\",\"payment_source\":\"payu\",\"card_type\":\"MAST\",\"error_Message\":\"NO ERROR\",\"net_amount_debit\":10,\"disc\":\"0.00\",\"mode\":\"CC\",\"PG_TYPE\":\"CC-PG\",\"card_no\":\"XXXXXXXXXXXX2346\",\"status\":\"success\",\"unmappedstatus\":\"captured\",\"Merchant_UTR\":null,\"Settled_At\":\"0000-00-00 00:00:00\",\"name_on_card\":null,\"card_token\":null,\"offerAvailed\":null}}}', 'success', 1, 0, '2025-09-17 11:58:11'),
(9, 'fa43af8fcc3968081703', '403993715534829148', '1', '2345', '1234', '{\"status\":1,\"msg\":\"1 out of 1 Transactions Fetched Successfully\",\"transaction_details\":{\"fa43af8fcc3968081703\":{\"mihpayid\":\"403993715534829148\",\"request_id\":\"\",\"bank_ref_num\":\"715212816861985400\",\"amt\":\"10.00\",\"transaction_amount\":\"10.00\",\"txnid\":\"fa43af8fcc3968081703\",\"additional_charges\":\"0.00\",\"productinfo\":\"iPhone\",\"firstname\":\"Ashish\",\"bankcode\":\"CC\",\"udf1\":\"\",\"udf2\":\"\",\"udf3\":\"\",\"udf4\":\"\",\"udf5\":\"\",\"field2\":\"186536\",\"field9\":\"Transaction is Successful\",\"error_code\":\"E000\",\"addedon\":\"2025-09-17 17:36:13\",\"payment_source\":\"payu\",\"card_type\":\"MAST\",\"error_Message\":\"NO ERROR\",\"net_amount_debit\":10,\"disc\":\"0.00\",\"mode\":\"CC\",\"PG_TYPE\":\"CC-PG\",\"card_no\":\"XXXXXXXXXXXX2346\",\"status\":\"success\",\"unmappedstatus\":\"captured\",\"Merchant_UTR\":null,\"Settled_At\":\"0000-00-00 00:00:00\",\"name_on_card\":null,\"card_token\":null,\"offerAvailed\":null}}}', 'success', 1, 10, '2025-09-17 12:06:55'),
(10, '899e845a8db31bc19df2', '403993715534829390', '1', '2345', '1234', '{\"status\":1,\"msg\":\"1 out of 1 Transactions Fetched Successfully\",\"transaction_details\":{\"899e845a8db31bc19df2\":{\"mihpayid\":\"403993715534829390\",\"request_id\":\"\",\"bank_ref_num\":\"169336915793491040\",\"amt\":\"10.00\",\"transaction_amount\":\"10.00\",\"txnid\":\"899e845a8db31bc19df2\",\"additional_charges\":\"0.00\",\"productinfo\":\"iPhone\",\"firstname\":\"Ashish\",\"bankcode\":\"CC\",\"udf1\":\"\",\"udf2\":\"\",\"udf3\":\"\",\"udf4\":\"\",\"udf5\":\"\",\"field2\":\"887705\",\"field9\":\"Transaction is Successful\",\"error_code\":\"E000\",\"addedon\":\"2025-09-17 17:52:06\",\"payment_source\":\"payu\",\"card_type\":\"MAST\",\"error_Message\":\"NO ERROR\",\"net_amount_debit\":10,\"disc\":\"0.00\",\"mode\":\"CC\",\"PG_TYPE\":\"CC-PG\",\"card_no\":\"XXXXXXXXXXXX2346\",\"status\":\"success\",\"unmappedstatus\":\"captured\",\"Merchant_UTR\":null,\"Settled_At\":\"0000-00-00 00:00:00\",\"name_on_card\":null,\"card_token\":null,\"offerAvailed\":null}}}', 'success', 1, 10, '2025-09-17 12:22:37');

-- --------------------------------------------------------

--
-- Table structure for table `refund_logs`
--

CREATE TABLE `refund_logs` (
  `id` int(11) NOT NULL,
  `customerID` varchar(225) NOT NULL,
  `leadID` varchar(225) NOT NULL,
  `txn_id` varchar(255) NOT NULL,
  `mihpayid` varchar(255) DEFAULT NULL,
  `refund_amount` decimal(10,2) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `response` longtext DEFAULT NULL,
  `amount` int(225) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `refund_logs`
--

INSERT INTO `refund_logs` (`id`, `customerID`, `leadID`, `txn_id`, `mihpayid`, `refund_amount`, `status`, `response`, `amount`, `created_at`) VALUES
(1, '2345', '1234', 'a3b34f79d0ad727b78f9', NULL, 10.00, 0, '{\"status\":0,\"msg\":\"Refund FAILURE - Two refunds of same amount for same transaction within 5 minutes are not allowed\",\"error_code\":214,\"mihpayid\":403993715534826729}', 0, '2025-09-17 09:59:21'),
(2, '2345', '1234', 'fa43af8fcc3968081703', NULL, 10.00, 0, '{\"status\":0,\"msg\":\"Refund FAILURE - Two refunds of same amount for same transaction within 5 minutes are not allowed\",\"error_code\":214,\"mihpayid\":403993715534829148}', 10, '2025-09-17 12:09:34'),
(3, '2345', '1234', '899e845a8db31bc19df2', NULL, 10.00, 1, '{\"status\":1,\"msg\":\"Refund Request Queued\",\"request_id\":\"138669726\",\"bank_ref_num\":null,\"mihpayid\":403993715534829390,\"error_code\":102}', 10, '2025-09-17 12:22:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `payment_logs`
--
ALTER TABLE `payment_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_logs`
--
ALTER TABLE `refund_logs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `payment_logs`
--
ALTER TABLE `payment_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `refund_logs`
--
ALTER TABLE `refund_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
