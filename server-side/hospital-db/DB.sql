-- Active: 1701837538425@@localhost@3306@hospital

-- Table structure for table `provider`
-- 
-- DROP TABLE IF EXISTS `provider`;
CREATE TABLE `provider` (
    `prov_Code` int(4) unsigned zerofill NOT NULL,
    `prov_Name` varchar(45) NOT NULL,
    `prov_Phone` varchar(10) NOT NULL,
    `prov_Address` varchar(45) NOT NULL,
    PRIMARY KEY (`prov_Code`),
    UNIQUE KEY `prov_Code_UNIQUE` (`prov_Code`),
    UNIQUE KEY `prov_Phone_UNIQUE` (`prov_Phone`)
);
-- ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
--
-- Dumping data for table `provider`
--
-- LOCK TABLES `provider` WRITE;
-- UNLOCK TABLES;
--


-- Table structure for table `department`
--
-- DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
    `dep_Code` VARCHAR(3) NOT NULL,
    `dep_Title` varchar(45) NOT NULL,
    `dean_Code` VARCHAR(4) DEFAULT NULL,
    PRIMARY KEY (`dep_Code`),
    UNIQUE KEY `dep_Code_UNIQUE` (`dep_Code`),
    KEY `emp_CodeD_idx` (`dean_Code`)
);
-- ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
--
-- Dumping data for table `department`
--
-- LOCK TABLES `department` WRITE;
-- UNLOCK TABLES; 
--

-- Table structure for table `employee`
--
-- DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
    `emp_Code` VARCHAR(4) NOT NULL,
    `emp_DateOfBirth` date NOT NULL,
    `emp_Address` varchar(45) NOT NULL,
    `emp_Speciality` varchar(45) DEFAULT NULL,
    `emp_DegreesYear` int(4) unsigned zerofill NOT NULL,
    `emp_FName` varchar(45) NOT NULL,
    `emp_LName` varchar(45) NOT NULL,
    `emp_Phone` varchar(10) NOT NULL,
    `emp_Gender` enum('Male','Female','Unknown') NOT NULL DEFAULT 'Unknown',
    `emp_SDate` date NOT NULL,
    `dep_Code` varchar(3) NOT NULL,
    PRIMARY KEY (`emp_Code`),
    UNIQUE KEY `emp_Phone_UNIQUE` (`emp_Phone`),
    UNIQUE KEY `emp_Code_UNIQUE` (`emp_Code`),
    KEY `dep_Code_idx` (`dep_Code`),
    CONSTRAINT `dep_Code` FOREIGN KEY (`dep_Code`) REFERENCES `department` (`dep_Code`) ON DELETE RESTRICT
);
-- ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
--
-- Dumping data for table `employee`
--
-- LOCK TABLES `employee` WRITE;
-- UNLOCK TABLES;
--


-- Table structure for table `doctor`
--
-- DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
  `doctor_Code` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`doctor_Code`),
  UNIQUE KEY `doctor_Code_UNIQUE` (`doctor_Code`),
  CONSTRAINT `doctor_CodeD` FOREIGN KEY (`doctor_Code`) REFERENCES `employee` (`emp_Code`)
);
-- ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
--
-- Dumping data for table `doctor`
--
-- LOCK TABLES `doctor` WRITE;
-- UNLOCK TABLES;
--

-- Table structure for table `nurse`
--
-- DROP TABLE IF EXISTS `nurse`;
CREATE TABLE `nurse` (
  `emp_Code` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`emp_Code`),
  UNIQUE KEY `emp_Code_UNIQUE` (`emp_Code`),
  CONSTRAINT `emp_CodeN` FOREIGN KEY (`emp_Code`) REFERENCES `employee` (`emp_Code`) ON DELETE CASCADE
);
-- ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
--
-- Dumping data for table `nurse`
--
-- LOCK TABLES `nurse` WRITE;
-- UNLOCK TABLES;
--



-- Table structure for table `medication`
--
-- DROP TABLE IF EXISTS `medication`;
CREATE TABLE `medication` (
  `med_Code` VARCHAR(5) NOT NULL,
  `med_Name` varchar(45) NOT NULL,
  `med_Effects` varchar(200) NOT NULL,
  `med_ExpDate` date NOT NULL,
  `med_Fee` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`med_Code`),
  UNIQUE KEY `med_Code_UNIQUE` (`med_Code`)
);
-- ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
--
-- Dumping data for table `medication`
--
-- LOCK TABLES `medication` WRITE;
-- UNLOCK TABLES;
--



-- Table structure for table `import`
--
-- DROP TABLE IF EXISTS `import`;

