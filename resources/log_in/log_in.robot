*** Settings ***
Library  SeleniumLibrary
Library     BuiltIn
Resource    ../global_variables.robot
Resource    ../common/common.robot

# ***Test Cases***
# Test 1
#     common.Open Site
    
#     Log in user   ${email_1}   ${pass_1}

    
*** Keywords ***

# Assuming that the browser is Open
# and user is not signed in.
Log in
    [Arguments]    ${user_email}    ${user_pass}
    Wait Until Page Contains    Authentication
    Input Text  id:email     ${user_email}      clear=True
    Input Text  id:passwd      ${user_pass}     clear=True
    Press Keys  id:SubmitLogin  RETURN
    # Wait Until Element Contains     xpath://*[@id="center_column"]/h1     MY ACCOUNT

Log in user
    [Arguments]    ${user_email}    ${user_pass}
    Go To  ${login_page}
    ${status}   ${value}=    Run keyword and ignore error  Page should contain  Sign in
    Run Keyword If     '${status}' == 'PASS'          Log in    ${user_email}    ${user_pass}
    

