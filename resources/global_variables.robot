*** Settings ***
Library     BuiltIn


*** Variables ***
${email_1}    test_1@test.com
${pass_1}     robotframeworkpass
${user_1}     test

${email_2}    test_2@test.com
${pass_2}     robotframeworkpass
${user_2}     test

${website}      http://automationpractice.com/index.php
${browser}      chrome
${login_page}   http://automationpractice.com/index.php?controller=authentication&back=my-account
${logout_page}  http://automationpractice.com/index.php?mylogout=