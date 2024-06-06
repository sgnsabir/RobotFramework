*** Settings ***
Documentation    All the page objects and keywords of landing page.
Library    SeleniumLibrary

Resource    Generic.robot

*** Variables ***
${confirm_page_load}             css:.hero-primary

*** Keywords ***

Wait until element is located in the page
    Generic.Wait until element passed is located on page    ${confirm_page_load}

Fill up personal Information
    Select From List By Index        xpath:(//select[@class='input ddl'])[1]    6
    Select From List By Index        xpath:(//select[@class='input ddl'])[2]    27
    Input Text    xpath:(//input[@class='input txt'])[1]        375
    Input Text    xpath:(//input[@class='input txt'])[2]        SABIR
    Input Text    css:[name='coupon']        rahulshettyacademy
    Click Button    css:[type='submit']
    Sleep    3

Verify correct user email is displayed
    Element Text Should Be    css:label[type='text']    ${user_name}

Fill up Shipping Information
    [Arguments]    ${country_code}    ${country_name}
    Input Text    css:[placeholder*='Country']    ${country_code}
    Wait Until Element Is Visible    xpath://*[.=' ${country_name}']
    Click Button    xpath://*[.=' ${country_name}']
    Click Link    css:a.action__submit
    Wait until element is located in the page

Validate order confirmation page
    Element Text Should Be    css:.hero-primary    THANKYOU FOR THE ORDER.
    Click Button        css:button[routerlink*='myorders']
    
