*** Settings ***
Library  SeleniumLibrary

Resource    ../global_variables.robot


*** Keywords ***
Open Site
    Open Browser  ${website}  ${browser}
    
    
    