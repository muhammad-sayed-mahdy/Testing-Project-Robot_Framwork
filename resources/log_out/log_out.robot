*** Settings ***
Library  SeleniumLibrary

Resource    ../global_variables.robot
Resource    ../common/common.robot



*** Keywords ***
Log out user
    # Go To  ${logout_page}    #Another way of doing things.
    Click Element  xpath://*[@id="header"]/div[2]/div/div/nav/div[2]/a
    Wait Until Element Contains     xpath://*[@id="header"]/div[2]/div/div/nav/div[1]/a     Sign in
    
    
    