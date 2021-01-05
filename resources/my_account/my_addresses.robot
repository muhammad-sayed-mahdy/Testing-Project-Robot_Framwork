*** Settings ***
Library  SeleniumLibrary
Library  String

Resource    ../global_variables.robot
Resource    ../common/common.robot


*** Variables ***
${account_page}  http://automationpractice.com/index.php?controller=my-account
${my_addresses_page}    http://automationpractice.com/index.php?controller=address

*** Keywords ***

Open Addresses Page
    go to   ${account_page}
    Click Element  xpath://*[@id="center_column"]/div/div[1]/ul/li[3]/a

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


Verify Changed Info
    
    Page Should Contain  ${address}
    Page Should Contain  ${city}
    Page Should Contain  ${zip}
    Page Should Contain  ${phone}
   