-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2023 at 10:44 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coffeeshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `cost` int(11) NOT NULL,
  `quantity` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `pid`, `name`, `price`, `cost`, `quantity`, `image`) VALUES
(140, 35, 36, 'latte', 60, 40, 1, '94455092_3074779279227662_4560332159621005312_n.jpg'),
(151, 33, 36, 'latte', 60, 40, 3, '94455092_3074779279227662_4560332159621005312_n.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `user_id`, `name`, `email`, `number`, `message`) VALUES
(10, 35, 'customer3', 'customer3@gmail.com', '0833334567', 'ขนมปังนุ่มอร่อย'),
(11, 36, 'customer4', 'customer4@gmail.com', '0844441234', 'can you add more product?\r\n'),
(12, 36, 'customer4', 'customer4@gmail.com', '0844441234', 'nice coffee\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `email` varchar(100) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `total_cost` int(100) NOT NULL,
  `placed_on` varchar(50) NOT NULL,
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `total_cost`, `placed_on`, `payment_status`) VALUES
(31, 33, 'customer1', '1112345678', 'customer1@gmail.com', 'cash on delivery', 'flat no. 1234/11  222/1 newyork na USA - 123456', ', ชาไทย ( 1 )', 30, 10, '14-Mar-2023', 'completed'),
(33, 38, 'customer6', '08888666', 'customer6@gmail.com', 'cash on delivery', 'flat no. 456/89 333/6 newyork  NA USA - 321456', ', ชาเขียว ( 1 ), latte ( 1 ), ครัวซอง ( 2 )', 230, 162, '14-Mar-2023', 'completed'),
(34, 33, 'customer1', '1112345678', 'customer1@gmail.com', 'cash on delivery', 'flat no. 1234/11  222/1 newyork  NA USA - 123456', ', Baguette ( 2 ), ครัวซอง ( 1 ), americano ( 2 )', 280, 145, '14-Mar-2023', 'completed'),
(35, 34, 'customer2', '0823334567', 'customer2@gmail.com', 'cash on delivery', 'flat no. 1234/11 222/1 newyork  na USA - 123456', ', americano ( 2 ), Baguette ( 1 )', 155, 60, '14-Mar-2023', 'pending'),
(36, 35, 'customer3', '0833334567', 'customer3@gmail.com', 'paypal', 'flat no. 1234/11 222/1 newyork  na USA - 123456', ', ครัวซอง ( 2 ), americano ( 1 )', 190, 125, '14-Mar-2023', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `details` varchar(500) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `cost` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `details`, `price`, `image`, `cost`) VALUES
(31, 'ชาไทย', 'ชาแดง 2 กรัม\r\nน้ำตาล 0.5กรัม\r\nนมข้นจืด 1.25 มิล\r\nนมข้นขวาม 1.7กรัม\r\nครีม 1 มิลลิกรัม', 30, '618571beb4ba3760284b4db6f99f4067.jpg', 10),
(32, 'americano', 'เอสเปรสโซ 2 ชอต\r\nน้ำเปล่า 180 มิลลิลิตร', 50, 'asdasd.PNG', 15),
(33, 'ชาเขียว', 'ชาเขียว 4 มิลลิกรัม\r\nน้ำตาล 0.3 กรัม\r\nครีม 1 มิลลิกรัม\r\nนมข้นจืด 1.25 มิลลิกรัม\r\nนมข้นขวาม 1.7 มิลลิกรัม', 30, '550046.jpg', 12),
(34, 'ครัวซอง', 'แป้งขนมปัง 500 กรัม\r\nนมผง 100 กรัม\r\nน้ำตาลทราย 40 กรัม\r\nยีสต์ 10 กรัม\r\nเกลือ 7 กรัม\r\nน้ำเย็น 275 มิลลิลิตร\r\nเนยสดชนิดจืด 250 กรัม', 70, '97a47b3a12234378a98208aaab5ac5ef.png', 55),
(35, 'Baguette', 'แป้งสาลีดูรัม 300 กรัม\r\nแป้งขนมปัง 225 กรัม\r\nเกลือป่น 1/2 ช้อนชา\r\nยีสต์ 1 ช้อนโต๊ะ\r\nน้ำตาลทราย 20 กรัม\r\nน้ำเย็น 300 มิลลิลิตร\r\nน้ำมันรำข้าว 35 กรัม', 55, 'baguette-13efbe7.png', 30),
(36, 'latte', 'น้ำกาแฟ 2 oz (60 ml)\r\n(นมข้นหวาน 2 กระป๋อง : นมข้นจืด 1 กระป๋อง / ข้นหวาน 40 ml + ข้นจืด 20 ml)\r\nนมสด 2.5-3 oz (75-90 ml)', 60, '94455092_3074779279227662_4560332159621005312_n.jpg', 40);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_type` varchar(20) NOT NULL DEFAULT 'user',
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `user_type`, `image`) VALUES
(32, 'admin', 'admin@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 'admin', 'ดาวน์โหลด.png'),
(33, 'customer1', 'customer1@gmail.com', 'dc5c7986daef50c1e02ab09b442ee34f', 'user', 'pic-1.png'),
(34, 'customer2', 'customer2@gmail.com', '93dd4de5cddba2c733c65f233097f05a', 'user', 'pic-2.png'),
(35, 'customer3', 'customer3@gmail.com', 'e88a49bccde359f0cabb40db83ba6080', 'user', 'pic-3.png'),
(36, 'customer4', 'customer4@gmail.com', '11364907cf269dd2183b64287156072a', 'user', 'pic-4.png'),
(37, 'customer5', 'customer5@gmail.com', 'ce08becc73195df12d99d761bfbba68d', 'user', 'pic-5.png'),
(38, 'customer6', 'customer6@gmail.com', '568628e0d993b1973adc718237da6e93', 'user', 'pic-6.png'),
(40, 'admin2', 'admin2@gmail.com', 'c84258e9c39059a89ab77d846ddab909', 'admin', 'pngtree-beautiful-admin-roles-line-vector-icon-png-image_2035379.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `pid`, `name`, `price`, `image`) VALUES
(82, 34, 33, 'ชาเขียว', 30, '550046.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `pid` (`pid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
