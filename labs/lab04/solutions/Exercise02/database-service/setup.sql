/***CREATING ALL TABLES*/
CREATE TABLE STUFF (
  Id   INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  Name    VARCHAR(25)                    NOT NULL,
  Description     VARCHAR(50)                    NULL,
  Code        VARCHAR(10)                    NOT NULL
)
  ENGINE = INNODB;

/* INSERT DATA */
INSERT INTO STUFF (Name, Description, Code) VALUES ('Widget', 'Plain old widget', 'WIDG1');
INSERT INTO STUFF (Name, Description, Code) VALUES ('Whatchamacallit', 'You know, the thing', 'WTCH1');
INSERT INTO STUFF (Name, Description, Code) VALUES ('Hoozywhatsit', 'Not sure where to start', 'HWIT1');
INSERT INTO STUFF (Name, Description, Code) VALUES ('Thingamabob', 'No one named Bob cares', 'TGMB1');
