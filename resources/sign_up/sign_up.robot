*** Settings ***
Library  SeleniumLibrary
Library     String
Library     BuiltIn

Resource    ../global_variables.robot
Resource    ../common/common.robot

Test Setup      common.Open Site
Test Teardown   Close Browser

*** Variables ***

*** Test Cases ***
Sign Up test Cases
    Sign Up


*** Keywords ***
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
    
Sign Up
    #go to the sign up /login page
    Go To  ${login_page}
    #fetch random info
    Generate Random info   
    #if this is the page, ie. user not already signed in
    ${status}   ${value}=    Run keyword and ignore error  Page should contain  Sign in
    #add email
    Run Keyword If     '${status}' == 'PASS'          Assign Email      ${email}
    #email is correct?
    ${status}   ${value}=    Run keyword and ignore error  Page Should not Contain    id:SubmitCreate
    #add info
    Run Keyword If     '${status}' == 'PASS'          Sign up steps  ${fname}  ${lname}  ${email}  ${password}  ${company}  ${address}  ${city}  ${zip}  ${phone}
    #register
    Press Keys      id:submitAccount     RETURN
    Page should contain  Sign out
    
Sign up steps
    [Arguments]    ${fname}  ${lname}  ${email}  ${password}  ${company}  ${address}  ${city}  ${zip}  ${phone}
    
    #mr and mrs should be picked randomly
    ${rand_int}=    Evaluate    random.sample(range(1, 11),1)    random
    ${mod}=     Evaluate  (${rand_int}[0] % 2)+1
    Select Radio Button  id_gender  2   # a problem when choosing Mr.

    # #textual data
    Input Text  id:customer_firstname   ${fname}    clear=True
    Input Text  id:customer_lastname    ${lname}    clear=True
    Input Text  id:email                ${email}    clear=True
    Input Text  id:passwd               ${password}    clear=True
    Input Text  id:firstname            ${fname}    clear=True
    Input Text  id:lastname             ${lname}    clear=True
    Input Text  id:company              ${company}    clear=True
    Input Text  id:address1             ${address}    clear=True
    Input Text  id:city                 ${city}    clear=True
    Input Text  id:postcode             ${zip}    clear=True
    Input Text  id:phone                ${phone}    clear=True
    Input Text  id:phone_mobile         ${phone}    clear=True
    
    #select Date
    ${rand_int}=    Evaluate    random.sample(range(1, 32),1)    random
    ${rand_str}=    Convert To String  ${rand_int}[0]
    Select From List By Value   name=days     ${rand_str}
    ${rand_int}=    Evaluate    random.sample(range(1, 13),1)    random
    ${rand_str}=    Convert To String  ${rand_int}[0]
    Select From List By Value   name=months     ${rand_str}
    ${rand_int}=    Evaluate    random.sample(range(1900, 2022),1)    random
    ${rand_str}=    Convert To String  ${rand_int}[0]
    Select From List By Value   name=years     ${rand_str}

    #select state
    ${rand_int}=    Evaluate    random.sample(range(1, 50),1)    random
    ${rand_str}=    Convert To String  ${rand_int}[0]
    Select From List By Value   name=id_state     ${rand_str}
    
Assign Email
    [Arguments]    ${email}
    Input Text      id:email_create     ${email}
    Press Keys      id:SubmitCreate     RETURN
    Sleep  5s
    
    
    
    
    