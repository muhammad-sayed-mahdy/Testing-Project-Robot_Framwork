*** Settings ***
Library  SeleniumLibrary

Resource    ../global_variables.robot
Resource    ../common/common.robot

# ***Test Cases***
# Test 1
#     common.Open Site
    
#     Log in user   ${email_1}   ${pass_1}

    
*** Keywords ***

# Assuming that the browser is Open
# and user is not signed in.
Log in user
    [Arguments]    ${user_email}    ${user_pass}
    Go To  ${login_page}
    Wait Until Page Contains    Authentication
    Input Text  id:email     ${user_email}      clear=True
    Input Text  id:passwd      ${user_pass}     clear=True
    Press Keys  id:SubmitLogin  RETURN
    Page Should Not Contain     error
    Wait Until Element Contains     xpath://*[@id="center_column"]/h1     MY ACCOUNT

