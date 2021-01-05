*** Settings ***
Library  SeleniumLibrary


Resource    ../../resources/common/common.robot
Resource    ../../resources/various_stuff/bottom_navbar.robot

Suite Setup      common.Open Site
Suite Teardown   Close Browser

*** Test Cases ***

Multiple Navigation
    # Info
    [Documentation]  Testing out "bottom navbar" with multiple accesses
    [Tags]  Component
    # Procedure

    Click Navbar With Check     ${navbar_woman}  OK 
    Click Navbar With Check     ${navbar_specials}   OK
    Click Navbar With Check     ${navbar_new_products}  Alert
    Click Navbar With Check     ${navbar_best_sellers}  OK 