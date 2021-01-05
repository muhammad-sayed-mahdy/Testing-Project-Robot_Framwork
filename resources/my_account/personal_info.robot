*** Settings ***
Library  SeleniumLibrary

Resource    ../global_variables.robot
Resource    ../common/common.robot


*** Variables ***
${account_page}  http://automationpractice.com/index.php?controller=my-account
${personal_info_page}    http://automationpractice.com/index.php?controller=identity

*** Keywords ***

Open personal information
    go to   ${account_page}
    Click Element  xpath://*[@id="center_column"]/div/div[1]/ul/li[4]/a

Change lastname
    ${new_lastname}=   Generate Random String    8     [LOWER]
    Input Text  id=lastname  ${new_lastname}  clear=True

Enter Current Password
    [Arguments]  ${pass}= ${password}
    Input Text  id:old_passwd  ${pass}

Save Info
    press keys  name:submitIdentity  RETURN

Verify Changed Info
    [Arguments]  ${new_info}
    Go To  ${personal_info_page}
    Page Should Contain  ${new_info}

Order History Private Call
    Click Element  xpath://*[@id="order-list"]/tbody/tr[1]/td[1]/a
    Wait Until Element Is Visible   xpath://*[@id="submitReorder"]/a  timeout= 10s
    Click Element  xpath://*[@id="submitReorder"]/a
    purchase.Purchase Cart
    
Test Order History
    Go To  ${history}
    ${status}   ${value}=    Run keyword and ignore error  Page should not contain  You have not placed any orders.
    Run Keyword Unless     '${status}' == 'PASS'      Order History Private Call
    