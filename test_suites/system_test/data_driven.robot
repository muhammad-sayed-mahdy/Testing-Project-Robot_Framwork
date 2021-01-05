*** Settings ***
Library     SeleniumLibrary
Library     String
Library     BuiltIn

Resource    ../../resources/common/common.robot                     #browser stuff
Resource    ../../resources/log_in/log_in.robot                     #log in
Resource    ../../resources/log_out/log_out.robot                   #log out
Resource    ../../resources/sign_up/sign_up.robot                   #sign up
Resource    ../../resources/various_stuff/search.robot              #search
Resource    ../../resources/various_stuff/bottom_navbar.robot       #navbar
Resource    ../../resources/purchase/purchase.robot                 #to purchase
Resource    ../../resources/my_account/personal_info.robot          #personal info
Resource    ../../resources/home/addtocart.robot                    #add to cart


Suite Setup      common.Open Site
Suite Teardown   Close Browser

*** Test Cases ***
Log in test Cases

Sign up test Cases

Search and Sort test Cases

Filter Sort and Compare test Caese