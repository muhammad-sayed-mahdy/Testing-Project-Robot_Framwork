*** Settings ***
Library  SeleniumLibrary
Library  String

Resource    ../../../resources/common/common.robot
Resource    ../../../resources/my_account/my_addresses.robot

Suite Setup  my_addresses.Open Site Log in and Add Address
Suite Teardown  Close Browser

Test Setup  my_addresses.Open Addresses Page

*** Variables ***
${update_button}  xpath://*[@id="center_column"]/div[1]/div/div/ul/li[9]/a[1]
${second_alias}  xpath://*[@id="center_column"]/div[1]/div/div[2]/ul/li[1]/h3

*** Test Cases ***
Update Info
    # Info
    [Documentation]  update info of the address
    [Tags]  Component
    # Procedure
    Click Element  ${update_button}
    common.Generate Random info SUB
    my_addresses.Fill In Required Fields
    Click Element  id:submitAddress
    my_addresses.Verify Changed Info

Update Company
    # Info
    [Documentation]  Update company
    [Tags]  Component
    # Procedure
    Click Element  ${update_button}
    ${company}  Generate Random String  12  [LETTERS][NUMBERS]
    Input Text  id:company  ${company}  clear=True
    Click Element  id:submitAddress
    Page Should Contain  ${company}

Update Address2
    # Info
    [Documentation]  Update address2
    [Tags]  Component
    # Procedure
    Click Element  ${update_button}
    ${address2}  Generate Random String  22  [LETTERS][NUMBERS]
    Input Text  id:address2  ${address2}  clear=True
    Click Element  id:submitAddress
    Page Should Contain  ${address2}

Update Mobile Phone
    # Info
    [Documentation]  Update Mobile Phone
    [Tags]  Component
    # Procedure
    Click Element  ${update_button}
    ${phone}=   Generate Random String  12  [NUMBERS]
    Input Text  id:phone_mobile  ${phone}  clear=True
    Click Element  id:submitAddress
    Page Should Contain  ${phone}

Update Additional Info
    # Info
    [Documentation]  Update Additional information
    [Tags]  Component
    # Procedure
    Click Element  ${update_button}
    ${info}=   Generate Random String  50  [LETTERS][NUMBERS]
    Input Text  id:other  ${info}  clear=True
    Click Element  id:submitAddress
    Click Element  ${update_button}
    Element Text Should Be  id:other  ${info}

Update Invalid Mobile Phone
    # Info
    [Documentation]  Update Invalid Mobile Phone 
    [Tags]  Component  Faulty
    # Procedure
    Click Element  ${update_button}
    Input Text  id:phone_mobile  garbage  clear=True
    Click Element  id:submitAddress
    Page Should Contain  error

Update Address with existing alias
    # Info
    [Documentation]  update address with existing alias
    [Tags]  Component  Faulty
    # Procedure
    # create second address if not exists
    ${status}  ${value}=  Run Keyword and Ignore Error  Page Should Contain Element  ${second_alias}
    Run Keyword if  '${status}'=='FAIL'  my_addresses.Add New Address
    # get the alias of the seccond address
    ${existing_alias}=  Get Text  ${second_alias}
    Click Element  ${update_button}
    common.Generate Random info SUB
    my_addresses.Fill In Required Fields
    Input Text  id:alias  ${existing_alias}  clear=True
    Click Element  id:submitAddress
    Page Should Contain  The alias "${existing_alias}" has already been used. Please select another one.

Update Address with no phone
    # Info
    [Documentation]  update address with no phone
    [Tags]  Component  Faulty
    # Procedure
    Click Element  ${update_button}
    common.Generate Random info SUB
    my_addresses.Fill In Required Fields
    Input Text  id:phone  ${EMPTY}  clear=True
    Input Text  id:phone_mobile  ${EMPTY}  clear=True
    Click Element  id:submitAddress
    Page Should Contain  error

Update Address with no address
    # Info
    [Documentation]  Update address with no address
    [Tags]  Component  Faulty
    # Procedure
    Click Element  ${update_button}
    common.Generate Random info SUB
    my_addresses.Fill In Required Fields
    Input Text  id:address1  ${EMPTY}  clear=True
    Click Element  id:submitAddress
    Page Should Contain  error

Update Address with no city
    # Info
    [Documentation]  Add new address with no city
    [Tags]  Component  Faulty
    # Procedure
    Click Element  ${update_button}
    common.Generate Random info SUB
    my_addresses.Fill In Required Fields
    Input Text  id:city  ${EMPTY}  clear=True
    Click Element  id:submitAddress
    Page Should Contain  error

Update Address with no zip
    # Info
    [Documentation]  Update address with no zip
    [Tags]  Component  Faulty
    # Procedure
    Click Element  ${update_button}
    common.Generate Random info SUB
    my_addresses.Fill In Required Fields
    Input Text  id:postcode  ${EMPTY}  clear=True
    Click Element  id:submitAddress
    Page Should Contain  error

Update Address with Invalid zip
    # Info
    [Documentation]  Update address with invalid zip
    [Tags]  Component  Faulty
    # Procedure
    Click Element  ${update_button}
    common.Generate Random info SUB
    my_addresses.Fill In Required Fields
    Input Text  id:postcode  garbage  clear=True
    Click Element  id:submitAddress
    Page Should Contain  error
