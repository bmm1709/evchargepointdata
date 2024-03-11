-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 11, 2024 at 12:04 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cpms_db_v1`
--

-- --------------------------------------------------------

--
-- Table structure for table `chargepoint_maintenance_logs`
--

CREATE TABLE `chargepoint_maintenance_logs` (
  `maintenance_id` int(11) NOT NULL,
  `station_id` int(11) NOT NULL,
  `log_date` date NOT NULL,
  `description` longtext NOT NULL,
  `charging_stations_charging_station_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chargepoint_maintenance_logs`
--

INSERT INTO `chargepoint_maintenance_logs` (`maintenance_id`, `station_id`, `log_date`, `description`, `charging_stations_charging_station_id`) VALUES
(1, 1, '2023-01-15', 'Performed routine maintenance check on charging cables and connectors.', 1),
(2, 1, '2023-02-20', 'Replaced faulty power supply unit.', 1),
(3, 1, '2023-03-10', 'Updated firmware for charging control system.', 1),
(4, 2, '2023-02-05', 'Cleaned and inspected charging ports for debris and damage.', 2),
(5, 2, '2023-03-25', 'Adjusted power output settings for optimal charging performance.', 2),
(6, 3, '2023-01-10', 'Repaired broken display screen on the charging station.', 3),
(7, 3, '2023-03-18', 'Replaced damaged charging cable.', 3),
(8, 3, '2023-04-30', 'Performed software update to address connectivity issues.', 3),
(9, 4, '2024-02-20', 'Updated security protocols for charging station software.', 4);

-- --------------------------------------------------------

--
-- Stand-in structure for view `chargingstation_session_view`
-- (See below for the actual view)
--
CREATE TABLE `chargingstation_session_view` (
`charging_station_id` int(11)
,`charging_station_name` varchar(255)
,`charging_station_location` varchar(255)
,`number_of_ports` int(11)
,`operator_id` int(11)
,`port_type_id` int(11)
,`port_type_name` varchar(255)
,`power_capacity` varchar(20)
,`port_status` varchar(20)
,`cs_session_id` int(11)
,`user_id` int(11)
,`start_time` datetime
,`end_time` datetime
,`kwperhr_delivered` int(11)
,`payment_status` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `charging_session_info_view`
-- (See below for the actual view)
--
CREATE TABLE `charging_session_info_view` (
`cs_session_id` int(11)
,`cs_station_id` int(11)
,`username` varchar(255)
,`start_time` datetime
,`end_time` datetime
,`kwperhr_delivered` int(11)
,`payment_status` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `charging_stations`
--

CREATE TABLE `charging_stations` (
  `charging_station_id` int(11) NOT NULL,
  `charging_station_name` varchar(255) NOT NULL,
  `charging_station_location` varchar(255) NOT NULL,
  `number_of_ports` int(11) NOT NULL,
  `operator_id` int(11) NOT NULL,
  `port_type_id` int(11) NOT NULL,
  `port_type_name` varchar(255) NOT NULL,
  `power_capacity` varchar(20) NOT NULL,
  `port_status` varchar(20) NOT NULL,
  `transactions_transaction_id` int(11) NOT NULL,
  `session_pricing_session_price_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `charging_stations`
--

