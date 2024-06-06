*** Settings ***
Documentation    A resource file with reusable keywords and variables.
...              The system specific keywords created here from our own
...              domain specific language.


Library    SeleniumLibrary
Library    Collections

*** Variables ***
${user_name}                sabir000@gmail.com
${invalid_password}         AbrarSabir12
${valid_password}           AbrarSabir1
${browser_name}             Chrome
${url}                      https://rahulshettyacademy.com/client/

*** Keywords ***

open the browser with the url
    Create Webdriver    ${browser_name}
    Maximize Browser Window
    Go To               ${url}
    Wait Until Element Is Visible    id:userEmail
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
    
    
    