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
    Fill Search  NULL   NULL
    Page Should Contain Element     ${alert_search}

Irrelevant Field
    # Info
    [Documentation]  Testing out "Search" with irrelevant field
    [Tags]  Component
    # Procedure
    Fill Search  hello  NULL
    Page Should Contain Element     ${alert_search}

Relevant Field NoSortBy
    # Info
    [Documentation]  Testing out "Search" with relevant field
    [Tags]  Component
    # Procedure
    Fill Search  Blouse     NULL
    Page Should Not Contain Element     ${alert_search}

Relevant Field SortBy Lowest First
    # Info
    [Documentation]  Testing out "Search" with relevant field SortBy Lowest First
    [Tags]  Component
    # Procedure
    Fill Search  Dress      Price: Highest first
    Page Should Not Contain Element     ${alert_search}
    Wait Until Page Contains Element    ${first_div_sortby}
    Element Should Contain    ${first_div_sortby}     Printed Dress


Relevant Field SortBy Highest First
    # Info
    [Documentation]  Testing out "Search" with relevant field SortBy Lowest First
    [Tags]  Component
    # Procedure
    Fill Search  Dress      Price: Lowest first
    Page Should Not Contain Element     ${alert_search}
    Wait Until Page Contains Element    ${first_div_sortby}
    Element Should Contain    ${first_div_sortby}     Faded Short Sleeve T-shirts


Relevant Field SortBy A To Z
    # Info
    [Documentation]  Testing out "Search" with relevant field SortBy A to Z
    [Tags]  Component
    # Procedure
    Fill Search  Dress      Product Name: A to Z
    Page Should Not Contain Element     ${alert_search}
    Wait Until Page Contains Element    ${first_div_sortby}
    Element Should Contain    ${first_div_sortby}     Blouse