CREATE TABLE `import` (
  `prov_Code` INT(4) unsigned zerofill NOT NULL,
  `med_Code` varchar(5) NOT NULL,
  `imp_Date` date NOT NULL,
  `Quantity` INT(4) NOT NULL,
  `Price` decimal(10, 2) DEFAULT NULL,
  PRIMARY KEY (`Prov_Code`, `Med_Code`, `Imp_Date`),
  KEY `Med_Code_idx` (`Med_Code`),
  CONSTRAINT `FK_Med_Code` FOREIGN KEY (`Med_Code`) REFERENCES `medication` (`med_Code`) ON DELETE RESTRICT,
  CONSTRAINT `FK_Prov_Code` FOREIGN KEY (`Prov_Code`) REFERENCES `provider` (`prov_Code`) ON DELETE RESTRICT
);
-- ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
--
-- Dumping data for table `import`
--
-- LOCK TABLES `import` WRITE;
-- UNLOCK TABLES;
--



-- Table structure for table `patient`
--
-- DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient` (
  `num_Code` VARCHAR(9) NOT NULL,
  `patient_FName` varchar(45) NOT NULL,
  `patient_LName` varchar(45) NOT NULL,
  `patient_Address` varchar(45) NOT NULL,
  `patient_DateOfBirth` date NOT NULL,
  `patient_Gender` enum('Male','Female','Unknown') NOT NULL DEFAULT 'Unknown',
  `patient_Phone` varchar(10) NOT NULL,
  PRIMARY KEY (`num_Code`),
  UNIQUE KEY `patient_Phone_UNIQUE` (`patient_Phone`),
  UNIQUE KEY `num_Code_UNIQUE` (`num_Code`)
);
-- ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
--
-- Dumping data for table `patient`
--
-- LOCK TABLES `patient` WRITE;
-- UNLOCK TABLES;
--



-- Table structure for table `outpatient`
--
-- DROP TABLE IF EXISTS `outpatient`;
CREATE TABLE `outpatient` (
  `character_Code` varchar(11) NOT NULL,
  `num_Code` varchar(9) NOT NULL,
  PRIMARY KEY (`character_Code`, `num_Code`),
  UNIQUE KEY `num_Code_UNIQUE` (`num_Code`),
  CONSTRAINT `num_Code` FOREIGN KEY (`num_Code`) REFERENCES `patient` (`num_Code`) ON DELETE CASCADE
);
-- ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
--
-- Dumping data for table `outpatient`
--
-- LOCK TABLES `outpatient` WRITE;
-- UNLOCK TABLES;
--




-- Table structure for table `inpatient`
--
-- DROP TABLE IF EXISTS `inpatient`;
CREATE TABLE `inpatient` (
  `character_Code` varchar(11) NOT NULL,
  `num_Code` varchar(9) NOT NULL,
  `Date_Of_Admission` date NOT NULL,
  `Date_Of_Discharge` date DEFAULT NULL,
  `Fee` decimal(10, 2) DEFAULT NULL,
  `Diagnosis` varchar(200) NOT NULL,
  `Sickroom` varchar(45) NOT NULL,
  `nurse_Code` varchar(4) NOT NULL,
  PRIMARY KEY (`character_Code`, `num_Code`),
  UNIQUE KEY `num_Code_UNIQUE` (`num_Code`),
  KEY `nurse_Code_idx` (`nurse_Code`),
  CONSTRAINT `num_CodeI` FOREIGN KEY (`num_Code`) REFERENCES `patient` (`num_Code`) ON DELETE CASCADE,
  CONSTRAINT `nurse_Code` FOREIGN KEY (`nurse_Code`) REFERENCES `nurse` (`emp_Code`) ON DELETE RESTRICT
);
-- ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
--
-- Dumping data for table `inpatient`
--
-- LOCK TABLES `inpatient` WRITE;
-- UNLOCK TABLES;
--




-- Table structure for table `examination`
--
-- DROP TABLE IF EXISTS `examination`;
CREATE TABLE `examination` (
  `character_Code` varchar(11) NOT NULL,
  `num_Code` varchar(9) NOT NULL,
  `exam_Code` varchar(4) NOT NULL,
  `doctor_CodeE` varchar(4) NOT NULL,
  `exam_Diagnosis` varchar(200) NOT NULL,
  `exam_Fee` decimal(10, 2) DEFAULT NULL,
  `exam_Date` date NOT NULL,
  `exam_NDate` date DEFAULT NULL,
  PRIMARY KEY (
    `character_Code`,
    `num_Code`,
    `exam_Code`,
    `doctor_CodeE`
  ),
  -- UNIQUE KEY `num_Code_UNIQUE` (`num_Code`),
  UNIQUE KEY `exam_Code_UNIQUE` (`exam_Code`),
  -- KEY `doctor_Code_idx` (`doctor_Code`),
  CONSTRAINT `chk_exam_dates` CHECK (
    `exam_NDate` IS NULL
    OR `exam_NDate` > `exam_Date`
  ),
  CONSTRAINT `character_Code` FOREIGN KEY (`character_Code`) REFERENCES `outpatient` (`character_Code`) ON DELETE CASCADE,
  CONSTRAINT `doctor_CodeE` FOREIGN KEY (`doctor_CodeE`) REFERENCES `doctor` (`emp_Code`) ON DELETE RESTRICT,
  CONSTRAINT `num_CodeE` FOREIGN KEY (`num_Code`) REFERENCES `outpatient` (`num_Code`) ON DELETE CASCADE
);
-- ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
--
-- Dumping data for table `examination`
--
-- LOCK TABLES `examination` WRITE;
-- UNLOCK TABLES;
--




-- Table structure for table `treatment`
--
-- DROP TABLE IF EXISTS `treatment`;
CREATE TABLE `treatment` (
  `character_Code` varchar(11) NOT NULL,
  `num_Code` varchar(9) NOT NULL,
  `treat_Code` varchar(4) NOT NULL,
  `doctor_CodeT` varchar(4) NOT NULL,
  `treat_SDate` date NOT NULL,
  `treat_EDate` date NOT NULL,
  `treat_Result` varchar(200) NOT NULL,
  `treat_RecoverStatus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (
    `character_Code`,
    `num_Code`,
    `treat_Code`,
    `doctor_CodeT`
  ),
  UNIQUE KEY `num_Code_UNIQUE` (`num_Code`),
  UNIQUE KEY `treat_Code_UNIQUE` (`treat_Code`),
  -- KEY `doctor_Code_idx` (`doctor_CodeT`),
  CONSTRAINT `character_CodeT` FOREIGN KEY (`character_Code`) REFERENCES `inpatient` (`character_Code`) ON DELETE CASCADE,
  CONSTRAINT `doctor_CodeT` FOREIGN KEY (`doctor_CodeT`) REFERENCES `doctor` (`emp_Code`) on DELETE RESTRICT,
  CONSTRAINT `num_CodeT` FOREIGN KEY (`num_Code`) REFERENCES `inpatient` (`num_Code`) ON DELETE CASCADE
);
-- ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
--
-- Dumping data for table `treatment`
--
-- LOCK TABLES `treatment` WRITE;
-- UNLOCK TABLES;



