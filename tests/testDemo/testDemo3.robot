*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library    String
Library    Collections
Test Setup    Open The Browser With The Mortgage Payment Url
Test Teardown        Close Browser
Resource             ../../PO/demoResource.robot


*** Variables ***
${Error_Message_Login}        class:alert

*** Test Cases ***
Validate Child window Functionality
    Select the link of child window
    Verify the user is switched to child window
    Grab the email id in the child window
    Switch to parent window and enter the email  ${email}    ${valid_password}

*** Keywords ***

Select the link of child window
    Click Link        css:.blinkingText
    Sleep             5
    Switch Window     NEW

Verify the user is switched to child window
    #Element Should Be Visible        css:.red
    Element Text Should Be    css:h1    DOCUMENTS REQUEST
    
Grab the email id in the child window
    ${text} =           Get Text        css:.red
    @{words} =          Split String    ${text}    at
    ${text_split} =     Get From List    ${words}    1
    @{getText} =        Split String    ${text_split}
    ${email} =        Get From List    ${getText}    0
    Set Global Variable    ${email}

Switch to parent window and enter the email
     [Arguments]  ${email}  ${password}
    Switch Window        MAIN
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
    Input Text        id:username     ${email}
    Input Password    id:password    ${password}
    #Click Button      id:signInBtn
    
    
