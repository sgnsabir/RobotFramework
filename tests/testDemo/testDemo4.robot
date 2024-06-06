*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Test Teardown        Close Browser
Test Template        Validate Unsuccessful Login
*** Variables ***
${Error_Message_Login}        class:alert


*** Test Cases ***                username            password
Invalid username                  dashed              learning
Invalid password                  rahulshetty         ploudfg
Special Character                 a!2^$*&^sdf          learning

*** Keywords ***
Validate Unsuccessful Login
    [Arguments]    ${username}    ${password}
    open the browser with the Mortgage payment url
    Fill the login form    ${username}    ${password}
    Wait until it checks and display error message
    Verify error message is correct

open the browser with the Mortgage payment url
    Create Webdriver    Chrome
    Maximize Browser Window
    Go To               https://rahulshettyacademy.com/loginpagePractise/
    Wait Until Element Is Visible    id:username

Fill the login Form
    [Arguments]    ${username}    ${password}
    Input Text        id:username     ${user_name}
    Input Password    id:password    ${password}
    Click Button      id:signInBtn

Wait until it checks and display error message
    Wait Until Element Is Visible    ${Error_Message_Login}
Verify error message is correct
    #${result}=    Get Text                         ${Error_Message_Login}
    #Should Be Equal As Strings        ${result}        Incorrect username/password.
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.

