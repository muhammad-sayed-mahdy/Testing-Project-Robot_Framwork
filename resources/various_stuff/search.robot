*** Settings ***
Library  SeleniumLibrary
Library     BuiltIn
Resource    ../global_variables.robot
Resource    ../common/common.robot

    
*** Keywords ***

Fill Search
    [Arguments]    ${search_text}
    Input Text  ${search}     ${search_text}     clear=True
    Click Element   ${submit}
    

