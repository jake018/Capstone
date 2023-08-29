-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 29, 2023 at 07:26 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mvogms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart_list`
--

CREATE TABLE `cart_list` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_list`
--

INSERT INTO `cart_list` (`id`, `client_id`, `product_id`, `quantity`) VALUES
(116, 1, 8, 1),
(117, 1, 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `vendor_id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `vendor_id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(2, 2, 'Sample 101', 'This is a sample Category Only.', 1, 0, '2022-02-09 11:03:40', '2022-02-09 11:05:03'),
(3, 2, 'Sample 102', 'This is a sample Category 102', 1, 0, '2022-02-09 11:05:57', NULL),
(4, 2, 'Category 103', 'Sample Category 103', 1, 0, '2022-02-09 11:06:10', NULL),
(5, 2, 'test', 'test', 0, 1, '2022-02-09 11:06:17', '2022-02-09 11:06:20'),
(6, 1, 'Category 101', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut semper leo vitae dui rutrum ultricies. Etiam sit amet odio lorem. In sit amet cursus justo', 1, 0, '2022-02-09 11:09:36', NULL),
(7, 1, 'Category 102', 'Morbi pellentesque, dolor in sodales pretium, libero leo finibus arcu, vitae pharetra ligula quam quis enim. Quisque suscipit venenatis finibus.', 1, 0, '2022-02-09 11:09:45', NULL),
(8, 1, 'Category 103', 'Curabitur fermentum, diam ut dictum molestie, eros dolor luctus dolor, in hendrerit dui sapien vel lorem. Nulla ultrices gravida nisl, id feugiat turpis varius a. In iaculis lorem nisi. Aliquam nec aliquam ipsum, vitae fermentum dui.', 1, 0, '2022-02-09 11:10:19', NULL),
(9, 1, 'Category 104', 'Phasellus luctus ultricies dui, non euismod massa congue id. Fusce ut nisi convallis, aliquam dolor consectetur, varius enim. Phasellus dignissim, erat ac ullamcorper lacinia, nibh est auctor risus, eget ornare est felis et orci.', 1, 0, '2022-02-09 11:10:35', NULL),
(10, 1, 'medicine', 'sample', 1, 0, '2023-07-13 19:12:48', NULL),
(11, 4, 'Fertilizer', 'Medicine', 1, 0, '2023-07-16 19:43:27', NULL),
(12, 4, 'Medincine', '1233', 1, 0, '2023-08-20 18:51:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `client_list`
--

CREATE TABLE `client_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` text NOT NULL,
  `gender` text NOT NULL,
  `contact` text NOT NULL,
  `address` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client_list`
--

INSERT INTO `client_list` (`id`, `code`, `firstname`, `middlename`, `lastname`, `gender`, `contact`, `address`, `email`, `password`, `avatar`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, '202202-00001', 'John', 'D', 'Smith', 'Male', '09123456789', 'This is only my sample address', 'jsmith@sample.com', '1254737c076cf867dc53d60a0364f38e', 'uploads/clients/1.png?v=1644386016', 1, 0, '2022-02-09 13:53:36', '2022-02-10 13:42:53'),
(2, '202202-00002', 'test', 'test', 'test', 'Male', '094564654', 'test', 'test@sample.com', '098f6bcd4621d373cade4e832627b4f6', 'uploads/clients/2.png?v=1644471867', 1, 1, '2022-02-10 13:44:26', '2022-02-10 13:44:35'),
(3, '202307-00001', 'jake', '', 'agnas', 'Male', '09070488921', 'Sta Elena Bula', 'jabinas34@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'uploads/clients/3.png?v=1693101564', 1, 0, '2023-07-14 00:17:50', '2023-08-26 18:59:24'),
(4, '202308-00001', 'joan', '', 'bigay', 'Female', '09070488921', 'Agdangan Baao', 'jabinas1234@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', NULL, 1, 0, '2023-08-22 03:23:48', NULL),
(5, '202308-00002', 'joan', '', 'bigay', 'Female', '09070488921', 'Agdangan Baao', 'jabinas11234@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', NULL, 1, 0, '2023-08-22 03:24:07', NULL),
(6, '202308-00003', 'joan1', '', 'bigay', 'Female', '09333555100', 'Agdangan Baao', 'jabinas134@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', NULL, 1, 0, '2023-08-22 03:24:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `user_id` int(30) NOT NULL,
  `role_name` enum('user','client','vendor','logistic') NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(34) NOT NULL,
  `username` varchar(30) NOT NULL,
  `contact` varchar(30) NOT NULL,
  `avatar` varchar(45) NOT NULL,
  `type` varchar(30) NOT NULL,
  `dated_added` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `code` varchar(30) NOT NULL,
  `shop_type_id` varchar(30) NOT NULL,
  `shop_name` varchar(30) NOT NULL,
  `status` tinyint(30) NOT NULL,
  `id` int(30) NOT NULL,
  `middlename` varchar(30) NOT NULL,
  `gender` varchar(30) NOT NULL,
  `address` text NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_id`, `product_id`, `quantity`, `price`, `date_created`) VALUES
(71, 13, 1, 1900, '2023-08-22 23:50:34'),
(72, 12, 1, 2000, '2023-08-22 23:51:14'),
(73, 13, 1, 1900, '2023-08-22 23:52:02'),
(74, 12, 1, 2000, '2023-08-22 23:52:45'),
(76, 12, 1, 2000, '2023-08-22 23:58:22'),
(101, 13, 1, 1900, '2023-08-23 06:51:47'),
(102, 13, 1, 1900, '2023-08-25 22:37:17'),
(103, 9, 1, 354, '2023-08-25 22:37:17');

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `client_id` int(30) NOT NULL,
  `vendor_id` int(30) NOT NULL,
  `total_amount` double NOT NULL DEFAULT 0,
  `delivery_address` text NOT NULL,
  `contact` varchar(30) NOT NULL,
  `shippingCost` varchar(30) NOT NULL,
  `payment_method` varchar(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `code`, `client_id`, `vendor_id`, `total_amount`, `delivery_address`, `contact`, `shippingCost`, `payment_method`, `status`, `date_created`, `date_updated`) VALUES
(71, '202308-00001', 3, 4, 1900, 'Sta Elena Bula', '', '', '', 5, '2023-08-22 23:50:34', '2023-08-23 06:54:57'),
(72, '202308-00002', 3, 4, 2000, 'Sta Elena Bula', '', '', '', 0, '2023-08-22 23:51:14', '2023-08-22 23:51:14'),
(73, '202308-00003', 3, 4, 1900, 'Sta Elena Bula', '', '', '', 0, '2023-08-22 23:52:02', '2023-08-22 23:52:02'),
(74, '202308-00004', 3, 4, 2000, 'Sta Elena Bula', '', '', '', 0, '2023-08-22 23:52:45', '2023-08-22 23:52:45'),
(76, '202308-00006', 3, 4, 2000, 'Sta Elena Bula', '', '', 'Cash On Delivery', 0, '2023-08-22 23:58:22', '2023-08-22 23:58:22'),
(101, '202308-00008', 3, 4, 1900, 'Sta Elena Bula', '', '', 'maya', 0, '2023-08-23 06:51:47', '2023-08-23 06:51:47'),
(102, '202308-00005', 3, 4, 1900, 'Sta Elena Bula', '', '', 'gcash', 0, '2023-08-25 22:37:17', '2023-08-25 22:37:17'),
(103, '202308-00007', 3, 1, 354, 'Sta Elena Bula', '', '', 'gcash', 0, '2023-08-25 22:37:17', '2023-08-25 22:37:17');

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

CREATE TABLE `product_list` (
  `id` int(30) NOT NULL,
  `vendor_id` int(30) DEFAULT NULL,
  `category_id` int(30) DEFAULT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `stocks` varchar(30) NOT NULL,
  `discount` varchar(30) NOT NULL,
  `image_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`id`, `vendor_id`, `category_id`, `name`, `description`, `price`, `stocks`, `discount`, `image_path`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 1, 9, 'Product 101', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut semper leo vitae dui rutrum ultricies. Etiam sit amet odio lorem. In sit amet cursus justo. Morbi pellentesque, dolor in sodales pretium, libero leo finibus arcu, vitae pharetra ligula quam quis enim. Quisque suscipit venenatis finibus. Curabitur fermentum, diam ut dictum molestie, eros dolor luctus dolor, in hendrerit dui sapien vel lorem. Nulla ultrices gravida nisl, id feugiat turpis varius a. In iaculis lorem nisi. Aliquam nec aliquam ipsum, vitae fermentum dui.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\">Phasellus luctus ultricies dui, non euismod massa congue id. Fusce ut nisi convallis, aliquam dolor consectetur, varius enim. Phasellus dignissim, erat ac ullamcorper lacinia, nibh est auctor risus, eget ornare est felis et orci. Pellentesque aliquam, lectus sed porttitor consequat, sem orci fringilla nisi, a pellentesque metus tellus nec tellus. Nullam metus tortor, mattis in tristique et, tincidunt ac dui. Praesent id viverra diam, vel cursus nulla. Vestibulum ut lobortis velit, a euismod eros. Integer dignissim finibus rhoncus. Praesent non neque ac ipsum lobortis commodo sed ac massa. Mauris justo tortor, dapibus sit amet dui sed, congue vehicula urna.</p>', 1500, '', '', 'uploads/products/1.png?v=1644379549', 1, 0, '2022-02-09 12:05:49', '2022-02-09 14:32:27'),
(2, 1, 9, 'Loaf Bread', '<p><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\">Nullam nisi metus, convallis quis consectetur vitae, laoreet ac nulla. Interdum et malesuada fames ac ante ipsum primis in faucibus. Proin ligula augue, vestibulum in auctor pharetra, posuere id lacus. Aenean aliquam felis quis condimentum congue. Donec porttitor ultricies mi eget vestibulum. Nullam in magna tortor. Suspendisse ullamcorper ultricies accumsan. Duis ultrices sollicitudin velit sed auctor. Vivamus semper placerat porttitor. Praesent diam lorem, luctus sit amet viverra non, consequat ac elit. Suspendisse eleifend massa sit amet nisl porta, eu rutrum massa blandit. Integer congue lacus non fringilla suscipit.</span><br></p>', 85, '', '', 'uploads/products/2.png?v=1644382715', 1, 0, '2022-02-09 12:58:35', '2022-02-09 14:32:21'),
(3, 1, 7, 'Canned Soda', '<p><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\">Aliquam erat volutpat. Fusce scelerisque pulvinar bibendum. Proin convallis elit at molestie egestas. Cras ornare ornare dolor quis mattis. Suspendisse in egestas odio. Fusce nibh ante, ultrices nec elit at, auctor elementum nunc. Curabitur facilisis mauris at congue maximus. Integer a facilisis nisl, sed laoreet odio. Nulla facilisi. Vivamus sed tincidunt eros, non convallis metus. Nullam vestibulum nisi at est euismod, et molestie ligula dapibus. Integer ligula felis, volutpat a accumsan id, egestas nec dolor. Duis dignissim condimentum lectus, eget pharetra ex laoreet vitae. Nam enim mauris, pharetra sit amet leo eget, condimentum lacinia neque.</span><br></p>', 125, '', '', 'uploads/products/3.png?v=1644382753', 1, 0, '2022-02-09 12:59:13', '2022-02-09 14:32:08'),
(4, 1, 6, 'Canned Sardines', '<p><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\">Praesent id pretium neque. Nullam nec scelerisque quam. Donec faucibus erat enim, sit amet aliquet ipsum suscipit at. Suspendisse interdum euismod libero, eu tincidunt ligula elementum a. Nulla id velit vestibulum nisl scelerisque pretium sed at neque. In dignissim purus ut nibh rutrum, at placerat ex elementum. Nam eleifend, sapien ac luctus eleifend, orci purus pulvinar nisl, et scelerisque erat turpis ac tellus. Duis a libero sit amet massa posuere molestie.</span><br></p>', 50, '', '', 'uploads/products/4.png?v=1644382779', 1, 0, '2022-02-09 12:59:38', '2022-02-09 14:32:02'),
(5, 1, 7, 'Dry 101', '<p><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\">Nam vel velit eget libero scelerisque varius. Morbi sodales consectetur eros sed lacinia. Phasellus lobortis, neque sed consequat commodo, felis elit tempor sapien, eu blandit ante ex eu magna. Maecenas pulvinar lectus sed augue pharetra porttitor et sed ligula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent mattis ante est, sed fringilla nisi posuere non.</span><br></p>', 150, '', '', 'uploads/products/5.png?v=1644382802', 1, 0, '2022-02-09 13:00:02', '2022-02-09 14:32:16'),
(6, 2, 4, 'Bottled Juice', '<p><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\">Quisque commodo tincidunt rhoncus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas molestie lacus lacus. Pellentesque velit quam, cursus sit amet congue sed, facilisis et risus. Duis ac consequat eros, id venenatis tortor. Nulla vitae iaculis ante. Morbi id felis non ipsum facilisis sagittis. Integer sed quam et metus pretium tempor sit amet non neque. Praesent eu ante a mauris auctor tempor. Pellentesque luctus erat eget metus vulputate iaculis. Sed rhoncus malesuada ipsum, sed imperdiet leo consequat et. In eu mauris eu felis lacinia semper sit amet nec nisi. Aliquam convallis, neque eget dignissim aliquam, sem enim laoreet arcu, vitae maximus nisi nisl vitae tellus.</span><br></p>', 45.88, '', '', 'uploads/products/6.png?v=1644382977', 1, 0, '2022-02-09 13:02:57', '2022-02-09 14:30:59'),
(7, 2, 2, 'Chicken Wings', '<p><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\">Quisque aliquet tellus sed nulla vulputate pharetra et nec mauris. Nulla placerat magna sed enim ullamcorper, ac tempor turpis varius. Sed in ipsum id odio varius pellentesque. In hac habitasse platea dictumst. Nunc eget nisi sed nisl pellentesque posuere. Nulla quis nibh nec neque ornare mollis sed vitae eros. Nulla nulla turpis, bibendum euismod purus sit amet, semper aliquam enim. Proin dignissim ac nisl in lobortis. Aenean at justo vel ipsum pretium dapibus. Aliquam lorem mi, laoreet eu leo ac, congue blandit orci. Sed vulputate suscipit nibh, at ultrices ipsum sagittis nec.</span><br></p>', 285.99, '', '', 'uploads/products/7.png?v=1644383066', 1, 0, '2022-02-09 13:04:25', '2022-02-09 14:31:48'),
(8, 2, 4, 'Chicken Fillet Raw', '<p><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\">Ut viverra maximus orci et tincidunt. Aliquam erat volutpat. Morbi convallis nibh nec libero ultrices, id suscipit nisl facilisis. Maecenas sed consectetur leo, id tempus nisl. Maecenas tincidunt ultrices ex sed feugiat. Nunc sit amet arcu enim. Nunc tristique faucibus elit sed mollis. Cras commodo tincidunt porttitor.</span><br></p>', 195.75, '', '', 'uploads/products/8.png?v=1644383112', 1, 0, '2022-02-09 13:05:12', '2022-02-09 14:31:40'),
(9, 1, 10, 'foods', '&lt;p&gt;ewrwrfdw&lt;/p&gt;', 354, '', '', NULL, 1, 0, '2023-07-13 19:13:50', NULL),
(10, 1, 6, 'foods3', '&lt;p&gt;ewrwrfdwdsfs&lt;/p&gt;', 35, '', '', NULL, 1, 0, '2023-07-13 19:14:09', NULL),
(11, 4, 11, 'Urea Viking ship', '&lt;p&gt;Sample&nbsp;&lt;/p&gt;', 1900, '1900', '', 'uploads/products/11.png?v=1689507842', 0, 1, '2023-07-16 19:44:01', '2023-07-23 23:41:59'),
(12, 4, 11, 'medicine', '&lt;p&gt;gfsdfgsdfdsfs&lt;/p&gt;', 2000, '30', '', 'uploads/products/12.png?v=1690098694', 1, 0, '2023-07-23 15:51:34', '2023-07-28 23:06:45'),
(13, 4, 11, 'Urea Viking ship', '&lt;p&gt;erfwewwww&lt;/p&gt;', 1900, '50', '', 'uploads/products/13.png?v=1690126960', 1, 0, '2023-07-23 23:42:39', '2023-07-28 23:07:01'),
(14, 4, 11, 'sample21', '&lt;p&gt;&lt;span class=&quot;yt-core-attributed-string--link-inherit-color&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; background: rgba(0, 0, 0, 0.05); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space-collapse: preserve; color: rgb(19, 19, 19);&quot;&gt;For more source codes, please visit &lt;/span&gt;&lt;span class=&quot;yt-core-attributed-string--link-inherit-color&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; background: rgba(0, 0, 0, 0.05); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space-collapse: preserve; color: rgb(6, 95, 212);&quot;&gt;&lt;a class=&quot;yt-core-attributed-string__link yt-core-attributed-string__link--display-type yt-core-attributed-string__link--call-to-action-color&quot; tabindex=&quot;0&quot; href=&quot;https://www.youtube.com/redirect?event=video_description&amp;amp;redir_token=QUFFLUhqbFdoRnppcmtmT2IxTzFKZHMwZFhWRjZtcENid3xBQ3Jtc0trclE4d3RFb1ZBTmdkd05YcXFKRE5YM19pNWpHOGNZakJiV1ItbUl4M280MXNDMmI1UWs1ZDcwbTA3UlY0dnRnV3dNTzVOeVpHWDRYT0Y5WmZGakNsNzF6XzRlcWJtUUZBa01MMjBaemlEbTRrWkM3Yw&amp;amp;q=https%3A%2F%2Fwww.sourcecodester.com%2F&amp;amp;v=jY24dP6yeic&quot; rel=&quot;nofollow&quot; target=&quot;_blank&quot; force-new-state=&quot;true&quot; style=&quot;display: inline; color: inherit;&quot;&gt;https://www.sourcecodester.com/&lt;/a&gt;&lt;/span&gt;&lt;span class=&quot;yt-core-attributed-string--link-inherit-color&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; background: rgba(0, 0, 0, 0.05); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space-collapse: preserve; color: rgb(19, 19, 19);&quot;&gt;. We have so many example projects prepared and uploaded on the website that you may use. Don\'t forget to subscribe to my channel and hit the notification bell to keep updated on my new uploads.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 132, '43', '', NULL, 1, 1, '2023-08-20 18:50:17', '2023-08-20 18:50:39'),
(15, 4, 12, 'ELisa Abner', '&lt;p&gt;fgfdfgsfsfsfds&lt;/p&gt;', 65, '55', '', NULL, 1, 1, '2023-08-22 18:52:23', '2023-08-22 18:52:39'),
(16, 4, 12, 'jake agnas', '&lt;p&gt;adssasdas&lt;/p&gt;', 324, '122', '', NULL, 1, 1, '2023-08-22 19:15:24', '2023-08-25 23:57:08'),
(17, 4, 12, 'adsa', '&lt;p&gt;asdsdaad&lt;/p&gt;', 2323, '23', '', NULL, 1, 1, '2023-08-22 19:16:49', '2023-08-25 06:30:19'),
(18, 4, 12, 'jake agnas23', '&lt;p&gt;sadadasdasdas&lt;/p&gt;', 23, '23', '', NULL, 1, 1, '2023-08-22 19:19:34', '2023-08-25 23:57:11'),
(19, 4, 12, 'dasa', '&lt;p&gt;sdsasad&lt;/p&gt;', 4, '4', '', NULL, 1, 1, '2023-08-22 19:20:09', '2023-08-25 06:30:22'),
(20, 4, 11, 'joan bigay', '&lt;p&gt;sdasdasdasd&lt;/p&gt;', 12, '12', '', 'uploads/products/20.png?v=1692970008', 1, 0, '2023-08-25 06:26:48', '2023-08-25 06:26:48'),
(21, 4, 11, 'Sample Viking', '&lt;p&gt;adasdasda&lt;/p&gt;', 23, '34', '', 'uploads/products/21.png?v=1692970129', 1, 0, '2023-08-25 06:28:47', '2023-08-25 06:28:49'),
(22, 4, 12, 'Elksie', '&lt;p&gt;asdadsadsadad&lt;/p&gt;', 433, '23', '', NULL, 1, 1, '2023-08-25 06:30:39', '2023-08-25 23:57:04'),
(23, 4, 12, 'jhobe', '&lt;p&gt;sdadsad&lt;/p&gt;', 433, '3434', '', 'uploads/products/23.png?v=1692970343', 1, 0, '2023-08-25 06:32:20', '2023-08-25 06:32:23'),
(24, 4, 12, 'hotdog2', '&lt;p&gt;ssxxa&lt;/p&gt;', 3, '33', '', 'uploads/products/24.png?v=1693033086', 1, 0, '2023-08-25 23:58:06', '2023-08-25 23:58:06'),
(25, 4, 12, 'sampe bigay', '&lt;p&gt;sdadasd&lt;/p&gt;', 23, '32', '', 'uploads/products/25.png?v=1693100875', 1, 0, '2023-08-26 18:47:55', '2023-08-26 18:47:55'),
(26, 4, 12, 'sampe bigay32', '&lt;p&gt;adsada&lt;/p&gt;', 34, '3', '', 'uploads/products/26.png?v=1693101001', 1, 0, '2023-08-26 18:50:01', '2023-08-26 18:50:01'),
(27, 4, 12, 'ddas', '&lt;p&gt;adsaadsa&lt;/p&gt;', 34, '34', '', 'uploads/products/27.png?v=1693101675', 1, 0, '2023-08-26 19:01:14', '2023-08-26 19:01:15'),
(28, 4, 11, 'joan bigay4', '&lt;p&gt;dsada&lt;/p&gt;', 454, '4', '', NULL, 1, 1, '2023-08-26 19:03:36', '2023-08-26 22:38:44'),
(29, 4, 12, 'admin', '&lt;p&gt;dadadadadadadadadadadadadadadada&lt;/p&gt;', 3, '34', '', NULL, 1, 1, '2023-08-26 19:04:02', '2023-08-26 22:38:50'),
(30, 4, 11, 'jake agnas admin', '&lt;p&gt;adada&lt;/p&gt;', 34, '3', '', 'uploads/products/30.png?v=1693101884', 1, 0, '2023-08-26 19:04:43', '2023-08-26 19:04:44'),
(31, 4, 11, 'agnas', '&lt;p&gt;agnas&lt;/p&gt;', 44, '44', '', 'uploads/products/31.png?v=1693114738', 1, 0, '2023-08-26 19:05:36', '2023-08-26 22:38:58');

-- --------------------------------------------------------

--
-- Table structure for table `shop_type_list`
--

CREATE TABLE `shop_type_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shop_type_list`
--

INSERT INTO `shop_type_list` (`id`, `name`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Dry Goods', 1, 0, '2022-02-09 08:49:34', NULL),
(2, 'Cosmetics', 1, 0, '2022-02-09 08:49:46', NULL),
(3, 'Produce', 1, 0, '2022-02-09 08:50:31', NULL),
(4, 'Anyy', 1, 0, '2022-02-09 08:50:36', '2022-02-09 08:50:57'),
(5, 'Others', 1, 1, '2022-02-09 08:50:41', '2022-02-09 08:50:45'),
(6, 'medicine', 1, 0, '2023-07-14 00:14:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Digital Marketplace'),
(6, 'short_name', 'EJ&apos;s ExMart'),
(11, 'logo', 'uploads/logo-1689950599.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1689489140.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `contact` varchar(30) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `contact`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatar-1.png?v=1692978557', '', NULL, 1, '2021-01-20 14:02:37', '2023-08-25 08:49:17'),
(11, 'Jake', 'Agnas', 'jabinas', '4744ddea876b11dcb1d169fadf494418', 'uploads/avatar-11.png?v=1644472553', '09070488921', NULL, 1, '2022-02-10 13:55:52', '2023-07-28 15:21:11'),
(12, 'Juan', 'agnas', 'Raider1', '81dc9bdb52d04dc20036dbd8313ed055', 'uploads/avatar-12.png?v=1692972907', '', NULL, 2, '2023-08-25 07:15:07', '2023-08-25 07:15:07');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_list`
--

CREATE TABLE `vendor_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `shop_type_id` int(30) NOT NULL,
  `shop_name` text NOT NULL,
  `shop_owner` text NOT NULL,
  `contact` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendor_list`
--

INSERT INTO `vendor_list` (`id`, `code`, `shop_type_id`, `shop_name`, `shop_owner`, `contact`, `username`, `password`, `avatar`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, '202202-00001', 4, 'Shop101', 'Shop 101 Owner', '09123456788', 'shop101', 'ee6c4d4ba80f29dd389f0deb8863de69', 'uploads/vendors/1.png?v=1644375053', 1, 0, '2022-02-09 10:50:53', '2022-02-10 13:43:21'),
(2, '202202-00002', 1, 'Shop102', 'John Miller', '09123456789', 'shop102', '90be022251077e3488c998613214df74', 'uploads/vendors/2.png?v=1644375129', 1, 0, '2022-02-09 10:52:09', '2022-02-09 17:02:54'),
(4, '202307-00001', 2, 'FarmStation', 'Juan dela Cruz', '09070488921', 'FarmStation', '202cb962ac59075b964b07152d234b70', 'uploads/vendors/4.png?v=1693101588', 1, 0, '2023-07-16 19:40:06', '2023-08-26 18:59:48'),
(5, '202308-00001', 4, 'LCC Mart', 'Juan ', '0933545486', 'LCC', '81dc9bdb52d04dc20036dbd8313ed055', NULL, 1, 0, '2023-08-20 18:41:23', NULL),
(6, '202308-00002', 4, 'LCC Mart', 'joan bigay', '09070488921', 'LCC2', '81dc9bdb52d04dc20036dbd8313ed055', NULL, 1, 0, '2023-08-20 19:34:19', NULL),
(7, '202308-00003', 4, 'LCC Mart2', 'jake1 agnas', '09444555888', 'admin12', '81dc9bdb52d04dc20036dbd8313ed055', NULL, 1, 0, '2023-08-20 19:36:01', NULL),
(8, '202308-00004', 4, 'LCC Mart2', 'sampe bigay', '09444555882', 'admin121', '81dc9bdb52d04dc20036dbd8313ed055', NULL, 1, 0, '2023-08-20 19:37:32', NULL),
(9, '202308-00005', 4, 'LCC Mart11', 'jake agnas', '09516096491', 'FarmStation1', '81dc9bdb52d04dc20036dbd8313ed055', NULL, 1, 0, '2023-08-20 19:38:25', NULL),
(10, '202308-00006', 4, 'LCC Mart112', 'sampe bigay1', '09516096422', 'FarmStation111', '81dc9bdb52d04dc20036dbd8313ed055', NULL, 1, 1, '2023-08-20 19:48:02', '2023-08-25 07:16:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart_list`
--
ALTER TABLE `cart_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indexes for table `client_list`
--
ALTER TABLE `client_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`role_name`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indexes for table `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`vendor_id`),
  ADD KEY `category_id` (`category_id`) USING BTREE;

--
-- Indexes for table `shop_type_list`
--
ALTER TABLE `shop_type_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_list`
--
ALTER TABLE `vendor_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_type_id` (`shop_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart_list`
--
ALTER TABLE `cart_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `client_list`
--
ALTER TABLE `client_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `product_list`
--
ALTER TABLE `product_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `shop_type_list`
--
ALTER TABLE `shop_type_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `vendor_list`
--
ALTER TABLE `vendor_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_list`
--
ALTER TABLE `cart_list`
  ADD CONSTRAINT `cart_list_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_list_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_list`
--
ALTER TABLE `category_list`
  ADD CONSTRAINT `category_list_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `order_list_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_list_ibfk_2` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_list`
--
ALTER TABLE `product_list`
  ADD CONSTRAINT `product_list_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_list_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vendor_list`
--
ALTER TABLE `vendor_list`
  ADD CONSTRAINT `vendor_list_ibfk_1` FOREIGN KEY (`shop_type_id`) REFERENCES `shop_type_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
