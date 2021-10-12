/***CREATING ALL TABLES*/
CREATE TABLE EMPLOYEE (
  EmployeeId   INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  FirstName    VARCHAR(40)                    NULL,
  LastName     VARCHAR(40)                    NULL,
  Phone        VARCHAR(20)                    NULL,
  Address      VARCHAR(100)                   NULL,
  City         VARCHAR(30)                    NULL,
  FullName     VARCHAR(100)                   NULL,
  Email        VARCHAR(100)                   NULL,
  Pin          VARCHAR(100)                   NULL,
  CreationDate DATETIME                       NULL,
  EmployeeCode VARCHAR(10) UNIQUE             NOT NULL
)
  ENGINE = INNODB;

CREATE TABLE BENEFIT (
  BenefitId   INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  Code    VARCHAR(40)                    NULL,
  Description     VARCHAR(40)                    NULL
)
  ENGINE = INNODB;

/* INSERT DATA */
INSERT INTO EMPLOYEE (FirstName, LastName, Phone, Address, City, FullName, Email, Pin, CreationDate, EmployeeCode)
VALUES ('SYSADMIN', 'SYSADMIN', 945214775, 'Av. Alfonso Ugarte', 'Lima', 'SYSADMIN SYSADMIN', 'sysadmin@gmail.com',
        1, '2011-12-18 13:17:17', 'SYSADMIN');
INSERT INTO EMPLOYEE (FirstName, LastName, Phone, Address, City, FullName, Email, Pin, CreationDate, EmployeeCode)
VALUES ('Allen', 'Sanders', 123456789, '123 Rd. Blvd.', 'Columbus', 'Allen Sanders', 'asanders@test.com',
        2, '2021-10-11 13:17:17', 'ASANDERS');

INSERT INTO BENEFIT (Code, Description) VALUES ('AAA111', 'Medical Insurance');
INSERT INTO BENEFIT (Code, Description) VALUES ('BBB222', 'Vision');
INSERT INTO BENEFIT (Code, Description) VALUES ('CCC333', 'Dental');
INSERT INTO BENEFIT (Code, Description) VALUES ('DDD444', 'Identity Protection');
INSERT INTO BENEFIT (Code, Description) VALUES ('EEE555', 'Legal');

DROP PROCEDURE IF EXISTS sp_GetEmployee;
DELIMITER //
CREATE PROCEDURE sp_GetEmployee()
  BEGIN
    SELECT * FROM EMPLOYEE;
  END //
DELIMITER ;
/**Drop StoreProcedure**/
CALL sp_GetEmployee();
