*** Settings ***
Documentation    All the page objects and keywords of landing page.
Library    SeleniumLibrary

Resource    Generic.robot

*** Variables ***
${orders_page_load}        css:.ng-star-inserted td
${expectedMessage}         Thank you for Shopping With Us
*** Keywords ***
    
Wait until element is located in the page
    Generic.Wait until element passed is located on page    ${orders_page_load}

Verify order summary
    ${expectedOrderId}=         Get Text    css:tbody tr:nth-child(1) [scope='row']
    ${expectedProductName}=     Get Text    css:tbody tr:nth-child(1) td:nth-child(3)
    ${expectedProductPrice}=    Get Text    css:tbody tr:nth-child(1) td:nth-child(4)
    Click Button    css:tbody tr:nth-child(1) button
    Wait Until Element Is Visible    css:.email-preheader
    Element Text Should Be    css:.email-preheader    ${expectedMessage}
    Element Text Should Be    css:div[class='col-text -main']    ${expectedOrderId}
    Element Text Should Be    xpath:(//*[@class='text'])[1]    ${user_name}
    Element Text Should Be    css:.title    ${expectedProductName}
    Element Text Should Be    css:.price    ${expectedProductPrice}
