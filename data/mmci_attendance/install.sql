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
    `employee_id` VARCHAR(100) NOT NULL DEFAULT '',
    `work_schedule_id` INT(10) UNSIGNED NOT NULL DEFAULT 1,
    `timeclock_schedule_id` INT(10) UNSIGNED NOT NULL DEFAULT 1,
    INDEX emp_work_sched (`employee_id`,`work_schedule_id`, `timeclock_schedule_id`),
    INDEX emp_id (`employee_id`),
    UNIQUE employee_id (`employee_id`),
    UNIQUE work_schedule (`employee_id`, `work_schedule_id`),
    FOREIGN KEY (`employee_id`) 
        REFERENCES `mmci_main`.`employee` (`employee_id`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `timeclock_schedule` (
    `timeclock_schedule_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `clock_in` TIME NOT NULL DEFAULT "00:00:00",
    `clock_out` TIME NOT NULL DEFAULT "00:00:00",
    `total_hours` TINYINT(2) NOT NULL DEFAULT 0,
    INDEX time_in_out (`clock_in`, `clock_out`),
    UNIQUE timeclock (`clock_in`, `clock_out`)
) ENGINE=InnoDB;

-- CREATE TABLE IF NOT EXISTS `break_schedule` () ENGINE=InnoDB CHARSET=utf8;

-- CREATE TABLE IF NOT EXISTS `employee_break_schedule` () ENGINE=InnoDB CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `timeclock` (
    `timeclock_id` BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` VARCHAR(100) NOT NULL DEFAULT '',
    `branch_code` VARCHAR(30) NOT NULL DEFAULT '',
    `log_type` ENUM ('time-in', 'time-out') NOT NULL,
    `log_time` TIME NOT NULL DEFAULT '00:00:00',
    `log_date` DATE NOT NULL DEFAULT '0000-00-00',
    UNIQUE employee_record (`employee_id`, `log_date`, `log_type`, `branch_code`),
    FOREIGN KEY (`employee_id`) 
        REFERENCES `mmci_main`.`employee` (`employee_id`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`branch_code`)
        REFERENCES `mmci_main`.`branch` (`branch_code`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `obclock` (
    `obclock_id` BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` VARCHAR(100) NOT NULL DEFAULT '',
    `branch_code` VARCHAR(30) NOT NULL DEFAULT '',
    `log_type` ENUM ('ob-start', 'ob-end') NOT NULL,
    `log_time` TIME NOT NULL DEFAULT '00:00:00',
    `log_date` DATE NOT NULL DEFAULT '0000-00-00',
    UNIQUE employee_record (`employee_id`, `log_date`, `log_type`, `branch_code`),
    FOREIGN KEY (`employee_id`) 
        REFERENCES `mmci_main`.`employee` (`employee_id`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`branch_code`)
        REFERENCES `mmci_main`.`branch` (`branch_code`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `breakclock` (
    `breakclock_id` BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` VARCHAR(100) NOT NULL DEFAULT '',
    `branch_code` VARCHAR(30) NOT NULL DEFAULT '',
    `log_type` ENUM ('break-start', 'break-end') NOT NULL,
    `log_time` TIME NOT NULL DEFAULT '00:00:00',
    `log_date` DATE NOT NULL DEFAULT '0000-00-00',
    UNIQUE employee_record (`employee_id`, `log_date`, `log_type`, `branch_code`),
    FOREIGN KEY (`employee_id`) 
        REFERENCES `mmci_main`.`employee` (`employee_id`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`branch_code`)
        REFERENCES `mmci_main`.`branch` (`branch_code`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB CHARSET=utf8;