*** Settings ***
Library  SeleniumLibrary

Resource    ../global_variables.robot
Resource    ../common/common.robot



*** Keywords ***
Log out user
    # Go To  ${logout_page}    #Another way of doing things.
    ${status}   ${value}=    Run keyword and ignore error  Page should contain  Sign out
    Run Keyword If     '${status}' == 'PASS'    Click Element  xpath://*[@id="header"]/div[2]/div/div/nav/div[2]/a
    
    
    