-- Table structure for table `applies_exam`
--
-- DROP TABLE IF EXISTS `applies_exam`;
CREATE TABLE `applies_exam` (
  `E_Pcharacter_Code` varchar(11) NOT NULL,
  `E_Pnum_Code` varchar(9) NOT NULL,
  `Exam_Code` varchar(4) NOT NULL,
  `Med_Code` varchar(5) NOT NULL,
  PRIMARY KEY (
    `E_Pnum_Code`,
    `E_Pcharacter_Code`,
    `Exam_Code`,
    `Med_Code`
  ),
  -- KEY `E.PCharacter_Code_idx` (`E_Pcharacter_Code`),
  KEY `Exam_Code_idx` (`Exam_Code`),
  -- KEY `Med_Code_idx` (`Med_Code`),
  CONSTRAINT `EMed_Code` FOREIGN KEY (`Med_Code`) REFERENCES `medication` (`med_Code`) ON DELETE RESTRICT,
  CONSTRAINT `EPCharacter_Code` FOREIGN KEY (`E_Pcharacter_Code`) REFERENCES `examination` (`character_Code`) ON DELETE CASCADE,
  CONSTRAINT `EPNum_Code` FOREIGN KEY (`E_Pnum_Code`) REFERENCES `examination` (`num_Code`) ON DELETE CASCADE,
  CONSTRAINT `Exam_Code` FOREIGN KEY (`Exam_Code`) REFERENCES `examination` (`exam_Code`) ON DELETE RESTRICT
);
-- ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
--
-- Dumping data for table `applies_exam`
--
-- LOCK TABLES `applies_exam` WRITE;
-- UNLOCK TABLES;
--

-- Table structure for table `applies_treat`
--
-- DROP TABLE IF EXISTS `applies_treat`;
CREATE TABLE `applies_treat` (
    `TCharacter_Code` varchar(11) NOT NULL,
    `TNum_Code` varchar(9) NOT NULL,
    `Treat_Code` varchar(4) NOT NULL,
    `TMed_Code` varchar(5) NOT NULL,
    PRIMARY KEY (
        `TNum_Code`,
        `TCharacter_Code`,
        `Treat_Code`,
        `TMed_Code`
    ),
    -- KEY `TCharacter_Code_idx` (`TCharacter_Code`),
    KEY `Treat_Code_idx` (`Treat_Code`),
    -- KEY `TMed_Code_idx` (`TMed_Code`),
    CONSTRAINT `TCharacter_Code` FOREIGN KEY (`TCharacter_Code`) REFERENCES `treatment` (`character_Code`) ON DELETE CASCADE,
    CONSTRAINT `TMed_Code` FOREIGN KEY (`TMed_Code`) REFERENCES `medication` (`med_Code`) ON DELETE RESTRICT,
    CONSTRAINT `TNum_Code` FOREIGN KEY (`TNum_Code`) REFERENCES `treatment` (`num_Code`) ON DELETE CASCADE,
    CONSTRAINT `Treat_Code` FOREIGN KEY (`Treat_Code`) REFERENCES `treatment` (`treat_Code`) ON DELETE CASCADE
);
-- ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
--
-- Dumping data for table `applies_treat`
--
-- LOCK TABLES `applies_treat` WRITE;
-- UNLOCK TABLES;
--
DELIMITER //
CREATE TRIGGER check_valid_import_date BEFORE INSERT ON import
FOR EACH ROW
BEGIN
    IF NEW.Imp_Date < '2000-01-01' OR NEW.Imp_Date > CURRENT_DATE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid import date. Import date must be between 2000-01-01 and the current date.';
    END IF;
