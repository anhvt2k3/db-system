import React from 'react'
import { COLORS, SIZES, STYLES, SHADOW } from '../../constants';
import { Link, Routes, Route } from 'react-router-dom';
import { Insert, Inspect, Update, Report } from './Screens';

export const Content = () => {
    return (
        <Routes>
            <Route path='/Insert' element={<Insert />} />
            <Route path='/Inspect' element={<Inspect />} />
            <Route path='/Update' element={<Update />} />
            <Route path='/Report' element={<Report />} />
        </Routes>
    )
}
