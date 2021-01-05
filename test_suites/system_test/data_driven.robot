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
Log in test Case 1
    # Info
    [Documentation]  LOGIN Test Cases 
    [Tags]  Login Component Data-Driven
    # Procedure
    log_in.Log in user  garbage@garbage.com  ${pass_1}
    Page Should Contain     error
Log in test Case 2
    # Info
    [Documentation]  Logging in
    [Tags]  Login Component Data-Driven
    # Procedure
    log_in.Log in user  ${email_1}  garbage_pwd
    Page Should Contain     error
Log in test Case 3
    # Info
    [Documentation]  Logging in with empty parameters
    [Tags]  Login Component Data-Driven
    # Procedure
    log_in.Log in user  ''  ''
    Page Should Contain     error
Log in test Case 4
    # Info
    [Documentation]  Log out
    [Tags]  Login Component Data-Driven
    # Procedure
    log_out.Log out user
    

Sign up test Cases 1
    # Info
    [Documentation]  Added number to user name
    [Tags]  Sign up Component Data-Driven
    # Procedure
    sign_up.Embed sign up values manually   fname1   lname   mail@mail.com   pass123     compx   addressx    cityx   11111   0120
    sign_up.Sign Up     random=0    ignore_error=0
    Page Should Contain     error

Sign up test Cases 2
    # Info
    [Documentation]  Since numbers are not allowed, so should .^&*-\
    [Tags]  Sign up Component Data-Driven
    # Procedure
    sign_up.Embed sign up values manually   fname.   lname   mail@mail.com   pass123     compx   addressx    cityx   11111   0120
    sign_up.Sign Up     random=0    ignore_error=0
    Page Should Contain     error

Sign up test Cases 3
    # Info
    [Documentation]  Names allowes spaces in it. and that's wrong.
    [Tags]  Sign up Component Data-Driven
    # Procedure
    sign_up.Embed sign up values manually   fname with spaces   lname   mail@mail.com   pass123     compx   addressx    cityx   11111   0120
    sign_up.Sign Up     random=0    ignore_error=0
    Page Should Contain     error

Sign up test Cases 4
    # Info
    [Documentation]  Zipcode should follow 00000
    [Tags]  Sign up Component Data-Driven
    # Procedure
    sign_up.Embed sign up values manually   fname   lname   mail@mail.com   pass123     compx   addressx    cityx   111110   0120
    sign_up.Sign Up     random=0    ignore_error=0
    Page Should Contain     The Zip/Postal code you've entered is invalid. It must follow this format: 00000

Sign up test Cases 5
    # Info
    [Documentation]  Mobile phone with chars
    [Tags]  Sign up Component Data-Driven
    # Procedure
    sign_up.Embed sign up values manually   fname   lname   mail@mail.com   pass123     compx   addressx    cityx   11111   0120kero
    sign_up.Sign Up     random=0    ignore_error=0
    Page Should Contain     error

Sign up test Cases 6
    # Info
    [Documentation]  Phone number with +-()
    [Tags]  Sign up Component Data-Driven
    # Procedure
    sign_up.Embed sign up values manually   fname   lname   mail@mail.com   pass123     compx   addressx    cityx   11111   +(2)0120-752
    sign_up.Sign Up     random=0    ignore_error=0
    Page Should Not Contain     error


Search and Sort test Cases 1
    # Info
    [Documentation]  Testing out "Search" with empty field
    [Tags]  Search Component Data-Driven
    # Procedure
    Fill Search  NULL   NULL
    Page Should Contain Element     ${alert_search}

Search and Sort test Cases 2
    # Info
    [Documentation]  Testing out "Search" with irrelevant field
    [Tags]  Search Component Data-Driven
    # Procedure
    Fill Search  hello  NULL
    Page Should Contain Element     ${alert_search}

Search and Sort test Cases 3
    # Info
    [Documentation]  Testing out "Search" with relevant field
    [Tags]  Search Component Data-Driven
    # Procedure
    Fill Search  Blouse     NULL
    Page Should Not Contain Element     ${alert_search}

Search and Sort test Cases 4
    # Info
    [Documentation]  Testing out "Search" with relevant field SortBy Lowest First
    [Tags]  Search Component Data-Driven
    # Procedure
    Fill Search  Dress      Price: Highest first
    Page Should Not Contain Element     ${alert_search}
    Wait Until Page Contains Element    ${first_div_sortby}
    Element Should Contain    ${first_div_sortby}     Printed Dress

# Filter Sort and Compare test Caese