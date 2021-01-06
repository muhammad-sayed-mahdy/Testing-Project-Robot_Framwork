*** Settings ***
Library  SeleniumLibrary
Library  String

Resource    ../global_variables.robot
Resource    ../common/common.robot


*** Variables ***
${account_page}  http://automationpractice.com/index.php?controller=my-account
${my_addresses_page}    http://automationpractice.com/index.php?controller=addresses
${add_new_address_page}  http://automationpractice.com/index.php?controller=address

*** Keywords ***

Open Addresses Page
    go to   ${my_addresses_page}

Fill In Required Fields
    Input Text  id:address1             ${address}    clear=True
    Input Text  id:city                 ${city}    clear=True
    Input Text  id:postcode             ${zip}    clear=True
    Input Text  id:phone                ${phone}    clear=True
    ${alias}=  Generate Random String    8     [LOWER]
    Input Text  id:alias                ${alias}    clear=True
    #select state
    ${rand_int}=    Evaluate    random.sample(range(1, 50),1)    random
    ${rand_str}=    Convert To String  ${rand_int}[0]
    Select From List By Value   name=id_state     ${rand_str}

Add New Address
    Go To  ${add_new_address_page}
    common.Generate Random info sub
    Fill In Required Fields
    Click Element  id:submitAddress

Verify Changed Info
    Page Should Contain  ${address}
    Page Should Contain  ${city}
    Page Should Contain  ${zip}
    Page Should Contain  ${phone}
   