END;
//
CREATE TRIGGER check_inpatient_dates BEFORE INSERT ON inpatient
FOR EACH ROW
BEGIN
    IF NEW.Date_Of_Admission < '2019-01-01' OR NEW.Date_Of_Admission > CURRENT_DATE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid admission date. Admission date must be between 2019-01-01 and the current date.';
    END IF;

    IF NEW.Date_Of_Discharge < NEW.Date_Of_Admission THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid discharge date. Discharge date must be after admission date.';
    END IF;
END;
//

CREATE TRIGGER check_treatment_dates BEFORE UPDATE ON treatment
FOR EACH ROW
BEGIN
    DECLARE admission DATE;
    DECLARE discharge DATE;
    SELECT inpatient.`Date_Of_Admission`, inpatient.`Date_Of_Discharge` INTO admission, discharge
    FROM inpatient
    WHERE inpatient.`num_Code` = NEW.num_Code;

    IF NEW.treat_SDate < '2019-01-01' OR NEW.treat_SDate < admission OR NEW.treat_SDate > discharge OR NEW.treat_SDate > NEW.treat_EDate THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid treatment dates.';
    END IF;

    IF NEW.treat_EDate < '2019-01-01' OR NEW.treat_EDate < admission OR NEW.treat_EDate > discharge THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid treatment dates.';
    END IF;
END;
//    

CREATE TRIGGER check_valid_expiration_date BEFORE UPDATE ON medication
FOR EACH ROW
BEGIN
    IF NEW.med_ExpDate < CURRENT_DATE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Medication expiration date cannot be in the past.';
    END IF;
END;
//
CREATE TRIGGER check_valid_exam_date BEFORE INSERT ON examination
FOR EACH ROW
BEGIN
    IF NEW.exam_NDate < NEW.exam_Date THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Exam date cannot be in the past.';
    END IF;
END;
//

CREATE TRIGGER check_valid_dean_exp BEFORE INSERT ON department 
FOR EACH ROW 
BEGIN
    DECLARE dean_exp INT;

    SELECT TIMESTAMPDIFF(YEAR, CURRENT_DATE, e.`emp_DegreesYear`) INTO dean_exp 
    FROM employee e WHERE e.`emp_Code` = NEW.dean_Code;

    IF dean_exp < 5 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Selected doctor is not qualified to be a dean.';
    END IF;
END;
//

DELIMITER ;
insert into department (dep_Code, dep_Title) values ('D01', 'Dermatologist');
insert into department (dep_Code, dep_Title) values ('D02', 'Cardiologist');
insert into department (dep_Code, dep_Title) values ('D03', 'Dermatologist');

insert into provider (prov_Code, prov_Name, prov_Phone, prov_Address) values (1001, 'Merck', '8373567378', '78 Springview Alley');
insert into provider (prov_Code, prov_Name, prov_Phone, prov_Address) values (1002, 'Novartis', '6587135554', '4 Hanover Street');
insert into provider (prov_Code, prov_Name, prov_Phone, prov_Address) values (1003, 'Johnson & Johnson', '8947181296', '56205 Morning Parkway');
insert into provider (prov_Code, prov_Name, prov_Phone, prov_Address) values (1004, 'Bayer', '0995990227', '827 Mandrake Place');
insert into provider (prov_Code, prov_Name, prov_Phone, prov_Address) values (1005, 'Johnson & Johnson', '4086359832', '091 Ludington Parkway');
insert into provider (prov_Code, prov_Name, prov_Phone, prov_Address) values (1006, 'AstraZeneca', '2565454148', '8 Mallard Park');
insert into provider (prov_Code, prov_Name, prov_Phone, prov_Address) values (1007, 'Novartis', '2710658000', '04279 Golden Leaf Avenue');
insert into provider (prov_Code, prov_Name, prov_Phone, prov_Address) values (1008, 'Sanofi', '8110555830', '2 Basil Drive');
insert into provider (prov_Code, prov_Name, prov_Phone, prov_Address) values (1009, 'AstraZeneca', '4270663859', '56 Arrowood Parkway');
insert into provider (prov_Code, prov_Name, prov_Phone, prov_Address) values (1010, 'Johnson & Johnson', '0679463539', '1396 Brown Center');

