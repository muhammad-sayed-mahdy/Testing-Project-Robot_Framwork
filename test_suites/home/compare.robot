*** Settings ***
Library  SeleniumLibrary
Library     String
Library     BuiltIn

Resource    ../../resources/common/common.robot     #browser stuff
Resource    ../../resources/log_in/log_in.robot     #log in
Resource    ../../resources/log_out/log_out.robot   #log out

Suite Setup      common.Open Site
Suite Teardown   Close Browser

*** Test Cases ***
Compare Passed Case
    # testing Compare
    log_in.Log in user  ${email_1}  ${pass_1}
    Go To   ${website}
    Click Element  xpath://*[@id="block_top_menu"]/ul/li[1]/a
    Mouse Over     xpath://*[@id="center_column"]/ul/li[2]/div/div[1]/div/a[1]/img
    Click Element  xpath://*[@id="center_column"]/ul/li[2]/div/div[3]/div[2]/a
    Click Element  xpath://*[@id="center_column"]/div[3]/div[2]/form/button
    Click Element  xpath://*[@id="product_comparison"]/tbody/tr[1]/td[2]/div[1]/a/i
    Click Element  xpath://*[@id="block_top_menu"]/ul/li[1]/a
    Element Should Contain     xpath://*[@id="center_column"]/div[3]/div[2]/form/button  (0)

Compare Failed Case
    # testing Compare
    log_in.Log in user  ${email_1}  ${pass_1}
    Go To   ${website}
    Click Element  xpath://*[@id="block_top_menu"]/ul/li[1]/a
    Mouse Over     xpath://*[@id="center_column"]/ul/li[2]/div/div[1]/div/a[1]/img
    Click Element  xpath://*[@id="center_column"]/ul/li[2]/div/div[3]/div[2]/a
    Click Element  xpath://*[@id="center_column"]/div[3]/div[2]/form/button
    Click Element  xpath://*[@id="block_top_menu"]/ul/li[1]/a
    Mouse Over     xpath://*[@id="center_column"]/ul/li[2]/div/div[1]/div/a[1]/img
    Click Element  xpath://*[@id="center_column"]/ul/li[2]/div/div[3]/div[2]/a
    Sleep  10s
    Element Should Contain     xpath://*[@id="center_column"]/div[3]/div[2]/form/button  (1)

*** Keywords ***
