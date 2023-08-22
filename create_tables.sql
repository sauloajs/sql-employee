DROP TABLE IF EXISTS `department_employees`;
DROP TABLE IF EXISTS `salaries`;
DROP TABLE IF EXISTS `departments`;
DROP TABLE IF EXISTS `employees`;

CREATE TABLE employees (
    id          INT UNSIGNED NOT NULL AUTO_INCREMENT,
    birth_date  DATE            NOT NULL,
    name        VARCHAR(14)     NOT NULL,
    gender      ENUM ('M', 'F')  NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE departments (
    id      INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name    VARCHAR(40) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE  KEY (`name`)
);

CREATE TABLE department_employees (
    employee_id     INT UNSIGNED NOT NULL,
	department_id	INT UNSIGNED NOT NULL,
    hired_at        DATE NOT NULL,
    dismissed_at    DATE,
    KEY             (`employee_id`),
    KEY             (`department_id`),
    FOREIGN KEY (`employee_id`) REFERENCES employees (`id`) ON DELETE CASCADE,
    FOREIGN KEY (`department_id`) REFERENCES departments (`id`) ON DELETE CASCADE,
    PRIMARY KEY (`employee_id`, `department_id`)
);

CREATE TABLE salaries (
    employee_id      INT UNSIGNED NOT NULL,
    salary      	 DOUBLE NOT NULL,
    started_at   	 DATE   NOT NULL,
    ended_at    	 DATE   NOT NULL,
    KEY         (`employee_id`),
    FOREIGN KEY (`employee_id`) REFERENCES employees (`id`) ON DELETE CASCADE,
    PRIMARY KEY (`employee_id`)
);