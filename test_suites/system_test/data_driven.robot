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

Filter Sort and Compare test Case 1
    [Tags]  Filter Data-Driven
    log_in.Log in user  ${email_1}  ${pass_1}
    Go To   ${website}
    Click Element  xpath://*[@id="block_top_menu"]/ul/li[1]/a
    Click Element  xpath://*[@id="selectProductSort"]
    Click Element  xpath://*[@id="selectProductSort"]/option[1]
    Sleep  10s
    Page Should Not Contain  Loading...

Filter Sort and Compare test Case 2
    [Tags]  Filter Data-Driven
    Go To   ${website}
    Click Element  xpath://*[@id="block_top_menu"]/ul/li[1]/a
    Click Element  xpath://*[@id="layered_category_4"]
    Sleep  10s
    Page Should Not Contain  Loading...

Filter Sort and Compare test Case 3
    [Tags]  Filter Data-Driven
    Go To   ${website}
    Click Element  xpath://*[@id="block_top_menu"]/ul/li[1]/a
    Click Element  xpath://*[@id="layered_id_attribute_group_1"]
    Sleep  10s
    Page Should Not Contain  Loading...

Filter Sort and Compare test Case 4
    [Tags]  Filter Data-Driven
    Go To   ${website}
    Click Element  xpath://*[@id="block_top_menu"]/ul/li[1]/a
    Click Element  xpath://*[@id="layered_id_feature_5"]
    Sleep  10s
    Page Should Not Contain  Loading...


Personal Info test case 1
    [Documentation]  Change info without entring password
    [Tags]  Personal Info Data-Driven
    # Procedure
    personal_info.Open personal information
    personal_info.Change lastname
    personal_info.Save Info
    Page Should Contain  error

Personal Info test case 2
    [Documentation]  Change info with incorrect password
    [Tags]  Personal Info Data-Driven
    # Procedure
    personal_info.Open personal information

Personal Info test case 3
    [Documentation]  Change firstname
    [Tags]  Personal Info Data-Driven
    # Procedure
    personal_info.Open personal information
    ${new_firstname}=   Generate Random String    8     [LOWER]
    Input Text  id=lastname  ${new_firstname}  clear=True
    personal_info.Enter Current Password
    personal_info.Save Info
    Page Should Contain  Your personal information has been successfully updated.
    Verify Changed Info  ${new_firstname}

Personal Info test case 4
    [Documentation]  Change Social Title
    [Tags]  Personal Info Data-Driven
    # Procedure
    personal_info.Open personal information
    Select Radio Button  id_gender  1
    personal_info.Enter Current Password  
    personal_info.Save Info
    Go To  ${personal_info_page}
    Radio Button Should Be Set To  id_gender  1

Personal Info test case 5
    [Documentation]  Change Email address
    [Tags]  Personal Info Data-Driven
    # Procedure
    personal_info.Open personal information
    ${var}=   Generate Random String     10    [LETTERS][NUMBERS]
    ${new_email}=   Catenate    SEPARATOR=  ${var}  ${sign_up_prefix}
    Input Text  id:email  ${new_email}  clear=True
    personal_info.Enter Current Password  
    personal_info.Save Info
    Go To  ${personal_info_page}
    Element Attribute Value Should Be  id:email  value  ${new_email}
    Set Global Variable     ${email}  ${new_email} 
