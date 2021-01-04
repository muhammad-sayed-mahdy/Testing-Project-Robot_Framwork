*** Settings ***
Library  SeleniumLibrary


Resource    ../../resources/common/common.robot
Resource    ../../resources/various_stuff/search.robot

Suite Setup      common.Open Site
Suite Teardown   Close Browser

*** Test Cases ***

Empty Field
    # Info
    [Documentation]  Testing out "Search" with empty field
    [Tags]  Component
    # Procedure
    Fill Search  NULL
    Page Should Contain Element     ${alert_search}

Irrelevant Field
    # Info
    [Documentation]  Testing out "Search" with irrelevant field
    [Tags]  Component
    # Procedure
    Fill Search  hello
    Page Should Contain Element     ${alert_search}

Relevant Field
    # Info
    [Documentation]  Testing out "Search" with relevant field
    [Tags]  Component
    # Procedure
    Fill Search  Blouse
    Page Should Not Contain Element     ${alert_search}
