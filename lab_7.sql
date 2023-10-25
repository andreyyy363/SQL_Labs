SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `categories` (`id`, `name`) VALUES
(1,	'Politics'),
(2,	'Sports'),
(3,	'Economy'),
(4,	'Culture'),
(5,	'Technology');

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) NOT NULL,
  `user_name` varchar(128) NOT NULL,
  `date_published` datetime NOT NULL,
  `comment_text` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `news_id` (`news_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `comments` (`id`, `news_id`, `user_name`, `date_published`, `comment_text`) VALUES
(1,	1,	'User1',	'2023-09-13 08:30:00',	'Very interesting news!'),
(2,	2,	'User2',	'2023-09-13 09:30:00',	'Sports news are always exciting.'),
(3,	1,	'User3',	'2023-09-13 10:30:00',	'Politics is a complex issue.');

DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `category_id` int(11) NOT NULL,
  `date_published` datetime NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `news` (`id`, `title`, `category_id`, `date_published`, `content`) VALUES
(1,	'News Title 1',	1,	'2023-09-13 08:00:00',	'News content 1'),
(2,	'News Title 2',	2,	'2023-09-13 09:00:00',	'News content 2'),
(3,	'News Title 3',	1,	'2023-09-13 10:00:00',	'News content 3');

DROP TABLE IF EXISTS `ratings`;
CREATE TABLE `ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `ip_address` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip_address` (`ip_address`),
  KEY `news_id` (`news_id`),
  CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `ratings` (`id`, `news_id`, `rating`, `ip_address`) VALUES
(1,	1,	5,	'192.168.0.1'),
(2,	1,	4,	'192.168.0.2'),
(3,	2,	3,	'192.168.0.3'),
(4,	2,	4,	'192.168.0.4'),
(5,	3,	2,	'192.168.0.5');
