import React, { useState } from 'react'
import { Link } from 'react-router-dom'
import { SIZES } from '../../constants'

export const TopBar = () => {
    return (
        <div className=''>

            <div
                className='top-bar'>
                <ul className='side-nav-ul'>
                    <li><Link className='top-nav' to='/Insert'>Insert</Link></li>
                    <li><Link className='top-nav' to='/Inspect'>Search</Link></li>
                    {/* <li><Link className='top-nav' to='/Update'>Update</Link></li>
                    <li><Link className='top-nav' to='/Report'>Report</Link></li> */}
                    {/* <li><Link className='top-nav' to='/'>Login</Link></li> */}
                </ul>
            </div>
        </div>
    )
}
