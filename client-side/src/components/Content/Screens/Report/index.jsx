import React from "react"
import { COLORS, SIZES, STYLES, SHADOW } from "../../../../constants"

// Make a report that provides full information about the payment for
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
export const Report = () => {
    return (
        <div
            className='contentScreens'
            style={{
                backgroundColor: COLORS.Report,
            }}>
                <div className="report-title">
                </div>
                
                <div className="report-treatments">
                    <div className="examination-total">
                        <div className="exams"></div>
                        <div className="exam-medication"></div>
                        <div className="exam-fee"></div>
                    </div>
                    
                    <div className="treatment-total">
                        <div className="inpatient-total"></div>
                        <div className="treats"></div>
                        <div className="treat-medication"></div>
                        <div className="treat-fee"></div>
                    </div>
                </div>
            </div>
    )
}