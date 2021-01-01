*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${email}    test113124656
${pass}     robotframeworkpass
${user}     test_1

*** Test Cases ***
Log in Test.
    [Documentation]  Logging in to Twitter
    [Tags]  Test Setup

    Open Browser  https://twitter.com/login  chrome
    Wait Until Element Contains     xpath://*[@id="react-root"]/div/div/div[2]/main/div/div/h1/span    Log in to Twitter
    Input Text  name:session[username_or_email]     ${email}      clear=True
    Input Text  name:session[password]      ${pass}     clear=True
    Press Keys  xpath://*[@id="react-root"]/div/div/div[2]/main/div/div/div[1]/form/div/div[3]/div/div  RETURN
    Click Element  xpath://*[@id="react-root"]/div/div/div[2]/header/div/div/div/div[2]/div/div/div
    # Go To  https://twitter.com/logout     #Another way of doing things.
    Wait Until Element Contains     xpath://*[@id="layers"]/div[2]/div/div/div[2]/div/div[2]/div/div/div/div/div/li/div/div[2]/div/div/div/div[1]/div[1]/span/span      ${user}
    Click Element   xpath://*[@id="layers"]/div[2]/div/div/div[2]/div/div[2]/div/div/div/div/div/a[2]/div/div
    Wait Until Element Contains     xpath://*[@id="layers"]/div[2]/div/div/div/div/div/div[2]/div[2]/div[1]/span    Log out of Twitter?
    Press Keys  xpath://*[@id="layers"]/div[2]/div/div/div/div/div/div[2]/div[2]/div[3]/div[2]  RETURN
    
    Close Browser

*** Keywords ***