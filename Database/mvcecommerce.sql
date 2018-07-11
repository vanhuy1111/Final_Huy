-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2018 at 06:49 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mvcecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `image`) VALUES
(1, 'Apple', 'resources/images/imagesCategory/apple.png'),
(2, 'Samsung', 'resources/images/imagesCategory/samsung.jpg'),
(3, 'Oppo', 'resources/images/imagesCategory/oppo.png'),
(4, 'Nokia', 'resources/img/imagesCategory/nokiaphone.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `address` varchar(250) DEFAULT NULL,
  `customer_name` varchar(250) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `id_card` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `address`, `customer_name`, `email`, `phone`, `id_card`) VALUES
(1, '40 Nguyen Luong Bang, Da Nang', 'Duy Le', 'duyle@gmail.com', '0123456789', 173465325),
(2, 'Hue', 'Phan Van Huy', 'tsunamihuy@gmail.com', '01695357195', 123456789);

-- --------------------------------------------------------

--
-- Table structure for table `orderdetail`
--

CREATE TABLE `orderdetail` (
  `orderDetailId` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderdetail`
--

INSERT INTO `orderdetail` (`orderDetailId`, `quantity`, `orderId`, `product_id`) VALUES
(1, 1, NULL, 5),
(2, 1, 1, 5),
(3, 1, NULL, 1),
(4, 1, 2, 1),
(5, 1, 2, 1),
(6, 1, NULL, 14),
(7, 1, 3, 14);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderId` int(11) NOT NULL,
  `orderDate` date DEFAULT NULL,
  `customer_fk` int(11) DEFAULT NULL,
  `total_price` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderId`, `orderDate`, `customer_fk`, `total_price`) VALUES
(1, '2018-07-06', 1, 74),
(2, '2018-07-06', 2, 500),
(3, '2018-07-06', 2, 720);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `image` varchar(250) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `product_description` varchar(250) DEFAULT NULL,
  `product_detail` varchar(250) DEFAULT NULL,
  `product_name` varchar(250) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `image`, `price`, `product_description`, `product_detail`, `product_name`, `category_id`) VALUES
(1, 'iPhone-6-Plus-32GB.png', 500, 'Designed to be a benchmark, the new generation of iPhone 6 Plus has a sleeker look and adds a slew of advanced features to an incredibly rich user experience.', 'Display: 4.7\", Retina HD<br/>OS: iOS 11<br/>CPU: Apple A9 2 core<br/>RAM: 2 GB, ROM: 32 GB<br/>Camera: 12 MP, Selfie: 5 MP<br/>Battery: 1715 mAh<br/>SIM: 1 SIM', 'iPhone 6 Plus 32GB', 1),
(14, 'iPhone-7-Plus-32GB.png', 720, 'Designed to be a benchmark, the new generation of iPhone 7 Plus 32GB has a sleeker look and adds a slew of advanced features to an incredibly rich user experience.', 'Display: 1920 x 1080 pixels<br/>OS: iOS 11<br/>CPU: A10, 4 Nhân, 2.3 GHz<br/>RAM: 3 GB, ROM: 32 GB<br/>Camera: 12 MP, Selfie: 7 MP<br/>Battery: 11.1 Wh (2900 mAh)', 'iPhone 7 Plus 32GB', 1),
(2, 'Samsung-Galaxy-S9.png', 1525, 'Samsung Galaxy S9 brings you a completely new design with a super-thin Super Retina screen and features state-of-the-art technology such as Face ID Face Detection, Quick Charge and Wireless Charging, and advanced waterproofing.', 'Display: 6.2\", 2K (1440 x 2960 Pixels)\r\n<br/>OS: Android 8.0\r\n<br/>CPU: Exynos 9810 8 nhân 64 bit, 8 nhân, 4 nhân 2.8 GHz & 4 nhân 1.7 GHz\r\n<br/>RAM: 6 GB, ROM: 128 GB\r\n<br/>Camera: 2 camera 12 MP\r\n<br/>Selfie: 8MB\r\n<br/>Battery: 	3500 mAh', 'Samsung Galaxy S9', 2),
(3, 'iphone-x-64GB.png', 1314, '\"iPhone X price\" is a phrase many people are looking forward to know and search on Google because this is the phone that Apple celebrates the first 10 years of the iPhone sold.', 'Display: 5.8 \", Super Retina\r\n<br/>OS: iOS 11\r\n<br/>CPU: Apple A11 Bionic 6 core\r\n<br/>RAM: 3 GB, ROM: 64 GB\r\n<br/>Camera: 12 MP camera, Self: 7 MP\r\n<br/>Battery: 2716 mAh', 'iPhone X 64GB', 1),
(4, 'Samsung-Galaxy-note-S8.png', 394, 'Nokia 7 Plus is the first smartphone to mark HMD\'s first step into the world of 18: 9 screen.', 'Display: 6.3\", 2960 x 1440 pixels\r\n<br/>OS: Android 7.1.1\r\n<br/>CPU: 2.3GHz 64 bit, 8 Nhân, 4 nhân 2.3 GHz và 4 nhân 1.7 GHz\r\n<br/>RAM: 6 GB, ROM: 64 GB\r\n<br/>Camera: 2 camera 12 MP\r\n<br/>Selfie: 8MB\r\n<br/>Battery: 3300 mAh', 'Samsung Galaxy Note 8 Orchid Grey', 2),
(5, 'Samsung-Galaxy-S8-plus.png', 74, 'Will be unforgettable memories to those who have owned the \"one-time\" phones from Nokia. So the HMD brought the user a big surprise when revitalizing the Nokia 8810 phone called Samsung Galaxy S8 Plus and many new features.', 'Display: 2960 x 1440 pixels\r\n<br/>OS: Android 7.1.1\r\n<br/>CPU: Exynos 8895, 8 Nhân, 4 nhân 2.3 GHz và 4 nhân 1.7 GHz\r\n<br/>RAM: 6 GB, ROM: 64 GB\r\n<br/>Camera: 2 camera 12 MP\r\n<br/>Selfie: 8MB\r\n<br/>Battery: 3500 mAh', 'Samsung Galaxy S8 Plus', 2),
(6, 'Oppo-F7.png', 1130, 'Traditionally followed by the Oppo, Oppo will launch the Oppo F3, but this year\'s \"defective \" has made an exception when it comes to users of the Oppo F2 with not much change in appearance.', 'Display:6.23 inch, 1080 x 2280 pixels<br/>OS: Android 8.1<br/>CPU: Mediatek Helio P60, 8 nhân, 2.0 Ghz<br/>RAM: 6GB, ROM: 128GB<br/>Camera: 16 MP, Self: 25 MP<br/>Battery: 3400 mAh', 'OPPO F7', 3),
(7, 'iPhone-8-Plus-64GB.png', 1052, 'Design inheritance has reached the benchmark, the iPhone 8 Plus generation changed the look more polished and added a series of advanced features for a great use of experience.', 'Display: 5.5 \", Retina HD<br/>OS: iOS 11<br/>CPU: Apple A11 Bionic 6 core<br/>RAM: 3 GB, ROM: 64 GB<br/>Camera: 12 MP camera, Self: 7 MP<br/>Battery: 2691 mAh', 'iPhone 8 Plus 64GB', 1),
(8, 'Oppo-F5.png', 96, 'NOPPO F5 cheapest smartphone at the moment when it comes back to market with its amazing battery life, solid metal design and water resistance.', 'Display:6 inch, 1080 x 2160 Pixels<br/>OS: Android 7.1<br/>CPU:	Mediatek MT6763T Helio P23, 8 nhân, 2.5<br/>RAM: 4GB, ROM: 32GB<br/>Camera: 16 MP, Self: 20 MP<br/>Battery: 3400 mAh', 'OPPO F5', 3),
(10, 'Oppo-A37.jpg', 1052, 'Traditionally followed by the Oppo, Oppo will launch the Oppo F3, but this year\'s \"defective \" has made an exception when it comes to users of the Oppo F2 with not much change in appearance.', 'Display: 1280 x 720 pixels<br/>OS: Android 7.1<br/>CPU: Quad-core, 4 Nhân, 1.2 GHz<br/>RAM: 4GB, ROM: 32GB<br/>Camera: 8 MP, Self: 5MP<br/>Battery: 2630 mAh', 'OPPO A37 (Neo 9)', 3),
(11, 'Samsung-Galaxy-A8.jpg', 1095, 'Without a design shake, the Samsung Galaxy S9 Plus only improves some of the design that was so perfect from the previous generation Galaxy S8. Still metal frame combines two toughened glass sides that bend the sides of the \"attractive\" and modern.', 'Display: 6.0\", 1080 x 2220 pixels<br/>OS: Android 7<br/>CPU: Exynos 7885 Octa, Dual 2.2 + Hexa 1.6, 8<br/>RAM: 6 GB, ROM: 64 GB<br/>Camera: 12 MP camera, Self: 8 MP<br/>Battery: 3500 mAh', 'Samsung Galaxy A8', 2),
(13, 'iPhone-X-256GB.png', 1500, 'Design inheritance has reached the benchmark, the iPhone X 256GB generation changed the look more polished and added a series of advanced features for a great use of experience.', 'Display: 2436 x 1125 pixel, Retina HD<br/>OS: iOS 11<br/>CPU: Apple A11 Bionic, 6<br/>RAM: 3 GB, ROM: 256 GB<br/>Camera: Dual 12.0 MP, Self: 7 MP<br/>Battery: 2716 mAh', 'iPhone X 256GB', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `id_card` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `address`, `email`, `gender`, `name`, `password`, `phone`, `id_card`) VALUES
(1, 'Hue', 'tsunamihuy@gmail.com', 'Male', 'Phan Van Huy', '123456', '01695357195', 123456789),
(2, '40 Nguyen Luong Bang', 'duyle@gmail.com', 'Male', 'Le Khanh Duy', '123456', '0123456789', 987654321);

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` bigint(20) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_USER');

-- --------------------------------------------------------

--
-- Table structure for table `user_role_relation`
--

CREATE TABLE `user_role_relation` (
  `user_id` bigint(20) NOT NULL,
  `user_role_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role_relation`
--

INSERT INTO `user_role_relation` (`user_id`, `user_role_id`) VALUES
(1, 1),
(2, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`orderDetailId`),
  ADD KEY `FKb51qdl923yoolek2tjtyati00` (`orderId`),
  ADD KEY `FK35cp74o1b01dplg3q801ncogd` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderId`),
  ADD KEY `FKh0uqkh9sporp1upkigygcigo0` (`customer_fk`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role_relation`
--
ALTER TABLE `user_role_relation`
  ADD PRIMARY KEY (`user_id`,`user_role_id`),
  ADD KEY `FK2dk9ymg4h331ambb171746men` (`user_role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orderdetail`
--
ALTER TABLE `orderdetail`
  MODIFY `orderDetailId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
