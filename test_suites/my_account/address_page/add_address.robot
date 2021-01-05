*** Settings ***
Library  SeleniumLibrary
Library  String

Resource    ../../../resources/common/common.robot
Resource    ../../../resources/my_account/my_addresses.robot

Suite Setup  Open Site and log in
Suite Teardown  Close Browser

Test Setup  my_addresses.Open Addresses Page

*** Variables ***

*** Test Cases ***
Add New Address
    # Info
    [Documentation]  Add new address
    [Tags]  Component
    # Procedure
    Add New Address
    my_addresses.Verify Changed Info  

Add New Address with existing alias
    # Info
    [Documentation]  Add new address with existing alias
    [Tags]  Component  Faulty
    # Procedure
    ${existing_alias}=  Get Text  xpath://*[@id="center_column"]/div[1]/div[1]/div[1]/ul/li[1]/h3
    Click Element  xpath://*[@id="center_column"]/div[2]/a
    common.Generate Random info
    my_addresses.Fill In Required Fields
    Input Text  id:alias  ${existing_alias}  clear=True
    Click Element  id:submitAddress
    Page Should Contain  The alias "${existing_alias}" has already been used. Please select another one.

Add New Address with no phone
    # Info
    [Documentation]  Add new address with no phone
    [Tags]  Component  Faulty
    # Procedure
    Click Element  xpath://*[@id="center_column"]/div[2]/a
    common.Generate Random info
    my_addresses.Fill In Required Fields
    Input Text  id:phone  ${EMPTY}  clear=True
    Click Element  id:submitAddress
    Page Should Contain  error

Add New Address with no address
    # Info
    [Documentation]  Add new address with no address
    [Tags]  Component  Faulty
    # Procedure
    Click Element  xpath://*[@id="center_column"]/div[2]/a
    common.Generate Random info
    my_addresses.Fill In Required Fields
    Input Text  id:address1  ${EMPTY}  clear=True
    Click Element  id:submitAddress
    Page Should Contain  error

Add New Address with no city
    # Info
    [Documentation]  Add new address with no city
    [Tags]  Component  Faulty
    # Procedure
    Click Element  xpath://*[@id="center_column"]/div[2]/a
    common.Generate Random info
    my_addresses.Fill In Required Fields
    Input Text  id:city  ${EMPTY}  clear=True
    Click Element  id:submitAddress
    Page Should Contain  error

Add New Address with no zip
    # Info
    [Documentation]  Add new address with no zip
    [Tags]  Component  Faulty
    # Procedure
    Click Element  xpath://*[@id="center_column"]/div[2]/a
    common.Generate Random info
    my_addresses.Fill In Required Fields
    Input Text  id:postcode  ${EMPTY}  clear=True
    Click Element  id:submitAddress
    Page Should Contain  error

Add New Address with Invalid zip
    # Info
    [Documentation]  Add new address with invalid zip
    [Tags]  Component  Faulty
    # Procedure
    Click Element  xpath://*[@id="center_column"]/div[2]/a
    common.Generate Random info
    my_addresses.Fill In Required Fields
    Input Text  id:postcode  garbage  clear=True
    Click Element  id:submitAddress
    Page Should Contain  error
