*** Settings ***
Library  SeleniumLibrary
Library  String

Resource    ../../resources/common/common.robot
Resource    ../../resources/my_account/personal_info.robot
Resource    ../../resources/log_in/log_in.robot
Resource    ../../resources/log_out/log_out.robot

Suite Setup  Open Site and Create a new user
Suite Teardown  Close Browser

Test Setup  Open personal information

*** Variables ***

*** Test Cases ***
Change lastname
    # Info
    [Documentation]  Change last name
    [Tags]  Component
    # Procedure
    ${new_lastname}=   Generate Random String    8     [LOWER]
    Input Text  id=lastname  ${new_lastname}  clear=True
    personal_info.Enter Current Password
    personal_info.Save Info
    Page Should Contain  Your personal information has been successfully updated.
    Verify Changed Info  ${new_lastname}

Change info without password
    # Info
    [Documentation]  Change info without entring password
    [Tags]  Component  Faulty
    # Procedure
    Change lastname
    personal_info.Save Info
    Page Should Contain  error

Change info with incorrect password
    # Info
    [Documentation]  Change last name
    [Tags]  Component  Faulty
    # Procedure
    Change lastname
    personal_info.Enter Current Password  garbage_pwd
    personal_info.Save Info
    Page Should Contain  The password you entered is incorrect.

Change firstname
    # Info
    [Documentation]  Change last name
    [Tags]  Component
    # Procedure
    ${new_firstname}=   Generate Random String    8     [LOWER]
    Input Text  id=lastname  ${new_firstname}  clear=True
    personal_info.Enter Current Password
    personal_info.Save Info
    Page Should Contain  Your personal information has been successfully updated.
    Verify Changed Info  ${new_firstname}

Change Social Title
    #Info
    [Documentation]  Change social title
    [Tags]  Component
    #Procedure
    Select Radio Button  id_gender  1
    personal_info.Enter Current Password  
    personal_info.Save Info
    Go To  ${personal_info_page}
    Radio Button Should Be Set To  id_gender  1

Change Email address
    #Info
    [Documentation]  Change email address
    [Tags]  Component
    #Procedure
    ${var}=   Generate Random String     10    [LETTERS][NUMBERS]
    ${new_email}=   Catenate    SEPARATOR=  ${var}  ${sign_up_prefix}
    Input Text  id:email  ${new_email}  clear=True
    personal_info.Enter Current Password  
    personal_info.Save Info
    Go To  ${personal_info_page}
    Element Attribute Value Should Be  id:email  value  ${new_email}
    Set Global Variable     ${email}  ${new_email} 
    

Change Date Of Birth
    #Info
    [Documentation]  Change date of birth
    [Tags]  Component
    #Procedure

    #select Date
    ${rand_int}=    Evaluate    random.sample(range(1, 31),1)    random
    ${day}=    Convert To String  ${rand_int}[0]
    Select From List By Value   name=days     ${day}
    ${rand_int}=    Evaluate    random.sample(range(1, 13),1)    random
    ${month}=    Convert To String  ${rand_int}[0]
    Select From List By Value   name=months     ${month}
    ${rand_int}=    Evaluate    random.sample(range(1900, 2022),1)    random
    ${year}=    Convert To String  ${rand_int}[0]
    Select From List By Value   name=years     ${year}

    personal_info.Enter Current Password
    personal_info.Save Info
    
    # verify selected date
    Go To  ${personal_info_page}
    List Selection Should Be  name=days  ${day}
    List Selection Should Be  name=months  ${month}
    List Selection Should Be  name=years  ${year}

Change Password
    #Info
    [Documentation]  Change password
    [Tags]  Integrate
    #Procedure
    ${new_password}=   Generate Random String     10    [LETTERS][NUMBERS]
    Input Text  id:passwd  ${new_password}
    Input Text  id:confirmation  ${new_password}

    personal_info.Enter Current Password
    personal_info.Save Info
    Page Should Contain  Your personal information has been successfully updated.
    
    log_out.Log out user
    # log in with the old password
    log_in.Log in  ${email}  ${password}
    Page Should Contain  error
    #log in with the new password
    log_in.Log in user  ${email}  ${new_password} 
    Page Should Not Contain  error

    Set Global Variable     ${password}  ${new_password} 

Change Password With Incorrect Confirmation
    #Info
    [Documentation]  Change password
    [Tags]  Integrate  Faulty
    #Procedure
    ${new_password}=   Generate Random String     10    [LETTERS][NUMBERS]
    Input Text  id:passwd  ${new_password}
    Input Text  id:confirmation  garbage

    personal_info.Enter Current Password
    personal_info.Save Info
    Page Should Contain  The password and confirmation do not match.
    