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
    IF NEW.exam_Date < CURRENT_DATE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Exam date cannot be in the past.';
    END IF;
END;
//

CREATE TRIGGER check_valid_dean_exp BEFORE INSERT ON department
FOR EACH ROW
BEGIN
    DECLARE dean_exp INT;
    SELECT INTERVAL (e.`emp_DegreesYear` - CURRENT_DATE) YEAR 
    FROM `hospital-db`.employee e WHERE e.`emp_Code` = NEW.dean_Code
    INTO dean_exp;

    IF dean_exp < 5 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Selected doctor is not qualified to be a dean.';
    END IF;
END;
//


DELIMITER ;