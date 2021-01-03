*** Settings ***
Library  SeleniumLibrary
Library     String
Library     BuiltIn

Resource    ../../resources/common/common.robot     #browser stuff
Resource    ../../resources/log_in/log_in.robot     #log in
Resource    ../../resources/log_out/log_out.robot   #log out
Resource    ../../resources/sign_up/sign_up.robot   #sign up

Suite Setup      common.Open Site
Suite Teardown   Close Browser

*** Test Cases ***
Normal Sign Up
    # Info
    [Documentation]  Sign Up
    [Tags]  Component
    # Procedure
    sign_up.Sign Up
    Page Should Not Contain     error

Sign up and logging
    # Info
    [Documentation]  Sign Up with log out and log in
    [Tags]  Integreate
    Sign up and logging KW

Sign up and logging multiple times
    # Info
    [Documentation]  Sign Up with log out and log in multiple times
    [Tags]  Integreate Excess
    FOR    ${i}    IN RANGE    10
    Log     trial: ${i}
        Exit For Loop If    ${i} == 9
        Sign up and logging KW
    END

*** Keywords ***
Sign up and logging KW
    # Procedure
    sign_up.Sign Up
    Page Should Not Contain     error
    log_out.Log out user
    Page Should Not Contain     error
    log_in.Log in user  ${email}  ${password}
    Page Should Not Contain     error