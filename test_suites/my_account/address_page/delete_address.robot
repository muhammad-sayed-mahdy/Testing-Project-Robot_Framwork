*** Settings ***
Library  SeleniumLibrary
Library  String

Resource    ../../../resources/common/common.robot
Resource    ../../../resources/my_account/my_addresses.robot

Suite Setup  Open Site and log in
Suite Teardown  Close Browser

Test Setup  my_addresses.Open Addresses Page

*** Variables ***
${delete_button}  xpath://*[@id="center_column"]/div[1]/div/div/ul/li[9]/a[2]

*** Test Cases ***
Delete Address
    # Info
    [Documentation]  create a new address then delete the first one
    [Tags]  Integrate  
    # Procedure
    my_addresses.Add New Address
    # get address alias of the address that will be deleted
    ${address alias}=  Get Text  xpath://*[@id="center_column"]/div[1]/div/div/ul/li[1]/h3
    Click Element  ${delete_button}
    Handle Alert
    Page Should not contain  ${address alias}

Delete All Addresses
    # Info
    [Documentation]  delete all addresses
    [Tags]  Component  Excess
    # Procedure
    FOR    ${i}    IN RANGE    999999
        ${status}  ${value}  Run Keyword and ignore error  Page Should Contain Element  ${delete_button}
        Exit For Loop If    '${status}' == 'FAIL'
        Click Element  ${delete_button}
        Handle Alert
    END
    Page Should Contain  No addresses are available