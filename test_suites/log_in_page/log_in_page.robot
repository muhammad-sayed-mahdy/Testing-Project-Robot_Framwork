*** Settings ***
Library  SeleniumLibrary

Resource    ../../resources/log_in/log_in.robot
Resource    ../../resources/log_out/log_out.robot
      
Test Teardown   Close Browser

*** Test Cases ***
Log in Test.
    # Info
    [Documentation]  Logging in to Twitter Only.
    [Tags]  Log in test case
    log_in.Log in user 1
    log_out.Log out user
    log_in.Log in user 2
    log_out.Log out user
    