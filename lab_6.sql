SELECT cities.name, regions.name AS region
FROM cities
INNER JOIN regions ON cities.region = regions.uuid
WHERE cities.population > 350000;



SELECT cities.name, regions.name AS region
FROM cities, regions
WHERE cities.region = regions.uuid AND regions.name = "Nord";



SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `lines`;
CREATE TABLE `lines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(100) NOT NULL,
  `color` char(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `lines` (`id`, `name`, `color`) VALUES
(1,	'Red Metro Line',	'red'),
(2,	'Blue Metro Line',	'blue'),
(3,	'Green Metro Line',	'green');

DROP TABLE IF EXISTS `routes`;
CREATE TABLE `routes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `station_id_from` int(10) unsigned NOT NULL,
  `station_id_to` int(10) unsigned NOT NULL,
  `length` int(10) unsigned DEFAULT NULL,
  `travel_time` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `routes` (`id`, `station_id_from`, `station_id_to`, `length`, `travel_time`) VALUES
(1,	1,	2,	2,	'00:02:03'),
(2,	16,	17,	1,	NULL),
(3,	22,	23,	NULL,	'00:03:15');

DROP TABLE IF EXISTS `stations`;
CREATE TABLE `stations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(100) NOT NULL,
  `line_id` int(10) unsigned NOT NULL,
  `line_color` char(100) DEFAULT NULL,
  `latitude` decimal(10,0) NOT NULL,
  `longitude` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `stations` (`id`, `name`, `line_id`, `line_color`, `latitude`, `longitude`) VALUES
(1,	'Vokzalna',	1,	'red',	12,	14),
(2,	'Maidan Nezalezhnosti',	2,	'blue',	20,	24),
(3,	'Zoloti Vorota',	3,	'green',	18,	22);

DROP TABLE IF EXISTS `transfers`;
CREATE TABLE `transfers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `station_id_from` int(10) unsigned NOT NULL,
  `station_id_to` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `transfers` (`id`, `station_id_from`, `station_id_to`) VALUES
(1,	1,	16),
(2,	17,	24),
(3,	4,	13);

