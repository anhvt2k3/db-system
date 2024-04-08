import React from "react"
import './style.css'
import { COLORS, SIZES, STYLES, SHADOW } from "../../../../constants"

// Increase Inpatient Fee to 10% for all the current inpatients who are admitted to hospital from 01/09/2020
export const Update = () => {
    return (
        <div
            className='contentScreens'
            style={{
                backgroundColor: COLORS.Update,
            }}>Update
            <div>
            </div>
        </div>
    )
}