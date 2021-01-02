*** Settings ***
Library     BuiltIn


*** Variables ***
${email_1}    test_1@test.com
${pass_1}     robotframeworkpass
${user_1}     test

${website}      http://automationpractice.com/index.php
${browser}      chrome
${login_page}   http://automationpractice.com/index.php?controller=authentication&back=my-account
${logout_page}  http://automationpractice.com/index.php?mylogout=