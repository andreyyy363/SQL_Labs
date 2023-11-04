SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `files`;
CREATE TABLE `files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `link` varchar(128) NOT NULL,
  `task_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `files` (`id`, `name`, `link`, `task_id`) VALUES
(1,	'File 1',	'/file/link1',	1),
(2,	'File 2',	'/file/link2',	2),
(3,	'File 3',	'/file/link3',	NULL);

DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `projects` (`id`, `name`, `description`) VALUES
(1,	'Project 1',	'Description of Project 1'),
(2,	'Project 2',	'Description of Project 2');

DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `description` text DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `datetime_creation` datetime DEFAULT NULL,
  `deadline` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tasks` (`id`, `name`, `description`, `project_id`, `author_id`, `datetime_creation`, `deadline`) VALUES
(1,	'Task 1',	'Description of Task 1',	1,	1,	'2023-11-04 20:00:11',	'2023-12-31 23:59:59'),
(2,	'Task 2',	'Description of Task 2',	1,	2,	'2023-11-04 20:00:11',	NULL),
(3,	'Task 3',	'Description of Task 3',	2,	1,	'2023-11-04 20:00:11',	'2023-12-15 12:00:00');

DROP TABLE IF EXISTS `task_assignees`;
CREATE TABLE `task_assignees` (
  `task_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  KEY `task_id` (`task_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `task_assignees_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`),
  CONSTRAINT `task_assignees_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `task_assignees` (`task_id`, `user_id`) VALUES
(1,	2),
(1,	3),
(2,	1),
(3,	2);

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(1,	'user1',	'user1@example.com',	'password1'),
(2,	'user2',	'user2@example.com',	'password2'),
(3,	'user3',	'user3@example.com',	'password3');
