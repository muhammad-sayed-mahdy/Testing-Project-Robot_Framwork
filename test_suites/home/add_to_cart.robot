*** Settings ***
Library  SeleniumLibrary
Library     String
Library     BuiltIn

Resource    ../../resources/common/common.robot     #browser stuff
Resource    ../../resources/log_in/log_in.robot     #log in
Resource    ../../resources/log_out/log_out.robot   #log out
Resource    ../../resources/sign_up/sign_up.robot   #sign up
Resource    ../../resources/purchase/purchase.robot  #to purchase

Suite Setup      common.Open Site
Suite Teardown   Close Browser

*** Test Cases ***
Add to cart
    log_in.Log in user  ${email_1}  ${pass_1}
    Go To   ${website}
    Click Element   xpath://*[@id="homefeatured"]/li[1]/div/div[2]/div[2]/a[1]
    Wait Until Element Is Visible   xpath://*[@id="layer_cart"]/div[1]/div[2]/div[4]/span/span  timeout= 10s
    Page Should Contain     Product successfully added to your shopping cart
    Click Element   xpath://*[@id="layer_cart"]/div[1]/div[2]/div[4]/span/span
    Click Element  xpath://*[@id="header"]/div[3]/div/div/div[3]/div/a
    Element Should Contain     xpath://*[@id="header"]/div[3]/div/div/div[3]/div/a/span[1]  1
    

*** Keywords ***

    