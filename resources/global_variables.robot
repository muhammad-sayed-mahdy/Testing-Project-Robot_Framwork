*** Settings ***
Library     BuiltIn


*** Variables ***
#Log in Var
${email_1}    test_1@test.com
${pass_1}     robotframeworkpass
${user_1}     test
${email_2}    test_2@test.com
${pass_2}     robotframeworkpass
${user_2}     test

#Pages
${website}      http://automationpractice.com/index.php
${browser}      chrome
${login_page}   http://automationpractice.com/index.php?controller=authentication&back=my-account
${logout_page}  http://automationpractice.com/index.php?mylogout=
${order}        http://automationpractice.com/index.php?controller=order

# Various Stuff # 
                            # contact us
${contact}  id:contact-link             # contact button in the navigation bar
${email_text}   id:email                # email html element to write text in
${order_ref}    id:id_order             # html element to write order ref
${subject_heading}  id_contact          # html element for drop down box
${submit_contact_us}    id:submitMessage    # html submit button for contact us    
${message}  id:message                  # html element to write your message
${upload_bad_file}  ${EXECDIR}${/}upload_files/script.py     # upload file with .py extension
${upload_txt_file}  ${EXECDIR}${/}upload_files/text.txt     # upload file with .txt extension
${upload_img_file}  ${EXECDIR}${/}upload_files/img.png     # upload file with .png extension

                            # search

${search}   id:search_query_top             # html element search text in the navigation bar
${submit}   name:submit_search              # html element search button in the navigation bar         <-----
${alert_search}  class:alert alert-warning    # html element for alert search                          <-----

# Sign up vars
${sign_up_prefix}  @ev.com
${fname}       none         
${lname}       none         
${email}       none         
${password}    none         
${company}     none     
${address}     none     
${city}        none 
${zip}         none 
${phone}       none     