insert into employee (emp_Code, emp_DateOfBirth, emp_Address, emp_Speciality, emp_DegreesYear, emp_FName, emp_LName, emp_Phone, emp_Gender, emp_SDate, dep_Code) values ('E001', '1900-11-18', '1996 Kedzie Parkway', 'Surgery', 2000, 'Jacky', 'McCoid', '3038486848', 'Male', '2000-01-23', 'D03');
insert into employee (emp_Code, emp_DateOfBirth, emp_Address, emp_Speciality, emp_DegreesYear, emp_FName, emp_LName, emp_Phone, emp_Gender, emp_SDate, dep_Code) values ('E002', '1948-10-28', '0 Calypso Terrace', 'Internal Medicine', 2000, 'Wadsworth', 'Prazer', '5375686694', 'Male', '2000-05-24', 'D01');
insert into employee (emp_Code, emp_DateOfBirth, emp_Address, emp_Speciality, emp_DegreesYear, emp_FName, emp_LName, emp_Phone, emp_Gender, emp_SDate, dep_Code) values ('E003', '1914-10-23', '482 Thackeray Hill', 'Psychiatry', 2000, 'Gerri', 'Farries', '6751233064', 'Female', '2000-05-31', 'D01');
insert into employee (emp_Code, emp_DateOfBirth, emp_Address, emp_Speciality, emp_DegreesYear, emp_FName, emp_LName, emp_Phone, emp_Gender, emp_SDate, dep_Code) values ('E004', '1912-10-14', '203 Lake View Terrace', 'Internal Medicine', 2000, 'Early', 'Phoebe', '7927754673', 'Male', '2000-10-24', 'D03');
insert into employee (emp_Code, emp_DateOfBirth, emp_Address, emp_Speciality, emp_DegreesYear, emp_FName, emp_LName, emp_Phone, emp_Gender, emp_SDate, dep_Code) values ('E005', '1957-10-26', '2980 Debra Way', 'Anesthesiology', 2000, 'Rodrique', 'Seals', '5545030892', 'Male', '2000-03-18', 'D01');
insert into employee (emp_Code, emp_DateOfBirth, emp_Address, emp_Speciality, emp_DegreesYear, emp_FName, emp_LName, emp_Phone, emp_Gender, emp_SDate, dep_Code) values ('E006', '1964-01-18', '32201 Vera Court', 'Psychiatry', 2000, 'Colas', 'Senecaux', '3497075510', 'Male', '2000-07-13', 'D02');
insert into employee (emp_Code, emp_DateOfBirth, emp_Address, emp_Speciality, emp_DegreesYear, emp_FName, emp_LName, emp_Phone, emp_Gender, emp_SDate, dep_Code) values ('E007', '1919-12-03', '7777 Hollow Ridge Crossing', 'Dermatology', 2000, 'Glenden', 'Robertacci', '2376081765', 'Female', '2000-08-26', 'D02');
insert into employee (emp_Code, emp_DateOfBirth, emp_Address, emp_Speciality, emp_DegreesYear, emp_FName, emp_LName, emp_Phone, emp_Gender, emp_SDate, dep_Code) values ('E008', '1981-10-30', '69765 Talmadge Drive', 'Emergency Medicine', 2000, 'Leonard', 'Lailey', '3075928499', 'Female', '2000-05-24', 'D01');
insert into employee (emp_Code, emp_DateOfBirth, emp_Address, emp_Speciality, emp_DegreesYear, emp_FName, emp_LName, emp_Phone, emp_Gender, emp_SDate, dep_Code) values ('E009', '1949-11-13', '45554 Elka Center', 'Surgery', 2000, 'My', 'Sandes', '1799900665', 'Male', '2000-12-27', 'D01');
insert into employee (emp_Code, emp_DateOfBirth, emp_Address, emp_Speciality, emp_DegreesYear, emp_FName, emp_LName, emp_Phone, emp_Gender, emp_SDate, dep_Code) values ('E010', '1937-09-20', '609 Lyons Circle', 'Dermatology', 2000, 'Avictor', 'Girardin', '2819497389', 'Male', '2000-09-05', 'D02');

insert into doctor (doctor_Code) values ('E001');
insert into doctor (doctor_Code) values ('E002');
insert into doctor (doctor_Code) values ('E003');
insert into doctor (doctor_Code) values ('E004');
insert into doctor (doctor_Code) values ('E005');

insert into nurse (emp_Code) values ('E006');
insert into nurse (emp_Code) values ('E007');
insert into nurse (emp_Code) values ('E008');
insert into nurse (emp_Code) values ('E009');
insert into nurse (emp_Code) values ('E010');

update department set dean_code = 'E004' where dep_code = 'D01';
update department set dean_code = 'E001' where dep_code = 'D02';
update department set dean_code = 'E003' where dep_code = 'D03';

