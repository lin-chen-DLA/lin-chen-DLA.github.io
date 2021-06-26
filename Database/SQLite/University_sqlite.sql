BEGIN TRANSACTION;

CREATE TABLE IF NOT EXISTS `Department` (
  Dname varchar(15) NOT NULL,
  Dnumber int(11) NOT NULL,
  Mgr_ssn char(9) NOT NULL,
  Mgr_start_date date DEFAULT NULL,
  PRIMARY KEY (Dnumber),
  FOREIGN KEY (Mgr_ssn) REFERENCES Employee(Ssn) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `Dependent` (
  Essn char(9) NOT NULL,
  Name varchar(15) NOT NULL,
  Sex char(1) DEFAULT NULL,
  Bdate date DEFAULT NULL,
  Relationship varchar(8) DEFAULT NULL,
  PRIMARY KEY (Essn, Name),
  FOREIGN KEY (Essn) REFERENCES Employee(Ssn) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `Dept_locations` (
  Dnumber int(11) NOT NULL,
  Dlocation varchar(15) NOT NULL,
  PRIMARY KEY (Dnumber, Dlocation),
  FOREIGN KEY (Dnumber) REFERENCES Department(Dnumber) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `Employee` (
  Fname varchar(15) NOT NULL,
  Minit char(1) DEFAULT NULL,
  Lname varchar(15) NOT NULL,
  Ssn char(9) NOT NULL,
  Bdate date DEFAULT NULL,
  Address varchar(30) DEFAULT NULL,
  Sex char(1) DEFAULT NULL,
  Salary decimal(10,2) DEFAULT NULL,
  Super_ssn char(9) DEFAULT NULL,
  Dno int(11) NOT NULL,
  PRIMARY KEY (Ssn),
  FOREIGN KEY (Super_ssn) REFERENCES Employee(Ssn) ON UPDATE CASCADE,
  FOREIGN KEY (Dno) REFERENCES Department(Dnumber) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `Project` (
  Pname varchar(15) NOT NULL,
  Pnumber int(11) NOT NULL,
  Plocation varchar(15) DEFAULT NULL,
  Dnum int(11) NOT NULL,
  PRIMARY KEY (Pnumber),
  FOREIGN KEY (Dnum) REFERENCES Department(Dnumber) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `Works_on` (
  Essn char(9) NOT NULL,
  Pno int(11) NOT NULL,
  Hours decimal(3,1) NOT NULL,
  PRIMARY KEY (Essn, Pno),
  FOREIGN KEY (Essn) REFERENCES Employee(Ssn) ON UPDATE CASCADE,
  FOREIGN KEY (Pno) REFERENCES Project(Pnumber) ON UPDATE CASCADE
);


INSERT INTO `Department` (`Dname`, `Dnumber`, `Mgr_ssn`, `Mgr_start_date`) VALUES
('Headquarters', 1, '888665555', '1981-06-19'),
('Administration', 4, '987654321', '1995-01-01'),
('Research', 5, '333445555', '1988-05-22');


INSERT INTO `Dependent` (`Essn`, `Name`, `Sex`, `Bdate`, `Relationship`) VALUES
('123456789', 'Alice', 'F', '1988-12-30', 'Daughter'),
('123456789', 'Elizabeth', 'F', '1967-05-05', 'Spouse'),
('123456789', 'Michael', 'M', '1988-01-04', 'Son'),
('333445555', 'Alice', 'F', '1986-04-05', 'Daughter'),
('333445555', 'Joy', 'F', '1958-05-03', 'Spouse'),
('333445555', 'Theodore', 'M', '1983-10-25', 'Son'),
('987654321', 'Abner', 'M', '1942-02-28', 'Spouse');

INSERT INTO `Dept_locations` (`Dnumber`, `Dlocation`) VALUES
(1, 'Houston'),
(4, 'Stafford'),
(5, 'Bellaire'),
(5, 'Houston'),
(5, 'Sugarland');


INSERT INTO `Employee` (`Fname`, `Minit`, `Lname`, `Ssn`, `Bdate`, `Address`, `Sex`, `Salary`, `Super_ssn`, `Dno`) VALUES
('John', 'B', 'Smith', '123456789', '1965-01-09', '731 Fondren, Houston, TX', 'M', 30000.00, '333445555', 5),
('Franklin', 'T', 'Wong', '333445555', '1955-12-08', '638 Voss, Houston, TX', 'M', 40000.00, '888665555', 5),
('Joyce', 'A', 'English', '453453453', '1972-07-31', '5631 Rice, Houston, TX', 'F', 25000.00, '333445555', 5),
('Ramesh', 'K', 'Narayan', '666884444', '1962-09-15', '975 Fire Oak, Humble, TX', 'M', 38000.00, '333445555', 5),
('James', 'E', 'Borg', '888665555', '1937-11-10', '450 Stone, Houston, TX', 'M', 55000.00, NULL, 1),
('Jennifer', 'S', 'Wallace', '987654321', '0000-00-00', '291 Berry, Bellaire, TX', 'F', 43000.00, '888665555', 4),
('Ahmad', 'V', 'Jabbar', '987987987', '1969-03-29', '980 Dallas, Houston, TX', 'M', 25000.00, '987654321', 4),
('Alicia', 'J', 'Zelaya', '999887777', '1968-01-19', '3321 Castle, Spring, TX', 'F', 25000.00, '987654321', 4);


INSERT INTO `Project` (`Pname`, `Pnumber`, `Plocation`, `Dnum`) VALUES
('ProductX', 1, 'Bellaire', 5),
('ProductY', 2, 'Sugarland', 5),
('ProductZ', 3, 'Houston', 5),
('Computerization', 10, 'Stafford', 4),
('Reorganization', 20, 'Houston', 1),
('Newbenefits', 30, 'Stafford', 4);


INSERT INTO `Works_on` (`Essn`, `Pno`, `Hours`) VALUES
('123456789', 1, 32.5),
('123456789', 2, 7.5),
('333445555', 2, 10.0),
('333445555', 3, 10.0),
('333445555', 10, 10.0),
('333445555', 20, 10.0),
('453453453', 1, 20.0),
('453453453', 2, 20.0),
('666884444', 3, 40.0),
('888665555', 20, 0.0),
('987654321', 20, 15.0),
('987654321', 30, 20.0),
('987987987', 10, 35.0),
('987987987', 30, 5.0),
('999887777', 10, 10.0),
('999887777', 30, 30.0);

----
-- structure for index sqlite_autoindex_Department_1 on table Department
----
;

----
-- structure for index sqlite_autoindex_Dependent_1 on table Dependent
----
;

----
-- structure for index sqlite_autoindex_Dept_locations_1 on table Dept_locations
----
;

----
-- structure for index sqlite_autoindex_Employee_1 on table Employee
----
;

----
-- structure for index sqlite_autoindex_Project_1 on table Project
----
;

----
-- structure for index sqlite_autoindex_Works_on_1 on table Works_on
----
;
COMMIT;
