import React, { useState, useEffect } from "react"
import Papa from 'papaparse'
import { COLORS, SIZES, STYLES, SHADOW } from "../../../../constants"
import './style.css'

// Search patient information: Search results include the name, phone number and information about the treatment and visit of the patient

// List details of all patients which are treated by a doctor

// each treatment or examination of a patient

// Select all the patients(outpatient & inpatient) of the doctor named ‘Nguyen Van A’

// function to calculate the total medication price a patient has to pay foreach treatment or examination
// Input: Patient ID
// Output: A list of payment of each treatment or examination

// procedure to sort the doctor in increasing number of patients he/she takes care in a period of time 
// Input: Start date, End date
// Output: A list of sorting doctors
export const Inspect = () => {
    const [IsPatient, setIsPatient] = useState(true)
    // TyoeM for type of Main table, TypeS for type of Sub table
    // TypeM = 0  for patient, 1 for doctor
    // TypeS = 2 for patient's info, 3 for patients of doctor
    const [TypeM, setTypeM] = useState(0)
    const [TypeS, setTypeS] = useState(2)
    const [Linkfetch, setLinkfetch] = useState('http://localhost/hospital-demo/inspect.php')
    // Data for Main table
    const [Fields, setFields] = useState(['id', 'name', 'age', 'city']);
    const [Rows, setRows] = useState([
        [1, 'John Doe', 25, 'New York'],
        [2, 'Jane Doe', 30, 'San Francisco'],
        [3, 'Bob Smith', 28, 'Los Angeles'],
    ])
    // Data for Sub Table
    const [RQuery, setRQuery] = useState('http://localhost/hospital-demo/')
    const [RQ_Fields, setRQ_Fields] = useState([])
    const [RQ_Rows, setRQ_Rows] = useState([])

    const [ReportShow, setReportShow] = useState(false)
    const [Title, setTitle] = useState({
        name: '',
        phone: '',
        address: '',
    })
    const [Exams, setExams] = useState({
        fields: [],
        rows: [],
    })
    const [Treats, setTreats] = useState({
        fields: [],
        rows: [],
    })
    const [Inpatient, setInpatient] = useState({
        fields: [],
        rows: [],
    })
    const [TotalFee, setTotalFee] = useState({
        fields: [],
        rows: [[]],
    })
    const [Medications, setMedications] = useState({
        fields: [],
        rows: [[]],
    })
    const [PayLink, setPayLink] = useState({
        Exams: 'http://localhost/hospital-demo/',
        Treats: 'http://localhost/hospital-demo/',
        Inpatient: 'http://localhost/hospital-demo/',
        Medications: 'http://localhost/hospital-demo/',
        Fee: 'http://localhost/hospital-demo/',
    })
    const sets = {
        setTitle,
        setPayLink,
    }

    useEffect(() => {
        const fetchData = async (setter, link) => {
            try {
                console.log(link);
                const response = await fetch(link);
                if (!response.ok) {
                }
                const csvData = await response.text();
                const parsedData = Papa.parse(
                    csvData,
                    {
                        header: true,
                        dynamicTyping: true,
                        complete: (results) => {
                            const formattedData = results.data.map(row =>
                                Object.values(row))
                            console.log(formattedData);
                            setter((prev) => ({
                                ...prev,
                                rows: formattedData,
                            }))
                        },
                    });
                console.log(parsedData.meta.fields);
                setter((prev) => ({
                    ...prev,
                    fields: parsedData.meta.fields,
                }))
            } catch (err) {
                console.error("Error Reading data", err);
            }
        };
        fetchData(setExams, PayLink.Exams);
        fetchData(setTreats, PayLink.Treats);
        fetchData(setInpatient, PayLink.Inpatient);
        fetchData(setTotalFee, PayLink.Fee);
        fetchData(setMedications, PayLink.Medications);
    }, [PayLink]);

    useEffect(() => {
        const fetchData = async () => {
            try {
                console.log(RQuery);
                const response = await fetch(RQuery);
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                const csvData = await response.text();
                const parsedData = Papa.parse(
                    csvData,
                    {
                        header: true,
                        dynamicTyping: true,
                        complete: (results) => {
                            const formattedData = results.data.map(row =>
                                Object.values(row))
                            console.log(formattedData);
                            setRQ_Rows(formattedData);
                        },
                    });
                console.log(parsedData.meta.fields);
                setRQ_Fields(parsedData.meta.fields);
            } catch (err) {
                console.error("Error Reading data", err);
            }
        };
        fetchData();
    }, [RQuery]);

    useEffect(() => {
        const fetchData = async () => {
            try {
                const response = await fetch(Linkfetch);
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                const csvData = await response.text();
                const parsedData = Papa.parse(
                    csvData,
                    {
                        header: true,
                        dynamicTyping: true,
                        complete: (results) => {
                            const formattedData = results.data.map(row =>
                                Object.values(row))
                            console.log(formattedData);
                            setRows(formattedData);
                        },
                    });
                console.log(parsedData.meta.fields);
                setFields(parsedData.meta.fields);
            } catch (err) {
                console.error("Error Reading data", err);
            }
        };
        fetchData();
    }, [Linkfetch]);

    return (
        <div
            className='contentScreens'
            style={{
                backgroundColor: COLORS.Inspect,
            }}>
            <div className="row inspect-">
                <div className='inspect-view inspect-table'
                    style={{
                        width: '70%',
                        height: 'fit-content',
                    }}>

                    <Table fields={Fields} rows={Rows} type={TypeM} setRQuery={setRQuery} setPQuery={sets} turnReport={setReportShow} />

                </div>

                <div className='inspect-view inspect-query'
                    style={{
                        width: '20%',
                        height: 'fit-content',
                    }}>
                    <div className="row spc-even">
                        <div className="field-switch"
                            style={{ opacity: IsPatient ? '1' : '0.5', }}
                            onClick={() => {
                                setIsPatient(true)
                                setLinkfetch("http://localhost/hospital-demo/inspect.php?&table=patient")
                                setTypeM(0)
                                setTypeS(2)
                                setRQ_Fields([])
                                setRQ_Rows([])
                                setReportShow(false)
                                setTitle({
                                    name: '',
                                    phone: '',
                                    address: '',
                                })
                            }}>Patient</div>

                        <div className="separator"></div>

                        <div className="field-switch"
                            style={{ opacity: IsPatient ? '0.5' : '1', }}
                            onClick={() => {
                                setIsPatient(false)
                                setLinkfetch("http://localhost/hospital-demo/inspect.php?&table=doctor")
                                setTypeM(1)
                                setTypeS(3)
                                setRQ_Fields([])
                                setRQ_Rows([])
                                setReportShow(false)
                                setTitle({
                                    name: '',
                                    phone: '',
                                    address: '',
                                })
                            }}>Employee</div>
                    </div>
                    <div>
                        {IsPatient ? <FieldPatient IsPatient={IsPatient} setLinkfetch={setLinkfetch} /> : <FieldEmploy IsPatient={IsPatient} setLinkfetch={setLinkfetch} />}
                    </div>
                </div>
            </div>
            <div style={{
                marginTop: '10px',
                display: 'flex',
                flexDirection: 'column',
            }}>
                <span style={{
                    fontSize: '20px',
                }}
                > Visits information</span>
                <div style={{border: '1px solid black', width: 'fit-content', padding: '5px'}}>
                <Table fields={RQ_Fields} rows={RQ_Rows} type={TypeS} />
                </div>
            </div>
            <div className="report"
                style={{ display: ReportShow ? 'block' : 'none' }}
            >
                <Report AppliedMed={Medications} TotalFee={TotalFee} Title={Title} Exams={Exams} Treats={Treats} Inpatient={Inpatient} />
            </div>
        </div >
    )
}

