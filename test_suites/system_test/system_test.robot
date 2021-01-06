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
Resource    ../../resources/my_account/my_addresses.robot           #address

Suite Setup      common.Open Site
Suite Teardown   Close Browser

*** Test Cases ***
System Test
    # Info
    [Documentation]  Normal Use Case
    [Tags]  System Test
    # Procedure:

    # Sign up, log out then log in
    sign_up.Sign Up
    Page Should Not Contain     error

    # Change personal info .. SAYED
    #Change Lastname
    Open personal information
    ${new_lastname}=   Generate Random String    8     [LOWER]
    Input Text  id=lastname  ${new_lastname}  clear=True
    personal_info.Enter Current Password
    personal_info.Save Info
    Page Should Contain  Your personal information has been successfully updated.
    personal_info.Verify Changed Info  ${new_lastname}

    #Change Email
    ${var}=   Generate Random String     10    [LETTERS][NUMBERS]
    ${new_email}=   Catenate    SEPARATOR=  ${var}  ${sign_up_prefix}
    Input Text  id:email  ${new_email}  clear=True
    personal_info.Enter Current Password  
    personal_info.Save Info
    Go To  ${personal_info_page}
    Element Attribute Value Should Be  id:email  value  ${new_email}
    Set Global Variable     ${email}  ${new_email} 
    
    #1
    my_addresses.Open Addresses Page
    my_addresses.Add New Address
    my_addresses.Verify Changed Info  
    #2
    my_addresses.Open Addresses Page
    ${existing_alias}=  Get Text  xpath://*[@id="center_column"]/div[1]/div[1]/div[1]/ul/li[1]/h3
    Click Element  xpath://*[@id="center_column"]/div[2]/a
    common.Generate Random info sub
    my_addresses.Fill In Required Fields
    Input Text  id:alias  ${existing_alias}  clear=True
    Click Element  id:submitAddress
    Page Should Contain  The alias "${existing_alias}" has already been used. Please select another one.
    #3
    my_addresses.Open Addresses Page
    Click Element  xpath://*[@id="center_column"]/div[2]/a
    common.Generate Random info sub
    my_addresses.Fill In Required Fields
    Input Text  id:phone  ${EMPTY}  clear=True
    Click Element  id:submitAddress
    Page Should Contain  error

    #Login and Logout
    log_out.Log out user
    Sleep  1s
    Page Should Not Contain     Sign out
    log_in.Log in user  ${email}  ${password}
    Page Should Not Contain     Sign in


    # Navigate
    Click Navbar With Check     ${navbar_woman}  OK 
    Click Navbar With Check     ${navbar_specials}   OK
    Click Navbar With Check     ${navbar_new_products}  Alert
    Click Navbar With Check     ${navbar_best_sellers}  OK 

    # Search, Sort, and add to wishlist
    Fill Search  Dress      Price: Highest first
    Page Should Not Contain Element     ${alert_search}
    Wait Until Page Contains Element    ${first_div_sortby}
    Element Should Contain    ${first_div_sortby}     Printed Dress


    # Add to Cart   .. Kareem
    addtocart.Add to cart
    Click Element   xpath://*[@id="header"]/div[3]/div/div/div[3]/div/a


                                            # Compare       .. Kareem

    # Purchase
    purchase.Purchase Cart

    # Log out
    log_out.Log out user
    Sleep  1s
    Page Should Not Contain     Sign out

    #Restart
    Close Browser
    common.Open Site
    log_in.Log in user  ${email}  ${password}
    Page Should Not Contain     error

    # Order History .. Sayed
    personal_info.Test Order History

    #End of Discussion
    log_out.Log out user
    Sleep  1s
    Page Should Not Contain     Sign out

    