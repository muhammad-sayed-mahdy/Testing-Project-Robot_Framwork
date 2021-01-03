*** Settings ***
Library  SeleniumLibrary

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