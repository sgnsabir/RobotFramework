*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library    Collections
Library    ../customLibraries/Shop.py
#Test Setup
Suite Setup       open the browser with the url
Suite Teardown    Close Browser Session
Resource        ../PO/Generic.robot
Resource    ../PO/LandingPage.robot
Resource    ../PO/ShopPage.robot
Resource    ../PO/CheckoutPage.robot
Resource    ../PO/PlaceOrderPage.robot
Resource    ../PO/OrdersPage.robot

*** Variables ***
@{productList}                ZARA COAT 3    ADIDAS ORIGINAL    IPHONE 13 PRO
${Shop_page_load}             css:.card-body b
${Cart_page_load}             css:.cartSection h3
${country_code}               ban
${country_name}               Bangladesh

*** Test Cases ***
Validate Unsuccessful Login
    LandingPage.Fill the login form    ${username}    ${invalid_password}
    LandingPage.Wait until element is located in the page
    LandingPage.Verify error message is correct

Validate Cards display in the Shopping Page
    [Tags]    REGRESSION
    LandingPage.Fill the login form    ${username}    ${valid_password}
    ShopPage.Wait until element is located in the page
    #ShopPage.Verify card title in the shop page
    Generic.Verify card title in the page    ${Shop_page_load}

Validate Add product to Cart
    [Tags]    REGRESSION
    Add Items To Cart    ${productList}
    checkoutPage.Go To Checkout Page
    checkoutPage.Wait until element is located in the page
    Generic.Verify card title in the page    ${Cart_page_load}
    Go To Place Order Page

Confirm order Validation
    [Tags]    REGRESSION
    Fill Up Personal Information
    Fill Up Shipping Information    ${country_code}   ${country_name}
    Validate order confirmation page

Validate Order details
    [Tags]    REGRESSION
    OrdersPage.Wait Until Element Is Located In The Page
    Verify order summary



*** Keywords ***
