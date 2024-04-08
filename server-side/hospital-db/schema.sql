
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
  `emp_Code` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`emp_Code`),
  UNIQUE KEY `emp_Code_UNIQUE` (`emp_Code`),
  CONSTRAINT `emp_CodeD` FOREIGN KEY (`emp_Code`) REFERENCES `employee` (`emp_Code`)
);
-- ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
--
-- Dumping data for table `doctor`
--
-- LOCK TABLES `doctor` WRITE;
-- UNLOCK TABLES;
--

-- Table structure for table `department`
--
-- DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
    `dep_Code` VARCHAR(3) NOT NULL,
    `dep_Title` varchar(45) NOT NULL,
    `dean_Code` VARCHAR(4) NOT NULL,
    PRIMARY KEY (`dep_Code`),
    UNIQUE KEY `dep_Code_UNIQUE` (`dep_Code`),
    CONSTRAINT `fk_dean_Code` FOREIGN KEY (`dean_Code`) REFERENCES `doctor` (`emp_Code`) ON DELETE CASCADE,
    KEY `emp_CodeD_idx` (`dean_Code`)
);
-- ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
--
-- Dumping data for table `department`
--
-- LOCK TABLES `department` WRITE;
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
  `patient_Code` VARCHAR(9) NOT NULL,
  `patient_FName` varchar(45) NOT NULL,
  `patient_LName` varchar(45) NOT NULL,
  `patient_Address` varchar(45) NOT NULL,
  `patient_DateOfBirth` date NOT NULL,
  `patient_Gender` enum('Male','Female','Unknown') NOT NULL DEFAULT 'Unknown',
  `patient_Phone` varchar(10) NOT NULL,
  PRIMARY KEY (`patient_Code`),
  UNIQUE KEY `patient_Phone_UNIQUE` (`patient_Phone`),
  UNIQUE KEY `patient_Code_UNIQUE` (`patient_Code`)
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
  CONSTRAINT `num_Code` FOREIGN KEY (`num_Code`) REFERENCES `patient` (`patient_Code`) ON DELETE CASCADE
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
  CONSTRAINT `num_CodeI` FOREIGN KEY (`num_Code`) REFERENCES `patient` (`patient_Code`) ON DELETE CASCADE,
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
