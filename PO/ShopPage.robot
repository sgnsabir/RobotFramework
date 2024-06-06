*** Settings ***
Documentation    All the page objects and keywords of landing page.
Library    SeleniumLibrary
Library    Collections

Resource    Generic.robot

*** Variables ***
${Shop_page_load}             css:.card-body b

*** Keywords ***
Wait until element is located in the page
    Generic.Wait until element passed is located on page    ${Shop_page_load}

#Verify card title in the shop page
#    @{expectedList} =     Create List    ZARA COAT 3    ADIDAS ORIGINAL    IPHONE 13 PRO
#    @{elements} =    Get WebElements    css:.card-body b
#    @{actualList} =    Create List
#
#    FOR	${element}    IN    @{elements}
#        Log     ${element.text}
#        Append To List    ${actualList}    ${element.text}
#    END
#    Lists Should Be Equal    ${expectedList}    ${actualList}
#
#Select the card
#    [Arguments]        ${productName}
#    @{elements} =    Get WebElements    css:.card-body b
#    ${index} =    Set Variable    1
#    FOR	${element}    IN    @{elements}
#        Exit For Loop If    '${productName}' == '${element.text}'
#            ${index}=    Evaluate    ${index} + 1
#    END
#    Click Button    xpath:(//*[@class='card-footer']/button)[${index}]

