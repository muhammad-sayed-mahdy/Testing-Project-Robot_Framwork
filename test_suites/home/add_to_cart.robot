*** Settings ***
Library  SeleniumLibrary
Library     String
Library     BuiltIn

Resource    ../../resources/common/common.robot     #browser stuff
Resource    ../../resources/log_in/log_in.robot     #log in
Resource    ../../resources/log_out/log_out.robot   #log out
Resource    ../../resources/sign_up/sign_up.robot   #sign up
Resource    ../../resources/home/addtocart.robot  

Suite Setup      common.Open Site
Suite Teardown   Close Browser

*** Test Cases ***
Add to cart
    # testing add to Cart in popular list
    log_in.Log in user  ${email_1}  ${pass_1}
    Go To   ${website}
    Mouse Over      xpath://*[@id="homefeatured"]/li[1]/div/div[1]/div/a[1]/img
    # Wait Until Element Is Visible   xpath://*[@id="homefeatured"]/li[1]/div/div[2]/div[2]/a[1]  timeout= 10s
    Click Element   xpath://*[@id="homefeatured"]/li[1]/div/div[2]/div[2]/a[1]
    addtocart.Continue Shopping  1

    # testing add to Cart at more info
    Click Element   xpath://*[@id="homefeatured"]/li[1]/div/div[2]/div[2]/a[2]
    Element Should Contain  xpath://*[@id="center_column"]/div/section[2]/h3  MORE INFO
    Click Element   xpath://*[@id="add_to_cart"]/button/span
    addtocart.Continue Shopping  2
    
    # testing add to Cart at women section
    Click Element  xpath://*[@id="block_top_menu"]/ul/li[1]/a
    Click Element  xpath://*[@id="center_column"]/ul/li[2]/div/div[2]/div[2]/a[1]
    addtocart.Continue Shopping  3

    # testing add to cart in comparison
    Click Element  xpath://*[@id="center_column"]/ul/li[2]/div/div[3]/div[2]/a
    Click Element  xpath://*[@id="center_column"]/div[3]/div[2]/form/button
    Click Element  xpath://*[@id="product_comparison"]/tbody/tr[1]/td[2]/div[5]/div/div/a[1]
    addtocart.Continue Shopping  4

    # remove two instances from cart
    Mouse Over  xpath://*[@id="header"]/div[3]/div/div/div[3]/div/a
    Click Element  xpath://*[@id="header"]/div[3]/div/div/div[3]/div/div/div/div/dl/dt/span/a
    Wait Until Element Contains     xpath://*[@id="header"]/div[3]/div/div/div[3]/div/a/span[1]  2  timeout= 10s

    # add to cart from best sellers
    Click Element  xpath://*[@id="header_logo"]/a/img
    Click Element  xpath://*[@id="home-page-tabs"]/li[2]/a
    Click Element  xpath://*[@id="blockbestsellers"]/li[1]/div/div[2]/div[2]/a[1]
    addtocart.Continue Shopping  3

*** Keywords ***
