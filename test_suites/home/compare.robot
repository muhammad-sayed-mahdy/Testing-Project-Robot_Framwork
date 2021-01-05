*** Settings ***
Library  SeleniumLibrary
Library     String
Library     BuiltIn

Resource    ../../resources/common/common.robot     #browser stuff
Resource    ../../resources/log_in/log_in.robot     #log in
Resource    ../../resources/log_out/log_out.robot   #log out
Resource    ../../resources/home/addtocart.robot  

Suite Setup      common.Open Site
Suite Teardown   Close Browser

*** Test Cases ***
Compare
    # testing add to Cart in popular list
    log_in.Log in user  ${email_1}  ${pass_1}
    Go To   ${website}

*** Keywords ***
