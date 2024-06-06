*** Settings ***
Documentation    A resource file with reusable keywords and variables.
...              The system specific keywords created here from our own
...              domain specific language.


Library    SeleniumLibrary
Library    Collections

*** Variables ***
${user_name}                rahulshettyacademy
${invalid_password}         AbrarSabir12
${valid_password}           learning
${url}                      https://rahulshettyacademy.com/loginpagePractise/

*** Keywords ***

open the browser with the Mortgage payment url
    Create Webdriver    Chrome
    Maximize Browser Window
    Go To               ${url}
    Wait Until Element Is Visible    id:username

Close Browser Session
    Close Browser

Wait until element passed is located on page
    [Arguments]    ${page_locator}
    Wait Until Element Is Visible    ${page_locator}
    
Verify card title in the page
    [Arguments]    ${title_locator}
    @{expectedList} =     Create List    ZARA COAT 3    ADIDAS ORIGINAL    IPHONE 13 PRO
    @{elements} =    Get WebElements    ${title_locator}
    @{actualList} =    Create List

    FOR	${element}    IN    @{elements}
        Log     ${element.text}
        Append To List    ${actualList}    ${element.text}
    END
    Lists Should Be Equal    ${expectedList}    ${actualList}
    
    
    