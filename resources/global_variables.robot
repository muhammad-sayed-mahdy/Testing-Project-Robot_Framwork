*** Settings ***
Library     BuiltIn


*** Variables ***
${email_1}    test113124656
${pass_1}     robotframeworkpass
${user_1}     test_1

${email_2}    test277877285
${pass_2}     robotframeworkpass
${user_2}     test_2


*** Keywords ***
Call Test_1 Info
    Set Global Variable     ${email_1}
    Set Global Variable     ${pass_1}
    Set Global Variable     ${user_1}

Call Test_2 Info
    Set Global Variable     ${email_2}
    Set Global Variable     ${pass_2}
    Set Global Variable     ${user_2}
    