*** Settings ***
Library  SeleniumLibrary

Resource    ../global_variables.robot
Resource    ../sign_up/sign_up.robot
Resource    ../log_in/log_in.robot


*** Keywords ***
Open Site
    Open Browser  ${website}  ${browser}
    

Open Site and Create a new user
    Open Site
    sign_up.Sign Up

Open Site and log in
    Open Site
    log_in.Log in user  ${email_1}  ${pass_1}

Generate Random info
    ${EV}=   Generate Random String    8     [LOWER]
    Set Global Variable     ${fname}    ${EV}
    ${EV}=   Generate Random String    8     [LOWER]
    Set Global Variable     ${lname}    ${EV}   
    ${var}=   Generate Random String     10    [LETTERS][NUMBERS]
    ${EV}=   Catenate    SEPARATOR=  ${var}  ${sign_up_prefix}
    Set Global Variable     ${email}    ${Ev}      
    ${EV}=   Generate Random String     10    [LETTERS][NUMBERS]
    Set Global Variable     ${password}  ${Ev}  
    ${EV}=   Generate Random String     12    [LETTERS][NUMBERS]
    Set Global Variable     ${company}  ${Ev}    
    ${EV}=   Generate Random String     22    [LETTERS][NUMBERS]
    Set Global Variable     ${address}  ${Ev}    
    ${EV}=   Generate Random String     8     [LETTERS][NUMBERS]
    Set Global Variable     ${city}     ${Ev}         
    ${EV}=   Generate Random String     5     [NUMBERS]
    Set Global Variable     ${zip}      ${Ev}         
    ${EV}=   Generate Random String     12    [NUMBERS]
    Set Global Variable     ${phone}    ${Ev}       

Generate Random info SUB
    ${EV}=   Generate Random String     22    [LETTERS][NUMBERS]
    Set Global Variable     ${address}  ${Ev}    
    ${EV}=   Generate Random String     8     [LETTERS][NUMBERS]
    Set Global Variable     ${city}     ${Ev}         
    ${EV}=   Generate Random String     5     [NUMBERS]
    Set Global Variable     ${zip}      ${Ev}         
    ${EV}=   Generate Random String     12    [NUMBERS]
    Set Global Variable     ${phone}    ${Ev}       