insert into medication (med_Code, med_Name, med_Effects, med_ExpDate, med_Fee) values ('MED01', 'Healing Waters Lemon Verbena Hand Sanitizer', 'Closed reduction of fracture without internal fixation, other specified bone', '2045-04-29', 20.13);
insert into medication (med_Code, med_Name, med_Effects, med_ExpDate, med_Fee) values ('MED02', 'care one miconazole 7', 'Other reimplantation of ovary', '2046-05-17', 20.13);
insert into medication (med_Code, med_Name, med_Effects, med_ExpDate, med_Fee) values ('MED03', 'Personal Care Products petroleum', 'Other diagnostic procedures on orbit and eyeball', '2030-09-23', 20.13);
insert into medication (med_Code, med_Name, med_Effects, med_ExpDate, med_Fee) values ('MED04', 'Zaleplon', 'Removal of intraluminal foreign body from esophagus without incision', '2026-11-11', 20.13);
insert into medication (med_Code, med_Name, med_Effects, med_ExpDate, med_Fee) values ('MED05', 'Hydrocodone Bitartrate and Ibuprofen', 'Other excision or destruction of lesion of uterus', '2049-01-07', 20.13);
insert into medication (med_Code, med_Name, med_Effects, med_ExpDate, med_Fee) values ('MED06', 'HEPAR SULPHURIS CALCAREUM', 'Other repair of joint', '2037-08-28', 20.13);
insert into medication (med_Code, med_Name, med_Effects, med_ExpDate, med_Fee) values ('MED07', 'Terazosin Hydrochloride', 'Replacement of ureterostomy tube', '2033-03-25', 20.13);
insert into medication (med_Code, med_Name, med_Effects, med_ExpDate, med_Fee) values ('MED08', 'Hydrocodone Bitartrate and Ibuprofen', 'Thoracoscopic pneumonectomy', '2031-12-28', 20.13);
insert into medication (med_Code, med_Name, med_Effects, med_ExpDate, med_Fee) values ('MED09', 'White Mulberry', 'Destruction of rectal lesion or tissue by cryosurgery', '2026-09-21', 20.13);
insert into medication (med_Code, med_Name, med_Effects, med_ExpDate, med_Fee) values ('MED10', 'Degree Clinical Protection Shower Clean', 'Other operations on the breast', '2031-03-06', 20.13);

insert into import (prov_Code, med_Code, imp_Date, Quantity, Price) values (1001, 'MED01', '2001-12-22', 2750, 595.25);
insert into import (prov_Code, med_Code, imp_Date, Quantity, Price) values (1002, 'MED02', '2000-02-02', 1639, 129.42);
insert into import (prov_Code, med_Code, imp_Date, Quantity, Price) values (1003, 'MED03', '2000-06-10', 1073, 476.56);
insert into import (prov_Code, med_Code, imp_Date, Quantity, Price) values (1004, 'MED04', '2001-11-06', 670, 359.64);
insert into import (prov_Code, med_Code, imp_Date, Quantity, Price) values (1005, 'MED05', '2001-06-16', 1835, 710.68);
insert into import (prov_Code, med_Code, imp_Date, Quantity, Price) values (1006, 'MED06', '2001-03-06', 1448, 712.20);
insert into import (prov_Code, med_Code, imp_Date, Quantity, Price) values (1007, 'MED07', '2001-03-22', 890, 697.62);
insert into import (prov_Code, med_Code, imp_Date, Quantity, Price) values (1008, 'MED08', '2001-11-04', 378, 173.64);
insert into import (prov_Code, med_Code, imp_Date, Quantity, Price) values (1009, 'MED09', '2001-08-12', 3196, 340.58);
insert into import (prov_Code, med_Code, imp_Date, Quantity, Price) values (1010, 'MED10', '2000-07-24', 3614, 657.33);

insert into patient ( num_Code, patient_FName, patient_LName, patient_Address, patient_DateOfBirth, patient_Gender, patient_Phone) values ('000000001','Katrinka','Tinghill','4 Beilfuss Circle','1901-11-04','Unknown','6358713791');
insert into patient ( num_Code, patient_FName, patient_LName, patient_Address, patient_DateOfBirth, patient_Gender, patient_Phone) values ('000000002','Daisie','Buterton','56 Morning Lane','1909-08-28','Female','9426050233');
insert into patient ( num_Code, patient_FName, patient_LName, patient_Address, patient_DateOfBirth, patient_Gender, patient_Phone) values ('000000003','Ian','Ebbings','6 Northfield Alley','2006-02-15','Male','1537332035');
insert into patient ( num_Code, patient_FName, patient_LName, patient_Address, patient_DateOfBirth, patient_Gender, patient_Phone) values ('000000004','Findley','Troker','2 Sycamore Drive','1926-07-02','Male','8363086062');
insert into patient ( num_Code, patient_FName, patient_LName, patient_Address, patient_DateOfBirth, patient_Gender, patient_Phone) values ('000000005','Glynnis','Claque','7585 Onsgard Plaza','1984-01-03','Female','1759543351');
insert into patient ( num_Code, patient_FName, patient_LName, patient_Address, patient_DateOfBirth, patient_Gender, patient_Phone) values ('000000006','Nowell','Arblaster','89 Prairie Rose Park','2002-12-25','Male','8091582850');
insert into patient ( num_Code, patient_FName, patient_LName, patient_Address, patient_DateOfBirth, patient_Gender, patient_Phone) values ('000000007','Opaline','Chapier','9 Nancy Drive','1983-09-29','Female','7975628619');
insert into patient ( num_Code, patient_FName, patient_LName, patient_Address, patient_DateOfBirth, patient_Gender, patient_Phone) values ('000000008','Rudiger','Winspurr','22191 Farwell Place','1946-10-02','Male','1315678452');
insert into patient ( num_Code, patient_FName, patient_LName, patient_Address, patient_DateOfBirth, patient_Gender, patient_Phone) values ('000000009','Jill','Rudland','064 Hanson Street','1930-11-26','Female','9424280976');
insert into patient ( num_Code, patient_FName, patient_LName, patient_Address, patient_DateOfBirth, patient_Gender, patient_Phone) values ('000000010','Elbertina','Cordier','5485 Macpherson Place','1910-06-21','Female','5289329122');