const FieldPatient = ({ IsPatient, setLinkfetch }) => {
    return (
        <div>
            <QueryForm IsPatient={IsPatient} setLinkfetch={setLinkfetch} />
        </div>
    )
}

const FieldEmploy = ({ IsPatient, setLinkfetch }) => {
    const [IsNurse, setIsNurse] = useState(false)

    return (
        <div>
            <div className="row spc-even">
                <div className="field-employ-switch"
                    style={{
                        backgroundColor: COLORS.SUCCESS,
                        opacity: IsNurse ? '1' : '0.5',
                    }}
                    onClick={() => {
                        setIsNurse(true)
                        setLinkfetch("http://localhost/hospital-demo/inspect.php?&table=nurse")
                    }}>Nurse</div>
                <div className="field-employ-switch"
                    style={{
                        backgroundColor: COLORS.SUCCESS,
                        opacity: IsNurse ? '0.5' : '1',
                    }}
                    onClick={() => {
                        setIsNurse(false)
                        setLinkfetch("http://localhost/hospital-demo/inspect.php?&table=doctor")
                    }}>Doctor</div>
            </div>
            <QueryForm IsNurse={IsNurse} IsPatient={IsPatient} setLinkfetch={setLinkfetch} />
        </div>
    )
}

const QueryForm = ({ IsNurse, IsPatient, setLinkfetch }) => {
    const [QName, setQName] = useState('')
    const [QId, setQId] = useState('')
    const [QDate, setQDate] = useState('')
    const [QNumber, setQNumber] = useState('')

    const handleSubmit = (event) => {
        event.preventDefault();
        let query = 'http://localhost/hospital-demo/inspect.php?'
        const table = '&table=' + (IsPatient ? 'patient' : (IsNurse ? 'nurse' : 'doctor'))
        const Name = (/\S/.test(QName) ? '&name=' + QName : '');
        const Id = (/\S/.test(QId) ? '&id=' + QId : '');
        const Date = (/\S/.test(QDate) ? '&date=' + QDate : '');
        const Number = (/\S/.test(QNumber) ? '&number=' + QNumber : '');
        query = query + table + Name + Id + Date + Number

        console.log(query)
        setLinkfetch(query)
    }

    return (
        <form className="query-form" onSubmit={handleSubmit}>
            <label>
                Name
                <input
                    type="text"
                    name="condition"
                    placeholder={'Enter name...'}
                    value={QName}
                    onChange={(e) => setQName(e.target.value)}
                />
            </label>
            <label>
                Id
                <input
                    type="text"
                    name="condition"
                    placeholder={'Enter Id...'}
                    value={QId}
                    onChange={(e) => setQId(e.target.value)}
                />
            </label>
            <label>
                Date
                <input
                    type="text"
                    name="condition"
                    placeholder={'Enter Date...'}
                    value={QDate}
                    onChange={(e) => setQDate(e.target.value)}
                />
            </label>
            <label>
                Number
                <input
                    type="text"
                    name="condition"
                    placeholder={'Enter Number...'}
                    value={QNumber}
                    onChange={(e) => setQNumber(e.target.value)}
                />
            </label>
            <button className="query-btn-submit"
                style={{ backgroundColor: COLORS.SECONDARY, color: COLORS.TEXT, }}
                type="submit"
            >Query</button>
        </form>
    )
}
/*
FORMAT
 Name <fname> <lname> Date of birth <dob> Phone <phone> Address <address>

 Treatments:

 Examination:                                  Treatment:
...<medications>                               ...<list of treatment>
...<list of exam>                              ...<medications>    
                                                ...<inpatient fields>
                                                Fee: <fee>
*/
const Report = ({ Exams, Treats, Inpatient, Title, TotalFee, AppliedMed }) => {
    return (
        <div
            className='contentScreens'
            style={{
                backgroundColor: COLORS.Report, display: 'flex', flexDirection: 'column',
            }}>
            <span style={{
                alignSelf: 'center', fontSize: '40px',
            }}>
                Payment report
            </span>
            <div className="report-title"
                style={{
                }}
            >
                <div className="fields">Name: <span>{Title.name}</span></div>
                <div className="fields">Phone: <span>{Title.phone}</span></div>
                <div className="fields">Address: <span>{Title.address}</span></div>
            </div>
            <div style={{ marginTop: '10px', marginBottom: '5px', borderBottom: '1px solid black', }}>
                <span style={{ fontSize: '25px', }}>
                    Treatments
                </span>
            </div>
            <div className="applied-med" style={{ marginTop: '10px', marginBottom: '25px', }}>
                <span style={{ fontSize: '15px', }}>Medications</span>
                <Table fields={AppliedMed.fields} rows={AppliedMed.rows} type={2} />
                <div className="total-fee">
                    Total <span
                        style={{ fontWeight: 'bold' }}>${TotalFee.rows[0][4]}</span>
                </div>
            </div>
            <div className="report-treatments"
                style={{ display: 'flex', }}
            >
                <div className="examination-total">
                    Examinations as Outpatient
                    <div className="exams"
                        style={{
                            border: '1px solid black', padding: '10px',
                            marginTop: '10px',
                        }}>
                        <Table fields={Exams.fields} rows={Exams.rows} type={2} />
                    </div>
                    <div className="total-fee">
                        Total <span
                            style={{ fontWeight: 'bold' }}>${TotalFee.rows[0][1]}</span>
                    </div>
                </div>

                <div className="treatment-total"
                    style={{ marginLeft: '150px' }}>
                    Treatments as Inpatient
                    <div style={{
                        border: '1px solid black', padding: '10px',
                        marginTop: '10px',
                        display: 'flex',
                    }}>
                        <div className="treats">
                            <Table fields={Treats.fields} rows={Treats.rows} type={2} />
                        </div>
                        <div className="inpatient-total"
                            style={{ marginLeft: '50px' }}>
                            <Table fields={Inpatient.fields} rows={Inpatient.rows} type={2} />
                        </div>
                        <div className="treat-fee"></div>
                    </div>
                    <div className="total-fee">
                        Total <span
                            style={{ fontWeight: 'bold' }}>${TotalFee.rows[0][2]}</span>
                    </div>
                </div>
            </div>
            <div className="total-fee" style={{ display: 'flex', fontSize: '20px', }}>
                Total <span
                    style={{ fontWeight: 'bold', marginLeft: '5px' }}>${TotalFee.rows[0][3]}</span>
            </div>
        </div>
    )
}