INSERT INTO `charging_stations` (`charging_station_id`, `charging_station_name`, `charging_station_location`, `number_of_ports`, `operator_id`, `port_type_id`, `port_type_name`, `power_capacity`, `port_status`, `transactions_transaction_id`, `session_pricing_session_price_id`) VALUES
(1, 'Station A', 'Location A', 4, 1, 1, 'Type A', '200 kW', 'Available', 101, 201),
(3, 'Station C', 'Location C', 8, 3, 1, 'Type A', '200 kW', 'Available', 103, 203),
(4, 'Station D', 'Location D', 5, 2, 3, 'Type C', '120 kW', 'Available', 104, 204),
(5, 'Station E', 'Location E', 10, 1, 2, 'Type B', '250 kW', 'In use', 105, 205),
(6, 'Station F', 'Location F', 8, 1, 1, 'Type A', '150 kW', 'Available', 106, 206),
(7, 'Station G', 'Location G', 6, 2, 2, 'Type B', '200 kW', 'In use', 107, 207),
(8, 'Station H', 'Location H', 10, 3, 1, 'Type A', '250 kW', 'Available', 108, 208),
(9, 'Station I', 'Location I', 5, 2, 3, 'Type C', '120 kW', 'Available', 109, 209),
(11, 'Station K', 'Location K', 8, 1, 1, 'Type A', '150 kW', 'Available', 111, 211),
(12, 'Station L', 'Location L', 6, 2, 2, 'Type B', '200 kW', 'In use', 112, 212),
(13, 'Station M', 'Location M', 10, 3, 1, 'Type A', '250 kW', 'Available', 113, 213),
(14, 'Station N', 'Location N', 5, 2, 3, 'Type C', '120 kW', 'Available', 114, 214),
(15, 'Station O', 'Location O', 12, 1, 2, 'Type B', '300 kW', 'In use', 115, 215),
(16, 'Station P', 'Location P', 8, 1, 1, 'Type A', '150 kW', 'Available', 116, 216),
(17, 'Station Q', 'Location Q', 6, 2, 2, 'Type B', '200 kW', 'In use', 117, 217),
(18, 'Station R', 'Location R', 10, 3, 1, 'Type A', '250 kW', 'Available', 118, 218),
(19, 'Station S', 'Location S', 5, 2, 3, 'Type C', '120 kW', 'Available', 119, 219),
(20, 'Station T', 'Location T', 12, 1, 2, 'Type B', '300 kW', 'In use', 120, 220),
(21, 'Station U', 'Location U', 8, 1, 1, 'Type A', '150 kW', 'Available', 121, 221),
(27, 'Station AA', 'Location AA', 6, 2, 2, 'Type B', '200 kW', 'In use', 127, 227),
(28, 'Station BB', 'Location BB', 10, 3, 1, 'Type A', '250 kW', 'Available', 128, 228),
(29, 'Station CC', 'Location CC', 5, 2, 3, 'Type C', '120 kW', 'Available', 129, 229),
(30, 'Station DD', 'Location DD', 12, 1, 2, 'Type B', '300 kW', 'In use', 130, 230);

--
-- Triggers `charging_stations`
--
DELIMITER $$
CREATE TRIGGER `counting_chargingstations` AFTER INSERT ON `charging_stations` FOR EACH ROW BEGIN
    -- Update the count_charging_station table by incrementing the total_count by 1
    UPDATE count_charging_station
    SET total_count = total_count + 1;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `new_charging_station_added` AFTER INSERT ON `charging_stations` FOR EACH ROW BEGIN
    -- Update the count_charging_station table by incrementing the total_count by 1
    UPDATE count_charging_station
    SET total_count = total_count + 1;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `charging_station_maintenance_view`
-- (See below for the actual view)
--
CREATE TABLE `charging_station_maintenance_view` (
`maintenance_id` int(11)
,`station_id` int(11)
,`charging_station_name` varchar(255)
,`log_date` date
,`description` longtext
);

-- --------------------------------------------------------

--
-- Table structure for table `charging_station_sessions`
--

