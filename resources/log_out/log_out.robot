*** Settings ***
Library  SeleniumLibrary
Resource    ../log_in/log_in.robot


*** Keywords ***
Log out user
    # Open Browser  https://twitter.com/home  chrome
    # Go To  https://twitter.com/logout     #Another way of doing things.
    Click Element  xpath://*[@id="react-root"]/div/div/div[2]/header/div/div/div/div[2]/div/div/div
    Wait Until Element Contains     xpath://*[@id="layers"]/div[2]/div/div/div[2]/div/div[2]/div/div/div/div/div/a[2]   Log out
    Click Element   xpath://*[@id="layers"]/div[2]/div/div/div[2]/div/div[2]/div/div/div/div/div/a[2]/div/div
    Wait Until Element Contains     xpath://*[@id="layers"]/div[2]/div/div/div/div/div/div[2]/div[2]/div[1]/span    Log out of Twitter?
    Press Keys  xpath://*[@id="layers"]/div[2]/div/div/div/div/div/div[2]/div[2]/div[3]/div[2]  RETURN
    Wait Until Element Contains     xpath://*[@id="react-root"]/div/div/div/main/div/div/div/div[1]/div/a[2]/div    Log in
    # Go To  https://twitter.com
    