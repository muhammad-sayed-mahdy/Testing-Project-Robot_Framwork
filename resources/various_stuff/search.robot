*** Settings ***
Library  SeleniumLibrary
Library     BuiltIn
Resource    ../global_variables.robot
Resource    ../common/common.robot

    
*** Keywords ***

Fill Search
    [Arguments]    ${search_text}   ${subject}
    Input Text  ${search}     ${search_text}     clear=True
    Click Element   ${submit}
    Run Keyword Unless     '${subject}' == 'NULL'    Wait Until Page Contains Element  ${sortby}
    Run Keyword Unless     '${subject}' == 'NULL'    select from list by label  ${sortby}   ${subject}