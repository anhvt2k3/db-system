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