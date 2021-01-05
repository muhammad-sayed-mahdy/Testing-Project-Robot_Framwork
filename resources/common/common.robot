*** Settings ***
Library  SeleniumLibrary

Resource    ../global_variables.robot
Resource    ../sign_up/sign_up.robot


*** Keywords ***
Open Site
    Open Browser  ${website}  ${browser}
    

Open Site and Create a new user
    Open Site
    sign_up.Sign Up
    