const Table = ({ fields, rows, type, setRQuery, setPQuery, turnReport }) => {
    let baseQuery = (type === 1 ? "http://localhost/hospital-demo/inspect.php?table=mypatients" : "http://localhost/hospital-demo/inspect.php?table=treatments");
    return (
        <div>
            <table className="table-whole">
                <thead className="table-head">
                    <tr className="table-row table-fields">
                        {fields.map(
                            (field) => <th className="table-field">{field}</th>
                        )}
                    </tr>
                </thead>
                <tbody className="table-body">
                    {rows.map((row, index) => (
                        <tr className="table-row"
                            style={{}}>
                            {row.map((cell) => (
                                <td className="table-cell">{cell}</td>
                            ))}
                            {(type === 0 || type === 1) && (index !== rows.length - 1 && (
                                <button
                                    className="rquery-btn"
                                    style={{
                                        backgroundColor: COLORS.SECONDARY,
                                        color: COLORS.PRIMARY,
                                        borderRadius: '15%',
                                        marginBottom: '3px',
                                        marginTop: '3px',
                                        padding: '2px',
                                    }}
                                    onClick={() => {
                                        console.log(row[0])
                                        console.log(type)
                                        const id_query = "&rq_id=" + row[0]
                                        const fullQuery = baseQuery + id_query
                                        setRQuery(fullQuery)
                                    }}
                                >Query</button>
                            ))}
                            {type === 0 && index !== rows.length - 1 && (
                                <button
                                    className="rquery-btn"
                                    style={{
                                        backgroundColor: COLORS.INFO,
                                        color: COLORS.LIGHT,
                                        borderRadius: '10%',
                                        marginLeft: '10px',
                                        marginBottom: '3px',
                                        marginTop: '3px',
                                        padding: '2px',
                                    }}
                                    onClick={() => {
                                        console.log(row[0])
                                        console.log(type)
                                        turnReport(true)
                                        setPQuery.setTitle({
                                            name: row[1] + " " + row[2],
                                            phone: row[3],
                                            address: row[4],
                                        })
                                        const id_query = "&rq_id=" + row[0]
                                        setPQuery.setPayLink({
                                            Exams: 'http://localhost/hospital-demo/inspect.php?table=Exams' + id_query,
                                            Treats: 'http://localhost/hospital-demo/inspect.php?table=Treats' + id_query,
                                            Inpatient: 'http://localhost/hospital-demo/inspect.php?table=Inpatient' + id_query,
                                            Medications: 'http://localhost/hospital-demo/inspect.php?table=Medications' + id_query,
                                            Fee: 'http://localhost/hospital-demo/inspect.php?table=Pay' + id_query,
                                        })
                                    }}
                                >Payment</button>
                            )}
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    )
}

// Insert be able to add Examination/ Treatment/ Inpatient
// Include Filter dropdown for Doctor/ Medications/ Nurse/ Sickroom
// Put insert in here as a Plus button
// Change RQ_Fields, RQ_Rows, Fields, Rows to useState like Report variables
// Add filter dropdown to query form https://www.w3schools.com/howto/howto_js_filter_dropdown.asp