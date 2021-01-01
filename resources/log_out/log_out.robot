*** Settings ***
Library  SeleniumLibrary
# Resource    ../log_in

*** Variables ***

*** Test Cases ***
Log in Test.
    [Documentation]  Log out form Twitter
    [Tags]  Teardown

    Open Browser  https://twitter.com/home  chrome
    # Go To  https://twitter.com/logout     #Another way of doing things.
    Wait Until Element Contains     xpath://*[@id="layers"]/div[2]/div/div/div[2]/div/div[2]/div/div/div/div/div/li/div/div[2]/div/div/div/div[1]/div[1]/span/span      ${user_1}
    Click Element   xpath://*[@id="layers"]/div[2]/div/div/div[2]/div/div[2]/div/div/div/div/div/a[2]/div/div
    Wait Until Element Contains     xpath://*[@id="layers"]/div[2]/div/div/div/div/div/div[2]/div[2]/div[1]/span    Log out of Twitter?
    Press Keys  xpath://*[@id="layers"]/div[2]/div/div/div/div/div/div[2]/div[2]/div[3]/div[2]  RETURN


*** Keywords ***