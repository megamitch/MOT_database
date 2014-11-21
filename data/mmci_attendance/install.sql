-- SETUP DATABASE
CREATE DATABASE IF NOT EXISTS `mmci_attendance`;
USE `mmci_attendance`;

CREATE TABLE IF NOT EXISTS `work_schedule` (
    `work_schedule_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `hpw` TINYINT(4) UNSIGNED NOT NULL DEFAULT 0,
    `mon` ENUM ('0', '1', '2', '3') NOT NULL DEFAULT '1',
    `tue` ENUM ('0', '1', '2', '3') NOT NULL DEFAULT '1',
    `wed` ENUM ('0', '1', '2', '3') NOT NULL DEFAULT '1',
    `thu` ENUM ('0', '1', '2', '3') NOT NULL DEFAULT '1',
    `fri` ENUM ('0', '1', '2', '3') NOT NULL DEFAULT '1',
    `sat` ENUM ('0', '1', '2', '3') NOT NULL DEFAULT '0',
    `sun` ENUM ('0', '1', '2', '3') NOT NULL DEFAULT '0'
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `employee_work_schedule` (
    `ews_id` BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` VARCHAR(100) NOT NULL DEFAULT "",
    `work_schedule_id` INT(10) UNSIGNED NOT NULL DEFAULT 1,
    FOREIGN KEY (employee_id) REFERENCES `mmci_main`.`employee` (employee_id) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `timeclock_schedule` (
    `timeclock_schedule_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `clock_in` TIME NOT NULL DEFAULT "00:00:00",
    `clock_out` TIME NOT NULL DEFAULT "00:00:00",
    `total_hours` TINYINT(2) NOT NULL DEFAULT 0,
    INDEX time_in_out (`clock_in`, `clock_out`),
    UNIQUE timeclock (`clock_in`, `clock_out`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `break_schedule` () ENGINE=InnoDB CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `employee_break_schedule` () ENGINE=InnoDB CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `timeclock` () ENGINE=InnoDB CHARSET=utf8;
