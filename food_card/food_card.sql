-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2021 at 10:43 AM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `food_card`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_donorreg`
--

CREATE TABLE IF NOT EXISTS `accounts_donorreg` (
`id` int(11) NOT NULL,
  `phone_no` varchar(50) DEFAULT NULL,
  `address` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `accounts_donorreg`
--

INSERT INTO `accounts_donorreg` (`id`, `phone_no`, `address`, `user_id`) VALUES
(1, '25495956256', 'thanikkunel', 2);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_donor_reg`
--

CREATE TABLE IF NOT EXISTS `accounts_donor_reg` (
`id` int(11) NOT NULL,
  `phone_no` varchar(50) DEFAULT NULL,
  `address` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_hotelreg`
--

CREATE TABLE IF NOT EXISTS `accounts_hotelreg` (
`id` int(11) NOT NULL,
  `phone_no` varchar(50) DEFAULT NULL,
  `address` varchar(50) NOT NULL,
  `place` varchar(50) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `accounts_hotelreg`
--

INSERT INTO `accounts_hotelreg` (`id`, `phone_no`, `address`, `place`, `user_id`) VALUES
(1, '25495956258', 'ddhhs', NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_usertype`
--

CREATE TABLE IF NOT EXISTS `accounts_usertype` (
`id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `accounts_usertype`
--

INSERT INTO `accounts_usertype` (`id`, `type`, `user_id`) VALUES
(1, 'donor', 2),
(2, 'Volunteer', 3),
(3, 'Hotel', 4);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_volreg`
--

CREATE TABLE IF NOT EXISTS `accounts_volreg` (
`id` int(11) NOT NULL,
  `phone_no` varchar(50) DEFAULT NULL,
  `address` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `accounts_volreg`
--

INSERT INTO `accounts_volreg` (`id`, `phone_no`, `address`, `user_id`) VALUES
(1, '25495956257', 'gdgd', 3);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
`id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
`id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=69 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add card generation', 1, 'add_cardgeneration'),
(2, 'Can change card generation', 1, 'change_cardgeneration'),
(3, 'Can delete card generation', 1, 'delete_cardgeneration'),
(4, 'Can view card generation', 1, 'view_cardgeneration'),
(5, 'Can add used cards', 2, 'add_usedcards'),
(6, 'Can change used cards', 2, 'change_usedcards'),
(7, 'Can delete used cards', 2, 'delete_usedcards'),
(8, 'Can view used cards', 2, 'view_usedcards'),
(9, 'Can add payment', 3, 'add_payment'),
(10, 'Can change payment', 3, 'change_payment'),
(11, 'Can delete payment', 3, 'delete_payment'),
(12, 'Can view payment', 3, 'view_payment'),
(13, 'Can add feedback', 4, 'add_feedback'),
(14, 'Can change feedback', 4, 'change_feedback'),
(15, 'Can delete feedback', 4, 'delete_feedback'),
(16, 'Can view feedback', 4, 'view_feedback'),
(17, 'Can add donation reg', 5, 'add_donationreg'),
(18, 'Can change donation reg', 5, 'change_donationreg'),
(19, 'Can delete donation reg', 5, 'delete_donationreg'),
(20, 'Can view donation reg', 5, 'view_donationreg'),
(21, 'Can add card registration', 6, 'add_cardregistration'),
(22, 'Can change card registration', 6, 'change_cardregistration'),
(23, 'Can delete card registration', 6, 'delete_cardregistration'),
(24, 'Can view card registration', 6, 'view_cardregistration'),
(25, 'Can add vol reg', 7, 'add_volreg'),
(26, 'Can change vol reg', 7, 'change_volreg'),
(27, 'Can delete vol reg', 7, 'delete_volreg'),
(28, 'Can view vol reg', 7, 'view_volreg'),
(29, 'Can add user type', 8, 'add_usertype'),
(30, 'Can change user type', 8, 'change_usertype'),
(31, 'Can delete user type', 8, 'delete_usertype'),
(32, 'Can view user type', 8, 'view_usertype'),
(33, 'Can add hotel reg', 9, 'add_hotelreg'),
(34, 'Can change hotel reg', 9, 'change_hotelreg'),
(35, 'Can delete hotel reg', 9, 'delete_hotelreg'),
(36, 'Can view hotel reg', 9, 'view_hotelreg'),
(37, 'Can add donor reg', 10, 'add_donorreg'),
(38, 'Can change donor reg', 10, 'change_donorreg'),
(39, 'Can delete donor reg', 10, 'delete_donorreg'),
(40, 'Can view donor reg', 10, 'view_donorreg'),
(41, 'Can add donor_reg', 11, 'add_donor_reg'),
(42, 'Can change donor_reg', 11, 'change_donor_reg'),
(43, 'Can delete donor_reg', 11, 'delete_donor_reg'),
(44, 'Can view donor_reg', 11, 'view_donor_reg'),
(45, 'Can add log entry', 12, 'add_logentry'),
(46, 'Can change log entry', 12, 'change_logentry'),
(47, 'Can delete log entry', 12, 'delete_logentry'),
(48, 'Can view log entry', 12, 'view_logentry'),
(49, 'Can add permission', 13, 'add_permission'),
(50, 'Can change permission', 13, 'change_permission'),
(51, 'Can delete permission', 13, 'delete_permission'),
(52, 'Can view permission', 13, 'view_permission'),
(53, 'Can add group', 14, 'add_group'),
(54, 'Can change group', 14, 'change_group'),
(55, 'Can delete group', 14, 'delete_group'),
(56, 'Can view group', 14, 'view_group'),
(57, 'Can add user', 15, 'add_user'),
(58, 'Can change user', 15, 'change_user'),
(59, 'Can delete user', 15, 'delete_user'),
(60, 'Can view user', 15, 'view_user'),
(61, 'Can add content type', 16, 'add_contenttype'),
(62, 'Can change content type', 16, 'change_contenttype'),
(63, 'Can delete content type', 16, 'delete_contenttype'),
(64, 'Can view content type', 16, 'view_contenttype'),
(65, 'Can add session', 17, 'add_session'),
(66, 'Can change session', 17, 'change_session'),
(67, 'Can delete session', 17, 'delete_session'),
(68, 'Can view session', 17, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
`id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$216000$tnkcWMHl7fJU$tMoiZCZ8ALrXteXrPYtG5SbNcB5orCM8penW/BSfRAY=', '2021-06-11 08:27:45.712807', 1, 'admin', '', '1', 'admin@gmail.com', 1, 1, '2021-06-11 07:58:29.290671'),
(2, 'pbkdf2_sha256$216000$O6G73g46kUgS$k4QxMS3IOnSleXUgFl/eoT+7ZQ3/JBJ8a3oATmusiL0=', '2021-06-11 08:34:54.554814', 0, 'arun', 'arun', '1', 'arun@gmail.com', 0, 1, '2021-06-11 08:00:11.136366'),
(3, 'pbkdf2_sha256$216000$R0A6hKlreiQu$E7qRVUjJcCz7jCOLqN5czgEU2CEaZtd/8DKJFOqaTI8=', '2021-06-11 08:34:32.253601', 0, 'kumar', 'kumar', '1', 'kumar@gmail.com', 0, 1, '2021-06-11 08:13:35.863511'),
(4, 'pbkdf2_sha256$216000$ICcnNDPWeddV$Rer9N8cn1bq4BvGm0UaZNyBj1ED/6hQWTRSQ95v7LK0=', '2021-06-11 08:35:16.354229', 0, 'bismi', 'bismi', '1', 'bismi@gmail.com', 0, 1, '2021-06-11 08:14:20.422603');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
`id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
`id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(10, 'accounts', 'donorreg'),
(11, 'accounts', 'donor_reg'),
(9, 'accounts', 'hotelreg'),
(8, 'accounts', 'usertype'),
(7, 'accounts', 'volreg'),
(12, 'admin', 'logentry'),
(14, 'auth', 'group'),
(13, 'auth', 'permission'),
(15, 'auth', 'user'),
(16, 'contenttypes', 'contenttype'),
(1, 'food_app', 'cardgeneration'),
(6, 'food_app', 'cardregistration'),
(5, 'food_app', 'donationreg'),
(4, 'food_app', 'feedback'),
(3, 'food_app', 'payment'),
(2, 'food_app', 'usedcards'),
(17, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
`id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-06-11 07:56:11.861517'),
(2, 'auth', '0001_initial', '2021-06-11 07:56:12.824591'),
(3, 'accounts', '0001_initial', '2021-06-11 07:56:13.936671'),
(4, 'admin', '0001_initial', '2021-06-11 07:56:14.501717'),
(5, 'admin', '0002_logentry_remove_auto_add', '2021-06-11 07:56:14.659727'),
(6, 'admin', '0003_logentry_add_action_flag_choices', '2021-06-11 07:56:14.682725'),
(7, 'contenttypes', '0002_remove_content_type_name', '2021-06-11 07:56:14.868740'),
(8, 'auth', '0002_alter_permission_name_max_length', '2021-06-11 07:56:14.969749'),
(9, 'auth', '0003_alter_user_email_max_length', '2021-06-11 07:56:15.064760'),
(10, 'auth', '0004_alter_user_username_opts', '2021-06-11 07:56:15.086755'),
(11, 'auth', '0005_alter_user_last_login_null', '2021-06-11 07:56:15.183763'),
(12, 'auth', '0006_require_contenttypes_0002', '2021-06-11 07:56:15.191765'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2021-06-11 07:56:15.214766'),
(14, 'auth', '0008_alter_user_username_max_length', '2021-06-11 07:56:15.310774'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2021-06-11 07:56:15.396793'),
(16, 'auth', '0010_alter_group_name_max_length', '2021-06-11 07:56:15.489787'),
(17, 'auth', '0011_update_proxy_permissions', '2021-06-11 07:56:15.512787'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2021-06-11 07:56:15.604795'),
(19, 'food_app', '0001_initial', '2021-06-11 07:56:16.489417'),
(20, 'sessions', '0001_initial', '2021-06-11 07:56:17.525479');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('4iu5r8j77xa6ujeew5nbo559tfrucelx', '.eJxVjDkOwjAUBe_iGll2vFPScwbrLzYOoFjKUiHuDpFSQPtm5r1Ehm1teVvKnEcWZ2HF6XdDoEeZdsB3mG5dUp_WeUS5K_Kgi7x2Ls_L4f4dNFjat1ZkBsbkmAAMpmAYHNkhYU0uFKOJtDcULCmtMcagwFcfsKpSINXI4v0B-e04kw:1lrcdI:K9h7PEh7bP9SZ2jB6rlg8NmgcNHMgb1PfpvS1b7Rwpk', '2021-06-25 08:35:16.366220');

-- --------------------------------------------------------

--
-- Table structure for table `food_app_cardgeneration`
--

CREATE TABLE IF NOT EXISTS `food_app_cardgeneration` (
`id` int(11) NOT NULL,
  `cardnum` varchar(10) NOT NULL,
  `date` datetime(6) DEFAULT NULL,
  `used` tinyint(1) NOT NULL,
  `card_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `food_app_cardgeneration`
--

INSERT INTO `food_app_cardgeneration` (`id`, `cardnum`, `date`, `used`, `card_id`) VALUES
(1, '48504', '2021-06-11 08:22:30.850356', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `food_app_cardregistration`
--

CREATE TABLE IF NOT EXISTS `food_app_cardregistration` (
`id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `address` varchar(50) NOT NULL,
  `aadhar` varchar(40) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `approved` tinyint(1) DEFAULT NULL,
  `rejected` tinyint(1) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `volun_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `food_app_cardregistration`
--

INSERT INTO `food_app_cardregistration` (`id`, `name`, `photo`, `address`, `aadhar`, `date`, `approved`, `rejected`, `user_id`, `volun_id`) VALUES
(1, 'Ratheesh V', 'men-inn-banner2.jpg', 'jvhj', '123456789', '2021-06-11 08:22:30.840364', 1, 0, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `food_app_donationreg`
--

CREATE TABLE IF NOT EXISTS `food_app_donationreg` (
`id` int(11) NOT NULL,
  `donation` int(11) DEFAULT NULL,
  `time` time(6) NOT NULL,
  `date` date NOT NULL,
  `details_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `food_app_donationreg`
--

INSERT INTO `food_app_donationreg` (`id`, `donation`, `time`, `date`, `details_id`, `user_id`) VALUES
(1, 10000, '13:32:54.566854', '2021-06-11', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `food_app_feedback`
--

CREATE TABLE IF NOT EXISTS `food_app_feedback` (
`id` int(11) NOT NULL,
  `message` varchar(1000) DEFAULT NULL,
  `reply` varchar(1000) DEFAULT NULL,
  `date` datetime(6) NOT NULL,
  `donor_id` int(11) DEFAULT NULL,
  `hotel_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `volunteer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `food_app_feedback`
--

INSERT INTO `food_app_feedback` (`id`, `message`, `reply`, `date`, `donor_id`, `hotel_id`, `user_id`, `volunteer_id`) VALUES
(1, 'good', NULL, '2021-06-11 08:17:21.273916', NULL, NULL, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `food_app_payment`
--

CREATE TABLE IF NOT EXISTS `food_app_payment` (
`id` int(11) NOT NULL,
  `amount` varchar(30) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time(6) DEFAULT NULL,
  `hotel_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `food_app_payment`
--

INSERT INTO `food_app_payment` (`id`, `amount`, `date`, `time`, `hotel_id`) VALUES
(1, '1500', '2021-06-11', '13:53:05.193497', 1);

-- --------------------------------------------------------

--
-- Table structure for table `food_app_usedcards`
--

CREATE TABLE IF NOT EXISTS `food_app_usedcards` (
`id` int(11) NOT NULL,
  `time` datetime(6) NOT NULL,
  `card_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `food_app_usedcards`
--

INSERT INTO `food_app_usedcards` (`id`, `time`, `card_id`, `hotel_id`) VALUES
(1, '2021-06-11 08:26:50.234994', 1, 1),
(2, '2021-06-11 08:26:52.497904', 1, 1),
(3, '2021-06-11 08:27:16.937616', 1, 1),
(4, '2021-06-11 08:27:18.585692', 1, 1),
(5, '2021-06-11 08:27:19.496939', 1, 1),
(6, '2021-06-11 08:27:20.038917', 1, 1),
(7, '2021-06-11 08:27:20.601434', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_donorreg`
--
ALTER TABLE `accounts_donorreg`
 ADD PRIMARY KEY (`id`), ADD KEY `accounts_donorreg_user_id_a078fe92_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `accounts_donor_reg`
--
ALTER TABLE `accounts_donor_reg`
 ADD PRIMARY KEY (`id`), ADD KEY `accounts_donor_reg_user_id_aeade7ea_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `accounts_hotelreg`
--
ALTER TABLE `accounts_hotelreg`
 ADD PRIMARY KEY (`id`), ADD KEY `accounts_hotelreg_user_id_123ba343_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `accounts_usertype`
--
ALTER TABLE `accounts_usertype`
 ADD PRIMARY KEY (`id`), ADD KEY `accounts_usertype_user_id_0cd356c8_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `accounts_volreg`
--
ALTER TABLE `accounts_volreg`
 ADD PRIMARY KEY (`id`), ADD KEY `accounts_volreg_user_id_c47449c1_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`), ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`), ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`), ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
 ADD PRIMARY KEY (`id`), ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`), ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
 ADD PRIMARY KEY (`session_key`), ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `food_app_cardgeneration`
--
ALTER TABLE `food_app_cardgeneration`
 ADD PRIMARY KEY (`id`), ADD KEY `food_app_cardgenerat_card_id_648a082d_fk_food_app_` (`card_id`);

--
-- Indexes for table `food_app_cardregistration`
--
ALTER TABLE `food_app_cardregistration`
 ADD PRIMARY KEY (`id`), ADD KEY `food_app_cardregistration_user_id_a93b43c7_fk_auth_user_id` (`user_id`), ADD KEY `food_app_cardregistr_volun_id_073b70a6_fk_accounts_` (`volun_id`);

--
-- Indexes for table `food_app_donationreg`
--
ALTER TABLE `food_app_donationreg`
 ADD PRIMARY KEY (`id`), ADD KEY `food_app_donationreg_details_id_cb94a584_fk_accounts_donorreg_id` (`details_id`), ADD KEY `food_app_donationreg_user_id_02fca8c9_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `food_app_feedback`
--
ALTER TABLE `food_app_feedback`
 ADD PRIMARY KEY (`id`), ADD KEY `food_app_feedback_donor_id_85407319_fk_accounts_donorreg_id` (`donor_id`), ADD KEY `food_app_feedback_hotel_id_5cb4b114_fk_accounts_hotelreg_id` (`hotel_id`), ADD KEY `food_app_feedback_user_id_b0f179ea_fk_accounts_usertype_id` (`user_id`), ADD KEY `food_app_feedback_volunteer_id_5e27cb87_fk_accounts_volreg_id` (`volunteer_id`);

--
-- Indexes for table `food_app_payment`
--
ALTER TABLE `food_app_payment`
 ADD PRIMARY KEY (`id`), ADD KEY `food_app_payment_hotel_id_483c1fff_fk_accounts_hotelreg_id` (`hotel_id`);

--
-- Indexes for table `food_app_usedcards`
--
ALTER TABLE `food_app_usedcards`
 ADD PRIMARY KEY (`id`), ADD KEY `food_app_usedcards_card_id_50ac65d1_fk_food_app_` (`card_id`), ADD KEY `food_app_usedcards_hotel_id_f59a279a_fk_accounts_hotelreg_id` (`hotel_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_donorreg`
--
ALTER TABLE `accounts_donorreg`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `accounts_donor_reg`
--
ALTER TABLE `accounts_donor_reg`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `accounts_hotelreg`
--
ALTER TABLE `accounts_hotelreg`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `accounts_usertype`
--
ALTER TABLE `accounts_usertype`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `accounts_volreg`
--
ALTER TABLE `accounts_volreg`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `food_app_cardgeneration`
--
ALTER TABLE `food_app_cardgeneration`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `food_app_cardregistration`
--
ALTER TABLE `food_app_cardregistration`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `food_app_donationreg`
--
ALTER TABLE `food_app_donationreg`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `food_app_feedback`
--
ALTER TABLE `food_app_feedback`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `food_app_payment`
--
ALTER TABLE `food_app_payment`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `food_app_usedcards`
--
ALTER TABLE `food_app_usedcards`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts_donorreg`
--
ALTER TABLE `accounts_donorreg`
ADD CONSTRAINT `accounts_donorreg_user_id_a078fe92_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `accounts_donor_reg`
--
ALTER TABLE `accounts_donor_reg`
ADD CONSTRAINT `accounts_donor_reg_user_id_aeade7ea_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `accounts_hotelreg`
--
ALTER TABLE `accounts_hotelreg`
ADD CONSTRAINT `accounts_hotelreg_user_id_123ba343_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `accounts_usertype`
--
ALTER TABLE `accounts_usertype`
ADD CONSTRAINT `accounts_usertype_user_id_0cd356c8_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `accounts_volreg`
--
ALTER TABLE `accounts_volreg`
ADD CONSTRAINT `accounts_volreg_user_id_c47449c1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `food_app_cardgeneration`
--
ALTER TABLE `food_app_cardgeneration`
ADD CONSTRAINT `food_app_cardgenerat_card_id_648a082d_fk_food_app_` FOREIGN KEY (`card_id`) REFERENCES `food_app_cardregistration` (`id`);

--
-- Constraints for table `food_app_cardregistration`
--
ALTER TABLE `food_app_cardregistration`
ADD CONSTRAINT `food_app_cardregistr_volun_id_073b70a6_fk_accounts_` FOREIGN KEY (`volun_id`) REFERENCES `accounts_volreg` (`id`),
ADD CONSTRAINT `food_app_cardregistration_user_id_a93b43c7_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `food_app_donationreg`
--
ALTER TABLE `food_app_donationreg`
ADD CONSTRAINT `food_app_donationreg_details_id_cb94a584_fk_accounts_donorreg_id` FOREIGN KEY (`details_id`) REFERENCES `accounts_donorreg` (`id`),
ADD CONSTRAINT `food_app_donationreg_user_id_02fca8c9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `food_app_feedback`
--
ALTER TABLE `food_app_feedback`
ADD CONSTRAINT `food_app_feedback_donor_id_85407319_fk_accounts_donorreg_id` FOREIGN KEY (`donor_id`) REFERENCES `accounts_donorreg` (`id`),
ADD CONSTRAINT `food_app_feedback_hotel_id_5cb4b114_fk_accounts_hotelreg_id` FOREIGN KEY (`hotel_id`) REFERENCES `accounts_hotelreg` (`id`),
ADD CONSTRAINT `food_app_feedback_user_id_b0f179ea_fk_accounts_usertype_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_usertype` (`id`),
ADD CONSTRAINT `food_app_feedback_volunteer_id_5e27cb87_fk_accounts_volreg_id` FOREIGN KEY (`volunteer_id`) REFERENCES `accounts_volreg` (`id`);

--
-- Constraints for table `food_app_payment`
--
ALTER TABLE `food_app_payment`
ADD CONSTRAINT `food_app_payment_hotel_id_483c1fff_fk_accounts_hotelreg_id` FOREIGN KEY (`hotel_id`) REFERENCES `accounts_hotelreg` (`id`);

--
-- Constraints for table `food_app_usedcards`
--
ALTER TABLE `food_app_usedcards`
ADD CONSTRAINT `food_app_usedcards_card_id_50ac65d1_fk_food_app_` FOREIGN KEY (`card_id`) REFERENCES `food_app_cardgeneration` (`id`),
ADD CONSTRAINT `food_app_usedcards_hotel_id_f59a279a_fk_accounts_hotelreg_id` FOREIGN KEY (`hotel_id`) REFERENCES `accounts_hotelreg` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
