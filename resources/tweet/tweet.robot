*** Settings ***
Library  SeleniumLibrary
Resource    ../global_variables.robot
#Delete when done
Resource    ../log_in/log_in.robot
Resource    ../common/common.robot

Test Setup      common.Open Twitter

*** Test Cases ***
Log in Test.
    # Info
    [Documentation]  Logging in to Twitter Only.
    [Tags]  Log in and out test case
    
    log_in.Log in user 1
    Create Tweet

*** Keywords ***
Create Tweet
    # Click Element  xpath://*[@id="react-root"]/div/div/div[2]/header/div/div/div/div[1]/div[3]/a/div
    # Wait Until Element Contains     xpath://*[@id="react-root"]/div/div/div[2]/main/div/div/div[3]/div/div/div[1]/div/div/div/div/div[2]/div[2]/div   Everyone can reply
    # Input Text  xpath://*[@id="react-root"]/div/div/div[2]/main/div/div/div[3]/div/div/div[1]/div/div/div/div/div[2]     Tweet Num. 1
    Input Text  xpath://*[@id="react-root"]/div/div/div[2]/main/div/div/div/div/div/div[2]/div/div[2]/div[1]/div/div/div/div[2]/div[1]/div/div/div/div/div/div/div/div/div/div[1]/div/div/div/div[2]/div/div/div/div     Tweet Num. 1
    