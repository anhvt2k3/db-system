import React, { useState, useEffect } from 'react'
import { COLORS, SIZES, STYLES, SHADOW } from '../../../../constants';
import './style.css'

// insert new patient

export const Insert = () => {
    const [Linkfetch, setLinkfetch] = useState('http://localhost/hospital-demo/insert.php')
    const [patient, setPatient] = useState({
        patientCode: '',
        characterCode: '',
        FName: '',
        LName: '',
        Address: '',
        DateOfBirth: '',
        Gender: '',
        Phone: '',
    })
    const [ErrorOccured, setErrorOccured] = useState('Inserted succesfully!')
    // Handle form input changes
    const handleChange = async (e) => {
        setPatient({
            ...patient,
            [e.target.name]: e.target.value,
        });
    };

    useEffect(() => {
        const fetchData = async () => {
            try {
                const response = await fetch(Linkfetch);
                // if (!response.ok) {
                //     console.log('Network error!')
                //     throw new Error('Network response was not ok');
                // }
                let result = await response.text();
                setErrorOccured(result)
                console.log(result);
            } catch (err) {
                // Do something for an error here
                console.error("Error Reading data", err);
            }
            setLinkfetch('http://localhost/hospital-demo/insert.php')
        };

        fetchData();
    }, [Linkfetch]);

    // Handle form submission
    const handleSubmit = (event) => {
        event.preventDefault();
        // You can perform actions with the form data here
        console.log('Form submitted:', patient);

        event.preventDefault();
        let query = 'http://localhost/hospital-demo/insert.php?'
        // const table = '&table=' + (IsPatient ? 'patient' : (IsNurse ? 'nurse' : 'doctor'))
        const FName = (/\S/.test(patient.FName) ? '&FName=' + patient.FName : '');
        const LName = (/\S/.test(patient.LName) ? '&LName=' + patient.LName : '');
        const Address = (/\S/.test(patient.Address) ? '&Address=' + patient.Address : '');
        const DateOfBirth = (/\S/.test(patient.DateOfBirth) ? '&DateOfBirth=' + patient.DateOfBirth : '');
        const Gender = (/\S/.test(patient.Gender) ? '&Gender=' + patient.Gender : '');
        const Phone = (/\S/.test(patient.Phone) ? '&Phone=' + patient.Phone : '');
        query = query + FName + LName + Address + DateOfBirth + Gender + Phone

        console.log(query)
        setLinkfetch(query)
    };


    const PatientCode = (
        <label className='label-insert'>
            patientCode:
            <input
                type="text"
                name="patientCode"
                value={patient.patientCode}
                onChange={handleChange}
            />
        </label>
    )

    const FirstName = (
        <label className='label-insert'>
            First Name:
            <input
                type="text"
                name="FName"
                value={patient.FName}
                onChange={handleChange}
            />
        </label>
    )

    const Address = (
        <label className='label-insert'>
            Address:
            <input
                type="text"
                name="Address"
                value={patient.Address}
                onChange={handleChange}
            />
        </label>
    )

    const Phone = (
        <label className='label-insert'>
            Phone:
            <input
                type="text"
                name="Phone"
                value={patient.Phone}
                onChange={handleChange}
            />
        </label>
    )

    const CharacterCode = (
        <label className='label-insert'>
            characterCode:
            <input
                type="text"
                name="characterCode"
                value={patient.characterCode}
                onChange={handleChange}
            />
        </label>
    )

    const LastName = (
        <label className='label-insert'>
            Last Name:
            <input
                type="text"
                name="LName"
                value={patient.LName}
                onChange={handleChange}
            />
        </label>
    )

    const Gender = (
        <label className='label-insert'>
            Gender:
            <input
                type="text"
                name="Gender"
                value={patient.Gender}
                onChange={handleChange}
            />
        </label>
    )

    const DateOfBirth = (
        <label className='label-insert'>
            Date Of Birth:
            <input
                type="text"
                name="DateOfBirth"
                value={patient.DateOfBirth}
                onChange={handleChange}
            />
        </label>
    )

    return (
        <div
            className='contentScreens'
            style={{
                backgroundColor: COLORS.Insert,
                color: 'black',
            }}>Insert a patient's credentials
            <form onSubmit={handleSubmit} className='form-insert'
                style={{
                    marginTop: SIZES.font,
                    border: 'solid black 2px',
                    borderRadius: SIZES.font,
                    width: 'fit-content',
                }}>
                <div className='row'>
                    <div className='labels-group col'>
                        {FirstName}
                        <div className='group-2 col labels-group'>
                            {Address}
                            {Phone}
                        </div>
                    </div>
                    <div className='labels-group col'>
                        {LastName}
                        <div className='group-2 col labels-group'>
                            {DateOfBirth}
                            {Gender}
                        </div>
                    </div>
                </div>
                <button type="submit"
                    style={{
                        color: COLORS.PRIMARY,
                        alignSelf: 'center',
                        width: '30%',
                        margin: 8,
                        padding: 4,
                    }}
                    >Submit</button>
            </form >
            <div
            style={{
                color: COLORS.DANGER,
                marginTop: SIZES.font,
                ...STYLES.bold,
            }}
            >{ErrorOccured}</div>
        </div >
    )
}
