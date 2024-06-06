*** Settings ***
Documentation    All the page objects and keywords of landing page.
Library    SeleniumLibrary

Resource    Generic.robot

*** Variables ***
${Error_Message_Login}        id:toast-container

*** Keywords ***

Fill the login Form
    [Arguments]    ${username}    ${password}
    Input Text        id:userEmail     ${user_name}
    Input Password    id:userPassword    ${password}
    Click Button      id:login

Wait until element is located in the page
    Generic.Wait until element passed is located on page    ${Error_Message_Login}

Verify error message is correct
    Element Text Should Be    ${Error_Message_Login}    Incorrect email or password.

Fill The Login Details and select the user option
    [Arguments]    ${username}    ${password}
    Input Text        id:userEmail     ${user_name}
    Input Password    id:userPassword    ${password}
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

