import React, { useState, useEffect } from 'react'
import { BrowserRouter as Router } from 'react-router-dom';
import { COLORS, SIZES, STYLES, SHADOW } from '../../constants';
import './style.css'
import { TopBar } from '../TopBar';
import { SideBar } from '../SideBar';
import { Content } from '../Content';

export const Authenticate = () => {
    const [IsLogged, setIsLogged] = useState(false)

    return (
        IsLogged ? <Logged /> : <Logger IsLogged={IsLogged} setIsLogged={setIsLogged} />
    )
}

const Logger = ({ IsLogged, setIsLogged }) => {
    const [IsWrong, setIsWrong] = useState(false)

    const handleSubmit = (event) => {
        event.preventDefault();
        const username = event.target.username.value
        const password = event.target.password.value

        if (username === 'admin' && password === 'admin') {
            setIsLogged(true)
        }
        else {
            setIsWrong(true)
        }
    }

    return (
        <div className='login-bar'>
            <form onSubmit={handleSubmit} className='login-form'>
                <div style={{
                    marginTop: '10px',
                }}>
                    Login to continue
                </div>
                <div style={{
                    display: 'flex',
                    justifyContent: 'center',
                    flexDirection: 'column',
                    margin: '10px',
                }}>
                    <label>
                        <input
                            className='login-input'
                            type="text"
                            name='username'
                            placeholder="admin"
                        />
                    </label>
                    <label>
                        <input
                            className='login-input'
                            type="password"
                            name='password'
                            placeholder="admin"
                        />
                    </label>
                    <div style={{ display: 'flex', flexDirection: 'row' }}>
                        <button className='login-input submit-btn' type="submit">Login</button>
                    </div>
                    <div style={{
                        color: 'red',
                        fontSize: '12px',
                        display: IsWrong ? 'flex' : 'none',
                    }}
                    > Wrong password or username!</div>
                </div>
            </form >
        </div >
    )
}

const Logged = () => {
    return (
        <Router>
            <TopBar />
            <div className='Body'>
                <SideBar />
                <Content />
            </div>
        </Router>

    )
}

// -> Authenticate = logger -> yes -> Logged - else -> Authenticate
// use Effect to track when username and password are changed

// export { Insert, Inspect, Update, Report }