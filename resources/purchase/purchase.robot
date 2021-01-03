*** Settings ***
Library  SeleniumLibrary
Library     BuiltIn
Resource    ../global_variables.robot
Resource    ../common/common.robot
Resource    ../log_in/log_in.robot

*** Keywords ***
Purchase Cart
    #make sure we made it correctly
    Location Should Be  ${order}
    Sleep  2s
    #if cart is empty, exit
    Element Should Not Contain  xpath://*[@id="header"]/div[3]/div/div/div[3]/div/a     empty
    #Proceed simply
    Press Keys  xpath://*[@id="center_column"]/p[2]/a[1]    RETURN
    Press Keys  name=processAddress    RETURN
    Select Checkbox     name=cgv
    Press Keys  name=processCarrier     RETURN
    Click Element   xpath://*[@id="HOOK_PAYMENT"]/div[1]/div/p/a
    Press Keys  xpath://*[@id="cart_navigation"]/button  RETURN
    Page Should Contain     Your order on My Store is complete.
    Go To   ${website}
    Sleep  3s
    
