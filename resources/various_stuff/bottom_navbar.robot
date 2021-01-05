*** Settings ***
Library  SeleniumLibrary
Library     BuiltIn
Resource    ../global_variables.robot
Resource    ../common/common.robot

    
*** Keywords ***

Click Navbar With Check
    [Arguments]    ${click_type}   ${expected_output}
    Wait Until Page Contains Element    ${click_type}
    Click Element   ${click_type}
    Run Keyword If     '${expected_output}' == 'OK'     Page Should Not Contain     error
    Run Keyword If     '${expected_output}' == 'Alert'    Wait Until Page Contains Element     ${alert_navbar}
    Run Keyword If     '${expected_output}' == 'Alert'    Page Should Contain Element     ${alert_navbar}