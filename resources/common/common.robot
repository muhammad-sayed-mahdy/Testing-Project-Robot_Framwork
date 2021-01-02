*** Settings ***
Library  SeleniumLibrary


*** Keywords ***
Open Twitter
    Open Browser  https://twitter.com  chrome
    Wait Until Element Contains     xpath://*[@id="react-root"]/div/div/div/main/div/div/div/div[1]/div/a[2]/div    Log in