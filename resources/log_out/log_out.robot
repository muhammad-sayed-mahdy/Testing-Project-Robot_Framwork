*** Settings ***
Library  SeleniumLibrary
Resource    ../log_in/log_in.robot
Resource    ../global_variables.robot

Test Setup      global_variables.Call Test_1 Info

*** Variables ***

# *** Test Cases ***
# Log Out Test.
#     [Documentation]  Log out form Twitter
#     [Tags]  Teardown
    
#     log_in.Log in user 1
#     Log out user 1
#     Close Browser
    


*** Keywords ***
Log out user 1
    # Open Browser  https://twitter.com/home  chrome
    # Go To  https://twitter.com/logout     #Another way of doing things.
    Wait Until Element Contains     xpath://*[@id="layers"]/div[2]/div/div/div[2]/div/div[2]/div/div/div/div/div/a[2]   Log out
    Click Element   xpath://*[@id="layers"]/div[2]/div/div/div[2]/div/div[2]/div/div/div/div/div/a[2]/div/div
    Wait Until Element Contains     xpath://*[@id="layers"]/div[2]/div/div/div/div/div/div[2]/div[2]/div[1]/span    Log out of Twitter?
    Press Keys  xpath://*[@id="layers"]/div[2]/div/div/div/div/div/div[2]/div[2]/div[3]/div[2]  RETURN