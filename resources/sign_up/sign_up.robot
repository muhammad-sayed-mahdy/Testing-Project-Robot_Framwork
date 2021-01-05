*** Settings ***
Library  SeleniumLibrary
Library     String
Library     BuiltIn

Resource    ../global_variables.robot
Resource    ../log_out/log_out.robot
Resource    ../common/common.robot


*** Keywords ***

Assign Email
    Input Text      id:email_create     ${email}
    Press Keys      id:SubmitCreate     RETURN
    Sleep  5s   #due to animation
    
Sign up steps
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
    
Sign Up
    [Arguments]     ${random}= 1    ${ignore_error}= 1
    #go to the sign up /login page
    Go To  ${login_page}
    #fetch random info and update it globally
    Run Keyword if     ${random} == 1      common.Generate Random info   
    #if this is the page, ie. user not already signed in
    ${status}   ${value}=    Run keyword and ignore error  Page should contain  Sign in
    Run Keyword Unless     '${status}' == 'PASS'      log_out.Log out user
    #AGAIN
    #if this is the page, ie. user not already signed in
    ${status}   ${value}=    Run keyword and ignore error  Page should contain  Sign in
    #add email
    Run Keyword If     '${status}' == 'PASS'          Assign Email
    #email is correct?
    ${status}   ${value}=    Run keyword and ignore error  Page Should not Contain    id:SubmitCreate
    #add info
    Run Keyword If     '${status}' == 'PASS'          Sign up steps
    #register
    Press Keys      id:submitAccount     RETURN
    Run Keyword if     ${ignore_error} == 1      Page should contain  Sign out


Embed sign up values manually
    [Arguments]     ${arg1}  ${arg2}  ${arg3}  ${arg4}  ${arg5}  ${arg6}  ${arg7}  ${arg8}  ${arg9}  
    Set Global Variable     ${fname}       ${arg1}         
    Set Global Variable     ${lname}       ${arg2}
    #To ensure always unique
    ${var}=   Generate Random String     4    [LETTERS][NUMBERS]
    ${EV}=   Catenate    SEPARATOR=  ${arg3}  ${var}
    Set Global Variable     ${email}       ${EV}         
    Set Global Variable     ${password}    ${arg4}         
    Set Global Variable     ${company}     ${arg5}     
    Set Global Variable     ${address}     ${arg6}     
    Set Global Variable     ${city}        ${arg7} 
    Set Global Variable     ${zip}         ${arg8} 
    Set Global Variable     ${phone}       ${arg9}     
    # Embed sign up values manually   fname   lname   mail@mail.com   pass123     compx   addressx    cityx   11111   0120

    