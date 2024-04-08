DELIMITER //
 CREATE PROCEDURE DOCTOR_NOP (IN STARTD VARCHAR(10), IN ENDD VARCHAR(10)) BEGIN
SELECT
    doctor_Code,
    emp_FName,
    emp_LName,
    COUNT(`doctor_Code`) as Numo_patient
FROM
    (
        SELECT
            ex.doctor_Code,
            e.emp_FName,
            e.emp_LName,
            ex.num_code
        FROM
            employee e
            JOIN examination ex ON e.emp_Code = ex.doctor_Code
        WHERE
            (
                ex.exam_Date > startD
                AND ex.exam_Date < endD
            )
            OR (
                ex.exam_NDate > startD
                AND ex.exam_NDate < endD
            )
        UNION
        SELECT
            t.doctor_CodeT,
            e.emp_FName,
            e.emp_LName,
            t.num_code
        FROM
            employee e
            JOIN treatment t ON e.emp_Code = t.doctor_CodeT
        WHERE
            (t.treat_SDate > startD)
            AND (
                t.treat_EDate IS NULL
                OR t.treat_EDate < endD
            )
    ) AS doctor_workload
GROUP BY
    `doctor_Code`
ORDER BY
    Numo_patient;

END // DELIMITER ;