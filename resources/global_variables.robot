*** Settings ***
Library     BuiltIn


*** Variables ***
${email_1}    test113124656
${pass_1}     robotframeworkpass
${user_1}     test_1

*** Keywords ***
Call Test_1 Info
    Set Global Variable     ${email_1}
    Set Global Variable     ${pass_1}
    Set Global Variable     ${user_1}
    