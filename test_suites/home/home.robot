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
Purchase Item
    log_in.Log in user  ${email_1}  ${pass_1}
    Go To   ${website}
    Click Element   xpath://*[@id="homefeatured"]/li[1]/div/div[2]/div[2]/a[1]
    Wait Until Element Is Visible   xpath://*[@id="layer_cart"]/div[1]/div[2]/div[4]/a  timeout= 10s
    Page Should Contain     Product successfully added to your shopping cart
    Click Element   xpath://*[@id="layer_cart"]/div[1]/div[2]/div[4]/a
    Purchase Stuff
    

*** Keywords ***
# From Ev: To apply the purchased stuff, use this keyword.
# why kw? cuz I might need to add something to it.
# cart can be empty? yes, and I will detect that.
Purchase Stuff
    purchase.Purchase Cart
    