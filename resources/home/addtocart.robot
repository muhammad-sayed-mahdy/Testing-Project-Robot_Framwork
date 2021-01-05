*** Settings ***
Library  SeleniumLibrary

Resource    ../global_variables.robot


*** Keywords ***
Continue Shopping

    [Arguments]    ${count}

    Wait Until Element Is Visible   xpath://*[@id="layer_cart"]/div[1]/div[2]/div[4]/span/span  timeout= 10s
    Page Should Contain     Product successfully added to your shopping cart
    Click Element   xpath://*[@id="layer_cart"]/div[1]/div[2]/div[4]/span/span
    Element Should Contain     xpath://*[@id="header"]/div[3]/div/div/div[3]/div/a/span[1]  ${count}