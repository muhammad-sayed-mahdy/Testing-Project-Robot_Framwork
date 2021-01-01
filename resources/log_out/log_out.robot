*** Settings ***
Library  SeleniumLibrary
Resource    ../log_in

*** Variables ***
${email}    test113124656
${pass}     robotframeworkpass
*** Test Cases ***
Log in Test.
    [Documentation]  Log out form Twitter
    [Tags]  Teardown

    Open Browser  https://twitter.com/home  chrome
    Press Keys  xpath://*[@id="react-root"]/div/div/div[2]/header/div/div/div/div[2]/div/div/div
    # Close Browser

*** Keywords ***