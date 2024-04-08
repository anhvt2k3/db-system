
insert into department (dep_Code, dep_Title, dean_Code) values ('D01', 'Dermatologist', 'E004');
insert into department (dep_Code, dep_Title, dean_Code) values ('D02', 'Cardiologist', 'E001');
insert into department (dep_Code, dep_Title, dean_Code) values ('D03', 'Dermatologist', 'E003');

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

insert into doctor (emp_Code) values ('E001');
insert into doctor (emp_Code) values ('E002');
insert into doctor (emp_Code) values ('E003');
insert into doctor (emp_Code) values ('E004');
insert into doctor (emp_Code) values ('E005');

insert into nurse (emp_Code) values ('E006');
insert into nurse (emp_Code) values ('E007');
insert into nurse (emp_Code) values ('E008');
insert into nurse (emp_Code) values ('E009');
insert into nurse (emp_Code) values ('E010');

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

insert into patient ( patient_Code, patient_FName, patient_LName, patient_Address, patient_DateOfBirth, patient_Gender, patient_Phone) values ('000000001','Katrinka','Tinghill','4 Beilfuss Circle','1901-11-04','Unknown','6358713791');
insert into patient ( patient_Code, patient_FName, patient_LName, patient_Address, patient_DateOfBirth, patient_Gender, patient_Phone) values ('000000002','Daisie','Buterton','56 Morning Lane','1909-08-28','Female','9426050233');
insert into patient ( patient_Code, patient_FName, patient_LName, patient_Address, patient_DateOfBirth, patient_Gender, patient_Phone) values ('000000003','Ian','Ebbings','6 Northfield Alley','2006-02-15','Male','1537332035');
insert into patient ( patient_Code, patient_FName, patient_LName, patient_Address, patient_DateOfBirth, patient_Gender, patient_Phone) values ('000000004','Findley','Troker','2 Sycamore Drive','1926-07-02','Male','8363086062');
insert into patient ( patient_Code, patient_FName, patient_LName, patient_Address, patient_DateOfBirth, patient_Gender, patient_Phone) values ('000000005','Glynnis','Claque','7585 Onsgard Plaza','1984-01-03','Female','1759543351');
insert into patient ( patient_Code, patient_FName, patient_LName, patient_Address, patient_DateOfBirth, patient_Gender, patient_Phone) values ('000000006','Nowell','Arblaster','89 Prairie Rose Park','2002-12-25','Male','8091582850');
insert into patient ( patient_Code, patient_FName, patient_LName, patient_Address, patient_DateOfBirth, patient_Gender, patient_Phone) values ('000000007','Opaline','Chapier','9 Nancy Drive','1983-09-29','Female','7975628619');
insert into patient ( patient_Code, patient_FName, patient_LName, patient_Address, patient_DateOfBirth, patient_Gender, patient_Phone) values ('000000008','Rudiger','Winspurr','22191 Farwell Place','1946-10-02','Male','1315678452');
insert into patient ( patient_Code, patient_FName, patient_LName, patient_Address, patient_DateOfBirth, patient_Gender, patient_Phone) values ('000000009','Jill','Rudland','064 Hanson Street','1930-11-26','Female','9424280976');
insert into patient ( patient_Code, patient_FName, patient_LName, patient_Address, patient_DateOfBirth, patient_Gender, patient_Phone) values ('000000010','Elbertina','Cordier','5485 Macpherson Place','1910-06-21','Female','5289329122');

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
insert into applies_treat (TCharacter_Code, TNum_Code, Treat_Code, TMed_Code) values ('IP000000010', '000000010', 'TR05', 'MED10');+