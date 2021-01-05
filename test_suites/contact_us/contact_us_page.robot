*** Settings ***
Library  SeleniumLibrary


Resource    ../../resources/common/common.robot
Resource    ../../resources/various_stuff/contact_us.robot

Suite Setup      common.Open Site
Suite Teardown   Close Browser

*** Test Cases ***

Empty Fields
    # Info
    [Documentation]  Testing out "Contact us" with all fileds empty
    [Tags]  Component
    # Procedure
    Click Element   ${contact}
    Fill Fields  NULL  ${EMPTY}  ${EMPTY}  ${EMPTY}
    Page Should Contain     error

NoSubject Field
    # Info
    [Documentation]  Testing out "Contact us" with Subject field empty
    [Tags]  Component
    # Procedure
    Click Element   ${contact}
    Fill Fields  NULL   customer@test.com   ${EMPTY}   i am sending my message here.
    Page Should Contain     error

NoEmail Field
    # Info
    [Documentation]  Testing out "Contact us" with Email field empty
    [Tags]  Component
    # Procedure
    Click Element   ${contact}
    Fill Fields  Customer service    ${EMPTY}   ${EMPTY}   i am sending my message here.
    Page Should Contain     error

WrongEmailFormat Field
    # Info
    [Documentation]  Testing out "Contact us" with Wrong Email format empty
    [Tags]  Component
    # Procedure
    Click Element   ${contact}
    Fill Fields  Customer service    wrongemail   ${EMPTY}   i am sending my message here.
    Page Should Contain     error

NoMessage Field
    # Info
    [Documentation]  Testing out "Contact us" with Message field empty
    [Tags]  Component
    # Procedure
    Click Element   ${contact}
    Fill Fields  Customer service    customer@test.com   ${EMPTY}   ${EMPTY}
    Page Should Contain     error

BadFile Ext
    # Info
    [Documentation]  Testing out "Contact us" with Bad file extension
    [Tags]  Component
    # Procedure
    Click Element   ${contact}
    Choose File  id:fileUpload  ${upload_bad_file}
    Fill Fields  Customer service    customer@test.com   ${EMPTY}   ${EMPTY}
    Page Should Contain     error

TextFile Ext
    # Info
    [Documentation]  Testing out "Contact us" with text file extension
    [Tags]  Component
    # Procedure
    Click Element   ${contact}
    Choose File  id:fileUpload  ${upload_txt_file}
    Fill Fields  Customer service    customer@test.com   ${EMPTY}   i am sending my message here.
    Page Should Not Contain     error

ImageFile Ext
    # Info
    [Documentation]  Testing out "Contact us" with image file extension
    [Tags]  Component
    # Procedure
    Click Element   ${contact}
    Choose File  id:fileUpload  ${upload_img_file}
    Fill Fields  Customer service    customer@test.com   ${EMPTY}    i am sending my message here.
    Page Should Not Contain     error

Normal Operation
    # Info
    [Documentation]  Testing out "Contact us" (normal operation)
    [Tags]  Component
    # Procedure
    Click Element   ${contact}
    Fill Fields  Customer service   customer@test.com   1B31H   i am sending my message here.
    Page Should Not Contain     error

