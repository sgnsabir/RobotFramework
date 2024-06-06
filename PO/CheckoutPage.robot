*** Settings ***
Documentation    All the page objects and keywords of landing page.
Library    SeleniumLibrary
Library    Collections

Resource    Generic.robot

*** Variables ***
${Cart_page_load}             css:.cartSection h3

*** Keywords ***
Go To Checkout page
    Click Button        css:button[routerlink*='cart']
    
Wait until element is located in the page
    Generic.Wait until element passed is located on page    ${Cart_page_load}

Go To Place Order page
    Scroll Element Into View        xpath://button[.='Checkout']
    Wait Until Element Is Visible    xpath://button[.='Checkout']
    Click Button        xpath://button[.='Checkout']