insert into outpatient (character_Code, num_Code) values ('OP000000001', '000000001');
insert into outpatient (character_Code, num_Code) values ('OP000000002', '000000002');
insert into outpatient (character_Code, num_Code) values ('OP000000003', '000000003');
insert into outpatient (character_Code, num_Code) values ('OP000000004', '000000004');
insert into outpatient (character_Code, num_Code) values ('OP000000005', '000000005');

insert into inpatient (character_Code, num_Code, Date_Of_Admission, Date_Of_Discharge, Fee, Diagnosis, Sickroom, nurse_Code) values ('IP000000006', '000000006', '2021-10-20', '2022-12-06', 63.40, 'External constriction of unspecified shoulder, sequela', '09', 'E009');
insert into inpatient (character_Code, num_Code, Date_Of_Admission, Date_Of_Discharge, Fee, Diagnosis, Sickroom, nurse_Code) values ('IP000000007', '000000007', '2021-10-25', '2023-12-09', 51.37, 'Poisoning by digestants, intentional self-harm, init encntr', '09', 'E008');
insert into inpatient (character_Code, num_Code, Date_Of_Admission, Date_Of_Discharge, Fee, Diagnosis, Sickroom, nurse_Code) values ('IP000000008', '000000008', '2021-12-10', '2023-08-31', 68.60, 'Other congenital malformations of pulmonary valve', '07', 'E006');
insert into inpatient (character_Code, num_Code, Date_Of_Admission, Date_Of_Discharge, Fee, Diagnosis, Sickroom, nurse_Code) values ('IP000000009', '000000009', '2021-12-10', '2022-11-11', 62.03, 'Unspecified Zone II fracture of sacrum, sequela', '03', 'E010');
insert into inpatient (character_Code, num_Code, Date_Of_Admission, Date_Of_Discharge, Fee, Diagnosis, Sickroom, nurse_Code) values ('IP000000010', '000000010', '2021-10-28', '2023-07-14', 95.63, 'Unsp physeal fracture of lower end of unspecified femur', '06', 'E006');

insert into examination (character_Code, num_Code, exam_Code, doctor_CodeE, exam_Diagnosis, exam_Fee, exam_Date, exam_NDate) values ('OP000000001', '000000001', 'EX01', 'E001', 'Laceration of duodenum', 80.06, '2021-10-02', null);
insert into examination (character_Code, num_Code, exam_Code, doctor_CodeE, exam_Diagnosis, exam_Fee, exam_Date, exam_NDate) values ('OP000000002', '000000002', 'EX02', 'E001', 'Underdosing of macrolides, sequela', 50.65, '2021-12-01', '2022-02-17');
insert into examination (character_Code, num_Code, exam_Code, doctor_CodeE, exam_Diagnosis, exam_Fee, exam_Date, exam_NDate) values ('OP000000003', '000000003', 'EX03', 'E005', 'Nondisp fx of lateral malleolus of unsp fibula, 7thG', 77.14, '2021-10-03', '2022-04-13');
insert into examination (character_Code, num_Code, exam_Code, doctor_CodeE, exam_Diagnosis, exam_Fee, exam_Date, exam_NDate) values ('OP000000004', '000000004', 'EX04', 'E001', 'Other specified perinatal digestive system disorders', 77.02, '2021-06-29', null);
insert into examination (character_Code, num_Code, exam_Code, doctor_CodeE, exam_Diagnosis, exam_Fee, exam_Date, exam_NDate) values ('OP000000005', '000000005', 'EX05', 'E001', 'Nursemaid''s elbow, unspecified elbow, sequela', 86.82, '2021-12-16', '2022-12-27');

