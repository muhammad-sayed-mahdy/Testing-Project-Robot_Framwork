*** Settings ***
Library  SeleniumLibrary

Resource    ../../resources/common/common.robot
Resource    ../../resources/log_in/log_in.robot
Resource    ../../resources/log_out/log_out.robot

Test Setup      common.Open Site
Test Teardown   Close Browser

*** Test Cases ***
Log In and Out Test.
    # Info
    [Documentation]  Logging in to Twitter Only.
    [Tags]  Log in and out test case
    
    log_in.Log in user  ${email_1}  ${pass_1}
    log_out.Log out user
    