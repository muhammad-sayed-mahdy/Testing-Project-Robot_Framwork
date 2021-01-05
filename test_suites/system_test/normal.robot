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


Suite Setup      common.Open Site
Suite Teardown   Close Browser

*** Test Cases ***
Normal Sign Up
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
    Verify Changed Info  ${new_lastname}
    #Change Email
    ${var}=   Generate Random String     10    [LETTERS][NUMBERS]
    ${new_email}=   Catenate    SEPARATOR=  ${var}  ${sign_up_prefix}
    Input Text  id:email  ${new_email}  clear=True
    personal_info.Enter Current Password  
    personal_info.Save Info
    Go To  ${personal_info_page}
    Element Attribute Value Should Be  id:email  value  ${new_email}
    Set Global Variable     ${email}  ${new_email} 


    #Login and Logout
    log_out.Log out user
    Page Should Not Contain     error
    log_in.Log in user  ${email}  ${password}
    Page Should Not Contain     error


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

    # Compare       .. Kareem

    # Add to Cart   .. Kareem
    

    #Add to Cart SUB
    Go To  ${website}
    Click Element   xpath://*[@id="homefeatured"]/li[1]/div/div[2]/div[2]/a[1]
    Wait Until Element Is Visible   xpath://*[@id="layer_cart"]/div[1]/div[2]/div[4]/a  timeout= 10s
    Page Should Contain     Product successfully added to your shopping cart
    Click Element   xpath://*[@id="layer_cart"]/div[1]/div[2]/div[4]/a
    
    # Purchase
    purchase.Purchase Cart

    # Order History .. Sayed


    # Log out
    log_out.Log out user
    Sleep  1s
    Page Should Not Contain     Sign out
    