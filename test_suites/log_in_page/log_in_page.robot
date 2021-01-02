*** Settings ***
Library  SeleniumLibrary

Resource    ../../resources/common/common.robot
Resource    ../../resources/log_in/log_in.robot
Resource    ../../resources/log_out/log_out.robot

Suite Setup      common.Open Site
Suite Teardown   Close Browser

*** Test Cases ***
Normal Login
    # Info
    [Documentation]  Logging in
    [Tags]  Integrate
    # Procedure
    log_in.Log in user  ${email_1}  ${pass_1}
    Page Should Not Contain     error
    log_out.Log out user

Faulty Login with email
    # Info
    [Documentation]  Logging in
    [Tags]  Component Faulty
    # Procedure
    log_in.Log in user  garbage@garbage.com  ${pass_1}
    Page Should Contain     error
    

Faulty Login with password
    # Info
    [Documentation]  Logging in
    [Tags]  Component Faulty
    # Procedure
    log_in.Log in user  ${email_1}  garbage_pwd
    Page Should Contain     error

Faulty Login with both
    # Info
    [Documentation]  Logging in
    [Tags]  Component Faulty
    # Procedure
    log_in.Log in user  garbage@garbage.com  garbage_pwd
    Page Should Contain     error

Log in empty
    # Info
    [Documentation]  Logging in with empty parameters
    [Tags]  Component Faulty
    # Procedure
    log_in.Log in user  ''  ''
    Page Should Contain     error
    
Faulty Multiple Log ins
    # Info
    [Documentation]  Logging in and try to log in again.
    [Tags]  Component Faulty
    # Procedure
    log_in.Log in user  ${email_1}  ${pass_1}
    Page Should Not Contain     error
    log_in.Log in user  ${email_1}  ${pass_1}
    Page Should Not Contain     error

Log out when you are not logged in
    # Info
    [Documentation]  Log out
    [Tags]  Component Faulty
    # Procedure
    log_out.Log out user

Log In and Out Test.
    # Info
    [Documentation]  Logging in and then out
    [Tags]  Integrate log in and log ouy
    # Procedure
    log_in.Log in user  ${email_1}  ${pass_1}
    Page Should Not Contain     error
    log_out.Log out user

Excessive Consecutive Log ins and outs
    # Info
    [Documentation]  Logging in and out multiple times
    [Tags]  Component Excess
    # Procedure
    FOR    ${i}    IN RANGE    999999
        Log     trial: ${i}
        Exit For Loop If    ${i} == 9
        log_in.Log in user  ${email_1}  ${pass_1}
        Page Should Not Contain     error
        log_out.Log out user
    END

Excessive Consecutive Log ins and outs Multiple Users
    # Info
    [Documentation]  Logging in and out multiple times
    [Tags]  Component Excess
    # Procedure
    FOR    ${i}    IN RANGE    999999
        Log     trial: ${i}
        Exit For Loop If    ${i} == 9
        log_in.Log in user  ${email_1}  ${pass_1}
        Page Should Not Contain     error
        log_out.Log out user
        log_in.Log in user  ${email_2}  ${pass_2}
        Page Should Not Contain     error
        log_out.Log out user
    END