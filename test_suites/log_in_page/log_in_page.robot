*** Settings ***
Library  SeleniumLibrary

Resource    ../../resources/common/common.robot
Resource    ../../resources/log_in/log_in.robot
Resource    ../../resources/log_out/log_out.robot

Suite Setup      common.Open Site
Suite Teardown   Close Browser

*** Test Cases ***
Log In and Out Test.
    # Info
    [Documentation]  Logging in and then out
    [Tags]  Integrate log in and log ouy
    # Procedure
    log_in.Log in user  ${email_1}  ${pass_1}
    Page Should Not Contain     error
    log_out.Log out user

Normal Login
    # Info
    [Documentation]  Logging in
    [Tags]  Component
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

Faulty Multiple Log ins
    # Info
    [Documentation]  Logging in and try to log in again.
    [Tags]  Component Faulty
    # Procedure
    log_in.Log in user  ${email_1}  ${pass_1}
    Page Should Not Contain     error
    log_in.Log in user  ${email_1}  ${pass_1}
    Page Should Not Contain     error
*** Keywords ***
