*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library    Collections
Test Setup    Open the browser with the Mortgage payment url
Test Teardown   Close Browser Session
Resource        ../../PO/demoResource.robot
#selenium

*** Variables ***
${Error_Message_Login}        class:alert
${Shop_page_load}             css:.card-body

*** Test Cases ***
Validate Unsuccessful Login
    [Tags]    SMOKE
    Fill the login form    ${username}    ${invalid_password}
    Wait until element is located in the page    ${Error_Message_Login}
    Verify error message is correct

Validate Cards display in the Shopping Page
    [Tags]    SMOKE
    Fill the login form    ${username}    ${valid_password}
    Wait until element is located in the page    ${Shop_page_load}
    Verify card title in the shop page
    Select the card    Blackberry

Select the Form and navigate to Child window
    [Tags]    SMOKE
    Fill The Login Details and select the user option     ${username}    ${valid_password}

    
*** Keywords ***

Fill the login Form
    [Arguments]    ${username}    ${password}
    Input Text        id:username     ${user_name}
    Input Password    id:password    ${password}
    Click Button      id:signInBtn


Wait until element is located in the page
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}
    
Verify error message is correct
    #${result}=    Get Text                         ${Error_Message_Login}
    #Should Be Equal As Strings        ${result}        Incorrect username/password.
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.

Verify card title in the shop page
    @{expectedList} =     Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    @{elements} =    Get WebElements    css:.card-title
    @{actualList} =    Create List
    
    FOR	${element}    IN    @{elements}
        Log     ${element.text}
        Append To List    ${actualList}    ${element.text}
    END
    Lists Should Be Equal    ${expectedList}    ${actualList}

Select the card
    [Arguments]        ${productName}
    @{elements} =    Get WebElements    css:.card-title
    ${index} =    Set Variable    1
    FOR	${element}    IN    @{elements}
        Exit For Loop If    '${productName}' == '${element.text}'
            ${index}=    Evaluate    ${index} + 1
    END
    Click Button    xpath:(//*[@class='card-footer']/button)[${index}]

Fill The Login Details and select the user option
    [Arguments]    ${username}    ${password}
    Input Text        id:username     ${user_name}
    Input Password    id:password    ${password}
    Click Element     css:input[value='user']
    Wait Until Element Is Visible    id:okayBtn
    Click Button                     id:okayBtn
    Click Button                     id:okayBtn
    Click Button                     id:okayBtn
    Click Button                     id:okayBtn
    Wait Until Element Is Not Visible    id:okayBtn
    Select From List By Value    css:select.form-control    consult
    Select Checkbox              id:terms
    Checkbox Should Be Selected    id:terms