insert into treatment (character_Code, num_Code, treat_Code, doctor_CodeT, treat_SDate, treat_EDate, treat_Result, treat_RecoverStatus) values ('IP000000006', '000000006', 'TR01', 'E004', '2021-06-07', '2022-06-29', 'Introduce Monoclonal Antibody in Cran Cav/Brain, Via Opening', 'Transfered');
insert into treatment (character_Code, num_Code, treat_Code, doctor_CodeT, treat_SDate, treat_EDate, treat_Result, treat_RecoverStatus) values ('IP000000007', '000000007', 'TR02', 'E004', '2021-09-14', '2022-07-06', 'Extirpation of Matter from Oculomotor Nerve, Open Approach', 'Transfered');
insert into treatment (character_Code, num_Code, treat_Code, doctor_CodeT, treat_SDate, treat_EDate, treat_Result, treat_RecoverStatus) values ('IP000000008', '000000008', 'TR03', 'E003', '2021-05-08', '2022-10-20', 'Supplement Right 2nd Toe with Autol Sub, Perc Endo Approach', 'Recovered');
insert into treatment (character_Code, num_Code, treat_Code, doctor_CodeT, treat_SDate, treat_EDate, treat_Result, treat_RecoverStatus) values ('IP000000009', '000000009', 'TR04', 'E003', '2021-10-08', '2022-07-11', 'Division of Left Ulna, Open Approach', 'Recovered');
insert into treatment (character_Code, num_Code, treat_Code, doctor_CodeT, treat_SDate, treat_EDate, treat_Result, treat_RecoverStatus) values ('IP000000010', '000000010', 'TR05', 'E002', '2021-07-18', '2022-03-10', 'Fusion 2-7 T Jt w Intbd Fus Dev, Post Appr P Col, Open', 'Transfered');

insert into applies_exam (E_Pcharacter_Code, E_Pnum_Code, Exam_Code, Med_Code) values ('OP000000001', '000000001', 'EX01', 'MED09');
insert into applies_exam (E_Pcharacter_Code, E_Pnum_Code, Exam_Code, Med_Code) values ('OP000000002', '000000002', 'EX02', 'MED02');
insert into applies_exam (E_Pcharacter_Code, E_Pnum_Code, Exam_Code, Med_Code) values ('OP000000003', '000000003', 'EX03', 'MED06');
insert into applies_exam (E_Pcharacter_Code, E_Pnum_Code, Exam_Code, Med_Code) values ('OP000000004', '000000004', 'EX04', 'MED07');
insert into applies_exam (E_Pcharacter_Code, E_Pnum_Code, Exam_Code, Med_Code) values ('OP000000005', '000000005', 'EX05', 'MED09');

insert into applies_treat (TCharacter_Code, TNum_Code, Treat_Code, TMed_Code) values ('IP000000006', '000000006', 'TR01', 'MED03');
insert into applies_treat (TCharacter_Code, TNum_Code, Treat_Code, TMed_Code) values ('IP000000007', '000000007', 'TR02', 'MED03');
insert into applies_treat (TCharacter_Code, TNum_Code, Treat_Code, TMed_Code) values ('IP000000008', '000000008', 'TR03', 'MED05');
insert into applies_treat (TCharacter_Code, TNum_Code, Treat_Code, TMed_Code) values ('IP000000009', '000000009', 'TR04', 'MED06');
insert into applies_treat (TCharacter_Code, TNum_Code, Treat_Code, TMed_Code) values ('IP000000010', '000000010', 'TR05', 'MED10');


-- Patient treatment
create VIEW pat_treat as
SELECT *
from patient
    join treatment using (num_code);
-- Patient examination
CREATE VIEW pat_exam AS
SELECT *
FROM patient
    JOIN examination USING(num_code);
-- Patient treatments
create view pat_treats as
SELECT patient.num_Code,
    exam_diagnosis,
    exam_fee,
    exam_date,
    exam_ndate,
    NULL AS treat_sdate,
    NULL AS treat_edate,
    NULL AS treat_result,
    NULL AS treat_recoverstatus
FROM patient
    JOIN examination ON patient.num_code = examination.num_code
UNION
SELECT patient.num_Code,
    NULL AS exam_diagnosis,
    NULL AS exam_fee,
    NULL AS exam_date,
    NULL AS exam_ndate,
    treat_sdate,
    treat_edate,
    treat_result,
    treat_recoverstatus
FROM patient
    JOIN treatment ON patient.num_code = treatment.num_code;
-- applied Medications
CREATE VIEW applied_med AS
SELECT applies_exam.E_Pnum_Code,
    applies_exam.Exam_Code AS Treat_code,
    applies_exam.Med_Code,
    medication.med_Name,
    medication.med_Fee
FROM applies_exam
    JOIN medication ON applies_exam.Med_Code = medication.med_Code
UNION
SELECT applies_treat.TNum_Code,
    applies_treat.Treat_Code,
    applies_treat.TMed_Code,
    medication.med_Name,
    medication.med_Fee
FROM applies_treat
    JOIN medication ON applies_treat.TMed_Code = medication.med_Code;
-- Payment info
CREATE VIEW pay AS
SELECT patient.num_Code,
    COALESCE(SUM(examination.exam_Fee), 0) AS exam_fee,
    COALESCE(inpatient.Fee, 0) AS treatm_fee,
    (
        COALESCE(SUM(examination.exam_Fee), 0) + COALESCE(inpatient.Fee, 0) + COALESCE(SUM(applied_med.Med_fee), 0)
    ) AS Total_fee,
    COALESCE(SUM(applied_med.Med_fee), 0) AS medication_fee
FROM patient
    LEFT JOIN examination ON patient.num_Code = examination.num_Code
    LEFT JOIN inpatient ON patient.num_Code = inpatient.num_Code
    LEFT JOIN applied_med ON patient.num_Code = applied_med.E_Pnum_Code
GROUP BY patient.num_Code;