CREATE TABLE `charging_station_sessions` (
  `cs_session_id` int(11) NOT NULL,
  `cs_station_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `kwperhr_delivered` int(11) NOT NULL,
  `payment_status` varchar(50) NOT NULL,
  `session_status` int(11) NOT NULL,
  `users_user_id` int(11) NOT NULL,
  `charging_stations_charging_station_id` int(11) NOT NULL,
  `timestamp_column` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `charging_station_sessions`
--

INSERT INTO `charging_station_sessions` (`cs_session_id`, `cs_station_id`, `user_id`, `start_time`, `end_time`, `kwperhr_delivered`, `payment_status`, `session_status`, `users_user_id`, `charging_stations_charging_station_id`, `timestamp_column`) VALUES
(1, 101, 201, '2024-02-05 08:00:00', '2024-02-05 09:30:00', 50, 'paid', 1, 201, 101, '2024-03-10 17:54:49'),
(2, 102, 202, '2024-02-05 10:00:00', '2024-02-05 11:30:00', 60, 'pending', 1, 202, 102, '2024-03-10 17:54:49'),
(3, 103, 203, '2024-02-05 12:00:00', '2024-02-05 13:30:00', 70, 'paid', 1, 203, 103, '2024-03-10 17:54:49'),
(4, 104, 204, '2024-02-05 14:00:00', '2024-02-05 15:30:00', 80, 'paid', 1, 204, 104, '2024-03-10 17:54:49'),
(5, 105, 205, '2024-02-05 16:00:00', '2024-02-05 17:30:00', 90, 'pending', 1, 205, 105, '2024-03-10 17:54:49'),
(6, 106, 206, '2024-03-01 09:00:00', '2024-03-01 10:30:00', 55, 'paid', 1, 206, 106, '2024-03-10 17:54:49');

--
-- Triggers `charging_station_sessions`
--
DELIMITER $$
CREATE TRIGGER `new_charging_session_trigger` AFTER INSERT ON `charging_station_sessions` FOR EACH ROW BEGIN
    -- Your trigger action here
    -- For example, you can log the new session in another table
    INSERT INTO session_log (cs_session_id, cs_station_id, user_id, session_start_time)
    VALUES (NEW.cs_session_id, NEW.cs_station_id, NEW.user_id, NEW.start_time);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_session_count_trigger_after_insert` AFTER INSERT ON `charging_station_sessions` FOR EACH ROW BEGIN
    UPDATE charging_stations
    SET session_count = session_count + 1
    WHERE charging_station_id = NEW.cs_station_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_session_logs_trigger` AFTER INSERT ON `charging_station_sessions` FOR EACH ROW BEGIN
    INSERT INTO session_logs (cs_session_id, cs_station_id, user_id, session_start_time)
    VALUES (NEW.cs_session_id, NEW.cs_station_id, NEW.user_id, NEW.start_time);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_session_logs_trigger_new` AFTER INSERT ON `charging_station_sessions` FOR EACH ROW BEGIN
    INSERT INTO session_logs (cs_session_id, cs_station_id, user_id, session_start_time)
    VALUES (NEW.cs_session_id, NEW.cs_station_id, NEW.user_id, NEW.start_time);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `count_charging_station`
--

CREATE TABLE `count_charging_station` (
  `total_count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `count_charging_station`
--

INSERT INTO `count_charging_station` (`total_count`) VALUES
(21);

-- --------------------------------------------------------

--
-- Table structure for table `fault_reports`
--

CREATE TABLE `fault_reports` (
  `report_id` int(11) NOT NULL,
  `station_id` int(11) NOT NULL,
  `reported_by_user` int(11) NOT NULL,
  `report_description` longtext NOT NULL,
  `report_time` datetime NOT NULL,
  `resolved_status` tinyint(1) NOT NULL,
  `charging_stations_charging_station_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fault_reports`
--

INSERT INTO `fault_reports` (`report_id`, `station_id`, `reported_by_user`, `report_description`, `report_time`, `resolved_status`, `charging_stations_charging_station_id`) VALUES
(2, 102, 202, 'Station 102 has power supply issues.', '2024-02-02 10:15:00', 0, 2),
(3, 103, 203, 'Port 3 of Station 103 is not charging properly.', '2024-02-03 12:45:00', 0, 3),
(4, 104, 204, 'Station 104 is not responding to commands.', '2024-02-04 14:20:00', 0, 4),
(5, 105, 205, 'Port 1 of Station 105 has a loose connector.', '2024-02-05 16:00:00', 0, 5);

-- --------------------------------------------------------

--
-- Stand-in structure for view `fault_reports_view`
-- (See below for the actual view)
--
CREATE TABLE `fault_reports_view` (
`report_id` int(11)
,`station_id` int(11)
,`report_description` longtext
,`report_time` datetime
,`charging_station_name` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `maintenance_log_view`
-- (See below for the actual view)
--
CREATE TABLE `maintenance_log_view` (
`maintenance_id` int(11)
,`station_id` int(11)
,`log_date` date
,`description` longtext
,`charging_station_name` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notifications_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  `timestamp` datetime NOT NULL,
  `users_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notifications_id`, `user_id`, `message`, `timestamp`, `users_user_id`) VALUES
(1, 1, 'Your account has been upgraded to premium.', '2024-02-05 08:30:00', 1),
(2, 2, 'New product updates available. Check them out!', '2024-02-05 09:15:00', 2),
(3, 3, 'Reminder: Your subscription will expire soon.', '2024-02-05 10:00:00', 3),
(4, 4, 'Congratulations! You have earned a reward.', '2024-02-05 11:45:00', 4),
(5, 5, 'System maintenance scheduled for tomorrow.', '2024-02-05 13:20:00', 5);

-- --------------------------------------------------------

--
-- Table structure for table `operators`
--

CREATE TABLE `operators` (
  `operator_id` int(11) NOT NULL,
  `operator_name` varchar(255) NOT NULL,
  `operator_description` longtext NOT NULL,
  `charging_stations_charging_station_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `operators`
--

INSERT INTO `operators` (`operator_id`, `operator_name`, `operator_description`, `charging_stations_charging_station_id`) VALUES
(1, 'ChargeCorp', 'ChargeCorp operates charging stations across the country.', 101),
(2, 'PowerCharge', 'PowerCharge specializes in high-speed charging solutions.', 102),
(3, 'EcoCharging', 'EcoCharging focuses on renewable energy-powered charging stations.', 103),
(4, 'GreenCharge', 'GreenCharge is known for its environmentally friendly charging infrastructure.', 104),
(5, 'ElectroCharge', 'ElectroCharge provides charging solutions for electric vehicles of all types.', 105);

-- --------------------------------------------------------

--
-- Table structure for table `session_log`
--

CREATE TABLE `session_log` (
  `cs_session_id` int(11) NOT NULL,
  `cs_station_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `session_start_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `session_pricing`
--

CREATE TABLE `session_pricing` (
  `session_price_id` int(11) NOT NULL,
  `station_id` int(11) NOT NULL,
  `port_type_id` int(11) NOT NULL,
  `price_per_kWh` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `session_pricing`
--

INSERT INTO `session_pricing` (`session_price_id`, `station_id`, `port_type_id`, `price_per_kWh`) VALUES
(1, 1, 1, 0.25),
(2, 2, 2, 0.28),
(3, 3, 3, 0.20),
(4, 4, 1, 0.25),
(5, 5, 2, 0.28);

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `subscription_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subscription_type` varchar(50) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `users_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`subscription_id`, `user_id`, `subscription_type`, `start_date`, `end_date`, `users_user_id`) VALUES
(1, 1, 'Basic', '2023-01-01 00:00:00', '2026-12-31 23:59:59', 101),
(2, 2, 'Premium', '2022-11-15 00:00:00', '2023-11-14 23:59:59', 102),
(3, 3, 'Standard', '2023-03-20 00:00:00', '2024-03-19 23:59:59', 103),
(4, 4, 'Basic', '2022-12-10 00:00:00', '2023-12-09 23:59:59', 104),
(5, 5, 'Premium', '2023-02-28 00:00:00', '2024-02-27 23:59:59', 105);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `transaction_amount` int(11) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transaction_id`, `session_id`, `transaction_amount`, `payment_method`, `timestamp`) VALUES
(1, 1, 25, 'Credit Card', '2023-12-19 09:30:00'),
(2, 2, 30, 'PayPal', '2023-12-19 11:30:00'),
(3, 3, 20, 'Debit Card', '2023-12-19 13:30:00'),
(4, 4, 35, 'PayPal', '2023-12-19 15:30:00'),
(5, 5, 40, 'Credit Card', '2023-12-19 17:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `membership_type` varchar(50) NOT NULL,
  `evtype` varchar(50) NOT NULL,
  `connector_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `phone`, `address`, `membership_type`, `evtype`, `connector_type`) VALUES
(1, 'johndoe', 'johndoe@example.com', '1234567890', '123 Main St', 'Gold', 'full', 'Type 2'),
(2, 'alicealice', 'alice@example.com', '9876543210', '456 Elm St', 'Silver', 'hybrid', 'CHAdeMO'),
(3, 'bobsmith', 'bob@example.com', '5551234567', '789 Oak St', 'Platinum', 'full', 'CCS Combo'),
(4, 'emilyevans', 'emily@example.com', '4567891230', '321 Pine St', 'Gold', 'full', 'Type 2'),
(5, 'davidgreen', 'david@example.com', '3216549870', '987 Cedar St', 'Silver', 'hybrid', 'Type 2');

-- --------------------------------------------------------

--
-- Stand-in structure for view `user_session_view`
-- (See below for the actual view)
--
CREATE TABLE `user_session_view` (
`user_id` int(11)
,`username` varchar(255)
,`email` varchar(255)
,`phone` varchar(20)
,`address` varchar(255)
,`cs_session_id` int(11)
,`start_time` datetime
,`end_time` datetime
,`kwperhr_delivered` int(11)
,`payment_status` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `user_subscription_view`
-- (See below for the actual view)
--
CREATE TABLE `user_subscription_view` (
`user_id` int(11)
,`username` varchar(255)
,`email` varchar(255)
,`phone` varchar(20)
,`address` varchar(255)
,`membership_type` varchar(50)
,`evtype` varchar(50)
,`connector_type` varchar(50)
,`subscription_id` int(11)
,`subscription_type` varchar(50)
,`start_date` datetime
,`end_date` datetime
);

-- --------------------------------------------------------

--
-- Structure for view `chargingstation_session_view`
--
DROP TABLE IF EXISTS `chargingstation_session_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `chargingstation_session_view`  AS SELECT `cs`.`charging_station_id` AS `charging_station_id`, `cs`.`charging_station_name` AS `charging_station_name`, `cs`.`charging_station_location` AS `charging_station_location`, `cs`.`number_of_ports` AS `number_of_ports`, `cs`.`operator_id` AS `operator_id`, `cs`.`port_type_id` AS `port_type_id`, `cs`.`port_type_name` AS `port_type_name`, `cs`.`power_capacity` AS `power_capacity`, `cs`.`port_status` AS `port_status`, `css`.`cs_session_id` AS `cs_session_id`, `css`.`user_id` AS `user_id`, `css`.`start_time` AS `start_time`, `css`.`end_time` AS `end_time`, `css`.`kwperhr_delivered` AS `kwperhr_delivered`, `css`.`payment_status` AS `payment_status` FROM (`charging_stations` `cs` join `charging_station_sessions` `css` on(`cs`.`charging_station_id` = `css`.`cs_station_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `charging_session_info_view`
--
DROP TABLE IF EXISTS `charging_session_info_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `charging_session_info_view`  AS SELECT `css`.`cs_session_id` AS `cs_session_id`, `css`.`cs_station_id` AS `cs_station_id`, `u`.`username` AS `username`, `css`.`start_time` AS `start_time`, `css`.`end_time` AS `end_time`, `css`.`kwperhr_delivered` AS `kwperhr_delivered`, `css`.`payment_status` AS `payment_status` FROM (`charging_station_sessions` `css` join `users` `u` on(`css`.`user_id` = `u`.`user_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `charging_station_maintenance_view`
--
DROP TABLE IF EXISTS `charging_station_maintenance_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `charging_station_maintenance_view`  AS SELECT `csm`.`maintenance_id` AS `maintenance_id`, `csm`.`station_id` AS `station_id`, `cs`.`charging_station_name` AS `charging_station_name`, `csm`.`log_date` AS `log_date`, `csm`.`description` AS `description` FROM (`chargepoint_maintenance_logs` `csm` join `charging_stations` `cs` on(`csm`.`station_id` = `cs`.`charging_station_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `fault_reports_view`
--
DROP TABLE IF EXISTS `fault_reports_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `fault_reports_view`  AS SELECT `fr`.`report_id` AS `report_id`, `fr`.`station_id` AS `station_id`, `fr`.`report_description` AS `report_description`, `fr`.`report_time` AS `report_time`, `cs`.`charging_station_name` AS `charging_station_name` FROM (`fault_reports` `fr` join `charging_stations` `cs` on(`fr`.`station_id` = `cs`.`charging_station_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `maintenance_log_view`
--
DROP TABLE IF EXISTS `maintenance_log_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `maintenance_log_view`  AS SELECT `m`.`maintenance_id` AS `maintenance_id`, `m`.`station_id` AS `station_id`, `m`.`log_date` AS `log_date`, `m`.`description` AS `description`, `c`.`charging_station_name` AS `charging_station_name` FROM (`chargepoint_maintenance_logs` `m` join `charging_stations` `c` on(`m`.`station_id` = `c`.`charging_station_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `user_session_view`
--
DROP TABLE IF EXISTS `user_session_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `user_session_view`  AS SELECT `u`.`user_id` AS `user_id`, `u`.`username` AS `username`, `u`.`email` AS `email`, `u`.`phone` AS `phone`, `u`.`address` AS `address`, `s`.`cs_session_id` AS `cs_session_id`, `s`.`start_time` AS `start_time`, `s`.`end_time` AS `end_time`, `s`.`kwperhr_delivered` AS `kwperhr_delivered`, `s`.`payment_status` AS `payment_status` FROM (`users` `u` join `charging_station_sessions` `s` on(`u`.`user_id` = `s`.`user_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `user_subscription_view`
--
DROP TABLE IF EXISTS `user_subscription_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `user_subscription_view`  AS SELECT `u`.`user_id` AS `user_id`, `u`.`username` AS `username`, `u`.`email` AS `email`, `u`.`phone` AS `phone`, `u`.`address` AS `address`, `u`.`membership_type` AS `membership_type`, `u`.`evtype` AS `evtype`, `u`.`connector_type` AS `connector_type`, `s`.`subscription_id` AS `subscription_id`, `s`.`subscription_type` AS `subscription_type`, `s`.`start_date` AS `start_date`, `s`.`end_date` AS `end_date` FROM (`users` `u` join `subscriptions` `s` on(`u`.`user_id` = `s`.`user_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chargepoint_maintenance_logs`
--
ALTER TABLE `chargepoint_maintenance_logs`
  ADD PRIMARY KEY (`maintenance_id`),
  ADD KEY `chargepoint_maintenance_logs_charging_stations` (`charging_stations_charging_station_id`),
  ADD KEY `idx_log_date` (`log_date`);

--
-- Indexes for table `charging_stations`
--
ALTER TABLE `charging_stations`
  ADD PRIMARY KEY (`charging_station_id`),
  ADD KEY `charging_stations_session_pricing` (`session_pricing_session_price_id`),
  ADD KEY `charging_stations_transactions` (`transactions_transaction_id`);

--
-- Indexes for table `charging_station_sessions`
--
ALTER TABLE `charging_station_sessions`
  ADD PRIMARY KEY (`cs_session_id`),
  ADD KEY `charging_station_sessions_users` (`users_user_id`),
  ADD KEY `idx_charging_station_id` (`charging_stations_charging_station_id`),
  ADD KEY `idx_session_time` (`start_time`,`end_time`);

--
-- Indexes for table `fault_reports`
--
ALTER TABLE `fault_reports`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `fault_reports_charging_stations` (`charging_stations_charging_station_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notifications_id`),
  ADD KEY `users_notifications` (`users_user_id`);

--
-- Indexes for table `operators`
--
ALTER TABLE `operators`
  ADD PRIMARY KEY (`operator_id`),
  ADD KEY `operators_charging_stations` (`charging_stations_charging_station_id`);

--
-- Indexes for table `session_log`
--
ALTER TABLE `session_log`
  ADD PRIMARY KEY (`cs_session_id`);

--
-- Indexes for table `session_pricing`
--
ALTER TABLE `session_pricing`
  ADD PRIMARY KEY (`session_price_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`subscription_id`),
  ADD KEY `subscriptions_users` (`users_user_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chargepoint_maintenance_logs`
--
ALTER TABLE `chargepoint_maintenance_logs`
  ADD CONSTRAINT `chargepoint_maintenance_logs_charging_stations` FOREIGN KEY (`charging_stations_charging_station_id`) REFERENCES `charging_stations` (`charging_station_id`);

--
-- Constraints for table `charging_stations`
--
ALTER TABLE `charging_stations`
  ADD CONSTRAINT `charging_stations_session_pricing` FOREIGN KEY (`session_pricing_session_price_id`) REFERENCES `session_pricing` (`session_price_id`),
  ADD CONSTRAINT `charging_stations_transactions` FOREIGN KEY (`transactions_transaction_id`) REFERENCES `transactions` (`transaction_id`);

--
-- Constraints for table `charging_station_sessions`
--
ALTER TABLE `charging_station_sessions`
  ADD CONSTRAINT `charging_station_sessions_charging_stations` FOREIGN KEY (`charging_stations_charging_station_id`) REFERENCES `charging_stations` (`charging_station_id`),
  ADD CONSTRAINT `charging_station_sessions_users` FOREIGN KEY (`users_user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `fault_reports`
--
ALTER TABLE `fault_reports`
  ADD CONSTRAINT `fault_reports_charging_stations` FOREIGN KEY (`charging_stations_charging_station_id`) REFERENCES `charging_stations` (`charging_station_id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `users_notifications` FOREIGN KEY (`users_user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `operators`
--
ALTER TABLE `operators`
  ADD CONSTRAINT `operators_charging_stations` FOREIGN KEY (`charging_stations_charging_station_id`) REFERENCES `charging_stations` (`charging_station_id`);

--
-- Constraints for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `subscriptions_users` FOREIGN KEY (`users_user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
