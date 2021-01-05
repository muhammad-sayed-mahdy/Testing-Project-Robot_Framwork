*** Settings ***
Library  SeleniumLibrary
Library     String
Library     BuiltIn

Resource    ../../resources/common/common.robot     #browser stuff
Resource    ../../resources/log_in/log_in.robot     #log in
Resource    ../../resources/log_out/log_out.robot   #log out
Resource    ../../resources/sign_up/sign_up.robot   #sign up

Suite Setup      common.Open Site
Suite Teardown   Close Browser

*** Test Cases ***
#This test will FAIL and it shouldn't, but this a website fault.
#   Names doesn't allow numbers in it
Sign up should NOT FAIL 1 
    # Info
    [Documentation]  Added number to user name
    [Tags]  Component Faulty
    # Procedure
    sign_up.Embed sign up values manually   fname1   lname   mail@mail.com   pass123     compx   addressx    cityx   11111   0120
    sign_up.Sign Up     random=0    ignore_error=0
    Page Should Not Contain     error

#This test should FAIL but it doesn't.
#   Names doesn't allow numbers in it, so it shouldn't allow _.,@*&%$#()-=_+
Sign up should FAIL 1
    # Info
    [Documentation]  Since numbers are not allowed, so should .^&*-\
    [Tags]  Component Faulty
    # Procedure
    sign_up.Embed sign up values manually   fname.   lname   mail@mail.com   pass123     compx   addressx    cityx   11111   0120
    sign_up.Sign Up     random=0    ignore_error=0
    Page Should Contain     error

#This test should FAIL but it doesn't.
#   Names allowes spaces in it. and that's wrong.
Sign up should FAIL 2
    # Info
    [Documentation]  Names allowes spaces in it. and that's wrong.
    [Tags]  Component Faulty
    # Procedure
    sign_up.Embed sign up values manually   fname with spaces   lname   mail@mail.com   pass123     compx   addressx    cityx   11111   0120
    sign_up.Sign Up     random=0    ignore_error=0
    Page Should Contain     error

#This test should FAIL and it does.
#   Zipcode should follow 00000
Sign up should FAIL 3
    # Info
    [Documentation]  Zipcode should follow 00000
    [Tags]  Component Faulty
    # Procedure
    sign_up.Embed sign up values manually   fname   lname   mail@mail.com   pass123     compx   addressx    cityx   111110   0120
    sign_up.Sign Up     random=0    ignore_error=0
    Page Should Contain     The Zip/Postal code you've entered is invalid. It must follow this format: 00000

#This test should FAIL and it does.
#   Mobile phone error
Sign up should FAIL 4
    # Info
    [Documentation]  Mobile phone with chars
    [Tags]  Component Faulty
    # Procedure
    sign_up.Embed sign up values manually   fname   lname   mail@mail.com   pass123     compx   addressx    cityx   11111   0120kero
    sign_up.Sign Up     random=0    ignore_error=0
    Page Should Contain     error

#This test shouldnt fail
#   consistent phone number
Sign up should NOT FAIL 2 
    # Info
    [Documentation]  Phone number with +-()
    [Tags]  Component Faulty
    # Procedure
    sign_up.Embed sign up values manually   fname   lname   mail@mail.com   pass123     compx   addressx    cityx   11111   +(2)0120-752
    sign_up.Sign Up     random=0    ignore_error=0
    Page Should Not Contain     error
