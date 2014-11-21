-- SETUP DATABASE
CREATE DATABASE IF NOT EXISTS `mmci_main`;
USE `mmci_main`;


-- REQUIRED TABLES 
CREATE TABLE IF NOT EXISTS `branch` (
    `branch_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `branch_code` VARCHAR(30) NOT NULL DEFAULT "",
    `branch_name` VARCHAR(150) NOT NULL DEFAULT "",
    INDEX branch_code (`branch_code`, `branch_name`),
    UNIQUE codename (`branch_code`, `branch_name`)
) ENGINE=InnoDB CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `department` (
    `department_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `dept_code` VARCHAR(30) NOT NULL DEFAULT "",
    `dept_name` VARCHAR(250) NOT NULL DEFAULT "",
    INDEX department_code (`dept_code`, `dept_name`),
    UNIQUE codename (`dept_code`, `dept_name`)
) ENGINE=InnoDB CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `job_position` (
    `job_id` INT(10) UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `job_code` VARCHAR(30) NOT NULL DEFAULT '',
    `job_title` VARCHAR(150) NOT NULL DEFAULT '',
    `is_executive` ENUM ('0', '1') NOT NULL DEFAULT '0',
    `is_manager` ENUM ('0', '1') NOT NULL DEFAULT '0',
    `is_supervisor` ENUM ('0', '1') NOT NULL DEFAULT '0',
    INDEX job_id (job_id, job_code),
    INDEX code_title (job_code, job_title),
    INDEX executive_title (job_code, job_title, is_executive),
    INDEX manager_title (job_code, job_title, is_manager),
    INDEX supervisor_title (job_code, job_title, is_supervisor),
    UNIQUE jobcode (`job_code`),
    UNIQUE codetitle (`job_code`, `job_title`)
) ENGINE=InnoDB CHARSET=utf8;


-- EMPLOYEES
CREATE TABLE IF NOT EXISTS `employee` (
    `auto_id` BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` VARCHAR(100) NOT NULL DEFAULT "",
    `first_name` VARCHAR(100) NOT NULL DEFAULT '',
    `middle_name` VARCHAR(50) NOT NULL DEFAULT '',
    `last_name` VARCHAR(50) NOT NULL DEFAULT '',
    `is_active` ENUM ('0', '1') NOT NULL DEFAULT '0',
    `job_code` VARCHAR(30) NOT NULL DEFAULT '',
    `employment_status` ENUM('full-time', 'part-time','contractual') NOT NULL DEFAULT 'contractual',
    `date_hired` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_resigned` timestamp NOT NULL DEFAULT '00-00-0000 00:00:00',
    INDEX auto_employee_id (`auto_id`, `employee_id`),
    UNIQUE identification_number (`employee_id`),
    UNIQUE employee_name (`first_name`, `middle_name`, `last_name`),
    UNIQUE employee_name_id (`employee_id`, `first_name`, `middle_name`, `last_name`)
) ENGINE=InnoDB CHARSET=utf8;