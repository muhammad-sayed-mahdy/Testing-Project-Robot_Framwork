*** Settings ***
Library     BuiltIn


*** Variables ***
#Log in Var
${email_1}    test_1@test.comm
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
${submit}   name:submit_search              # html element search button in the navigation bar
${alert_search}     xpath://*[@id="center_column"]/p    # html element for alert message
${sortby}    selectProductSort   # html element for dropdown box filter
${first_div_sortby}     xpath:html/body/div[1]/div[2]/div/div[3]/div[2]/ul/li[1]/div/div[2]/h5/a    # html element for first element in ul (search)


                            # bottom navbar
${navbar_woman}     xpath:/html/body/div[1]/div[3]/footer/div/section[2]/div/div/ul/li/a
${navbar_specials}  xpath:/html/body/div[1]/div[3]/footer/div/section[3]/ul/li[1]/a
${navbar_new_products}  xpath:/html/body/div[1]/div[3]/footer/div/section[3]/ul/li[2]/a
${navbar_best_sellers}  xpath:/html/body/div[1]/div[3]/footer/div/section[3]/ul/li[3]/a
${alert_navbar}     xpath:/html/body/div[1]/div[2]/div/div[3]/div[2]/p

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