-- SETUP DATABASE
CREATE DATABASE IF NOT EXISTS `mmci_attendance`;
USE `mmci_attendance`;

CREATE TABLE IF NOT EXISTS `employee_time_log` (
    `time_log_id` BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` VARCHAR(100) NOT NULL DEFAULT '',
    `log_date` DATE NOT NULL DEFAULT '0000-00-00',
    `keylog` VARCHAR(150) NOT NULL DEFAULT '',
    INDEX employee (`employee_id`),
    INDEX logdate (`log_date`),
    INDEX keylog (`keylog`),
    INDEX employeelog (`employee_id`, `log_date`, `keylog`),
    UNIQUE employee_keylog (`keylog`),
    UNIQUE employee_log_date (`employee_id`, `log_date`),
    FOREIGN KEY (`employee_id`) 
        REFERENCES `mmci_main`.`employee` (`employee_id`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `timeclock` (
    `timeclock_id` BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `keylog` VARCHAR(150) NOT NULL DEFAULT '',
    `log_type` ENUM ('timeclock', 'ob', 'break') NOT NULL DEFAULT 'timeclock',
    `clockin` TIME NOT NULL DEFAULT '00:00:00',
    `clockout` TIME NOT NULL DEFAULT '00:00:00',
    `update_date` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
    INDEX keylog (`keylog`),
    INDEX keylogtype (`keylog`, `log_type`),
    UNIQUE keylog_type (`keylog`, `log_type`, `clockin`)
) ENGINE=InnoDB CHARSET=utf8;



-- SETUP DATABASE
CREATE DATABASE IF NOT EXISTS `local_attendance`;
USE `local_attendance`;

CREATE TABLE IF NOT EXISTS `employee_time_log` (
    `time_log_id` BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` VARCHAR(100) NOT NULL DEFAULT '',
    `log_date` DATE NOT NULL DEFAULT '0000-00-00',
    `keylog` VARCHAR(150) NOT NULL DEFAULT '',
    INDEX employee (`employee_id`),
    INDEX logdate (`log_date`),
    INDEX keylog (`keylog`),
    INDEX employeelog (`employee_id`, `log_date`, `keylog`),
    UNIQUE employee_keylog (`keylog`),
    UNIQUE employee_log_date (`employee_id`, `log_date`),
    FOREIGN KEY (`employee_id`) 
        REFERENCES `mmci_main`.`employee` (`employee_id`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `timeclock` (
    `timeclock_id` BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `keylog` VARCHAR(150) NOT NULL DEFAULT '',
    `log_type` ENUM ('timeclock', 'ob', 'break') NOT NULL DEFAULT 'timeclock',
    `clockin` TIME NOT NULL DEFAULT '00:00:00',
    `clockout` TIME NOT NULL DEFAULT '00:00:00',
    `update_date` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
    INDEX keylog (`keylog`),
    INDEX keylogtype (`keylog`, `log_type`),
    UNIQUE keylog_type (`keylog`, `log_type`, `clockin`)
) ENGINE=InnoDB CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tmp_ob_log_insert` (
    `timeclock_id` BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `keylog` VARCHAR(150) NOT NULL DEFAULT '',
    `log_type` ENUM ('timeclock', 'ob', 'break') NOT NULL DEFAULT 'timeclock',
    `clockin` TIME NOT NULL DEFAULT '00:00:00',
    `clockout` TIME NOT NULL DEFAULT '00:00:00',
    `update_date` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
    `is_synced` ENUM ('0', '1') NOT NULL DEFAULT '0', 
    INDEX synced (`is_synced`),
    INDEX keylog (`keylog`),
    INDEX keylogtype (`keylog`, `log_type`),
    UNIQUE keylog_type (`keylog`, `log_type`, `clockin`)
) ENGINE=InnoDB CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tmp_break_log_insert` (
    `timeclock_id` BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `keylog` VARCHAR(150) NOT NULL DEFAULT '',
    `log_type` ENUM ('timeclock', 'ob', 'break') NOT NULL DEFAULT 'timeclock',
    `clockin` TIME NOT NULL DEFAULT '00:00:00',
    `clockout` TIME NOT NULL DEFAULT '00:00:00',
    `update_date` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
    `is_synced` ENUM ('0', '1') NOT NULL DEFAULT '0',
    INDEX synced (`is_synced`),
    INDEX keylog (`keylog`),
    INDEX keylogtype (`keylog`, `log_type`),
    UNIQUE keylog_type (`keylog`, `log_type`, `clockin`)
) ENGINE=InnoDB CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tmp_ob_log_update` (
    `timeclock_id` BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `keylog` VARCHAR(150) NOT NULL DEFAULT '',
    `log_type` ENUM ('timeclock', 'ob', 'break') NOT NULL DEFAULT 'timeclock',
    `clockin` TIME NOT NULL DEFAULT '00:00:00',
    `clockout` TIME NOT NULL DEFAULT '00:00:00',
    `update_date` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
    `is_synced` ENUM ('0', '1') NOT NULL DEFAULT '0',
    INDEX synced (`is_synced`),
    INDEX keylog (`keylog`),
    INDEX keylogtype (`keylog`, `log_type`),
    UNIQUE keylog_type (`keylog`, `log_type`, `clockin`)
) ENGINE=InnoDB CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tmp_break_log_update` (
    `timeclock_id` BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `keylog` VARCHAR(150) NOT NULL DEFAULT '',
    `log_type` ENUM ('timeclock', 'ob', 'break') NOT NULL DEFAULT 'timeclock',
    `clockin` TIME NOT NULL DEFAULT '00:00:00',
    `clockout` TIME NOT NULL DEFAULT '00:00:00',
    `update_date` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
    `is_synced` ENUM ('0', '1') NOT NULL DEFAULT '0',
    INDEX synced (`is_synced`),
    INDEX keylog (`keylog`),
    INDEX keylogtype (`keylog`, `log_type`),
    UNIQUE keylog_type (`keylog`, `log_type`, `clockin`)
) ENGINE=InnoDB CHARSET=utf8;

