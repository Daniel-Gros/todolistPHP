CREATE DATABASE IF NOT EXISTS TODOLISTPHP
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_general_ci;

USE TODOLISTPHP;

CREATE TABLE IF NOT EXISTS `category` (
    `id` INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `icon` VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS `user` (
    `id` INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `nickname` VARCHAR(50) NOT NULL,
    `email` VARCHAR(50) NOT NULL,
    `password` VARCHAR(64) NOT NULL
);

CREATE TABLE IF NOT EXISTS `list` (
    `id` INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `title` VARCHAR(50) NOT NULL,
    `category_id` INT(11),
    `user_id` INT(11),
    FOREIGN KEY (`category_id`) REFERENCES `category`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE IF NOT EXISTS `item` (
    `id` INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `status` TINYINT(1) NOT NULL,
    `list_id` INT(11),
    FOREIGN KEY (`list_id`) REFERENCES `list`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
);

INSERT INTO `category` (`name`, `icon`) VALUES ('Voyage', 'fas fa-plane');
INSERT INTO `category` (`name`, `icon`) VALUES ('Travail', 'fas fa-briefcase');
INSERT INTO `user` (`nickname`, `email`, `password`) VALUES ('test', 'test@test.fr', SHA2('test', 256));
INSERT INTO `list` (`title`, `category_id`, `user_id`) VALUES ('Vacances à Paris', 1, 1);
INSERT INTO `item` (`name`, `status`, `list_id`) VALUES ('Acheter des billets', 0, 1);
INSERT INTO `item` (`name`, `status`, `list_id`) VALUES ('Réserver un hôtel', 0, 1);
