*** Settings ***
Library  SeleniumLibrary

Resource    ../global_variables.robot
          
    
*** Keywords ***
Log in user 1
    global_variables.Call Test_1 Info
    Go To  https://twitter.com/login
    Wait Until Element Contains     xpath://*[@id="react-root"]/div/div/div[2]/main/div/div/h1/span    Log in to Twitter
    Input Text  name:session[username_or_email]     ${email_1}      clear=True
    Input Text  name:session[password]      ${pass_1}     clear=True
    Press Keys  xpath://*[@id="react-root"]/div/div/div[2]/main/div/div/div[1]/form/div/div[3]/div/div  RETURN
    Wait Until Element Contains     xpath://*[@id="react-root"]/div/div/div[2]/main/div/div/div/div/div/div[1]/div[1]/div/div/div/div/div[1]/div/h2     Home

Log in user 2
    global_variables.Call Test_2 Info
    Go To  https://twitter.com/login
    Wait Until Element Contains     xpath://*[@id="react-root"]/div/div/div[2]/main/div/div/h1/span    Log in to Twitter
    Input Text  name:session[username_or_email]     ${email_2}      clear=True
    Input Text  name:session[password]      ${pass_2}     clear=True
    Press Keys  xpath://*[@id="react-root"]/div/div/div[2]/main/div/div/div[1]/form/div/div[3]/div/div  RETURN
    Wait Until Element Contains     xpath://*[@id="react-root"]/div/div/div[2]/main/div/div/div/div/div/div[1]/div[1]/div/div/div/div/div[1]/div/h2     Home