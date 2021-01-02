*** Settings ***
Library  SeleniumLibrary
Library     BuiltIn
Resource    ../global_variables.robot
Resource    ../common/common.robot

    
*** Keywords ***

Fill Fields
    [Arguments]    ${subject}    ${email}   ${order_reference}  ${message_text}
    Run Keyword Unless     '${subject}' == 'NULL'  select from list by label  ${subject_heading}   ${subject}
    Input Text  ${email_text}     ${email}     clear=True
    Input Text  ${order_ref}     ${order_reference}      clear=True
    Input Text  ${message}  ${message_text}
    Click Element   ${submit_contact_us}
    

