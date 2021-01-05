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
Sort-by Case
    log_in.Log in user  ${email_1}  ${pass_1}
    Go To   ${website}
    Click Element  xpath://*[@id="block_top_menu"]/ul/li[1]/a
    Click Element  xpath://*[@id="selectProductSort"]
    Click Element  xpath://*[@id="selectProductSort"]/option[1]
    Sleep  10s
    Page Should Not Contain  Loading...

Categories Case
    log_in.Log in user  ${email_1}  ${pass_1}
    Go To   ${website}
    Click Element  xpath://*[@id="block_top_menu"]/ul/li[1]/a
    Click Element  xpath://*[@id="layered_category_4"]
    Sleep  10s
    Page Should Not Contain  Loading...

Size Case
    log_in.Log in user  ${email_1}  ${pass_1}
    Go To   ${website}
    Click Element  xpath://*[@id="block_top_menu"]/ul/li[1]/a
    Click Element  xpath://*[@id="layered_id_attribute_group_1"]
    Sleep  10s
    Page Should Not Contain  Loading...

Compositions Case
    log_in.Log in user  ${email_1}  ${pass_1}
    Go To   ${website}
    Click Element  xpath://*[@id="block_top_menu"]/ul/li[1]/a
    Click Element  xpath://*[@id="layered_id_feature_5"]
    Sleep  10s
    Page Should Not Contain  Loading...

*** Keywords ***
