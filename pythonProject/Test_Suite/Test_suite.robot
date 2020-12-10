*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
Login invalid username and password
        Open Browser        https://www.saucedemo.com/       chrome
        Set Browser Implicit Wait       5
        Input Text          id=user-name                     shubham
        Input Password      id=password                      1234
        click Button        id=login-button

Login valid username and password
        Input Text          id=user-name                     standard_user
        Input Password      id=password                      secret_sauce
        click Button        id=login-button

Product details
        click Element       id=item_4_title_link

Add product to basket
        click Button       xpath=//button[@class="btn_primary btn_inventory"]

Verfiy the product
        click Element       xpath=//a[@class='shopping_cart_link fa-layers fa-fw']

Checkout the product
        click Element       xpath=//a[@class='btn_action checkout_button']

Fill the details
        Input Text          id=first-name                     Shubham
        Input Text          id=last-name                      Hiremath
        Input Text          id=postal-code                    590005
        click Element       xpath=//input[@value='CONTINUE']

Confirmation message
        click Element       xpath=//a[@class='btn_action cart_button']

*** Keywords ***
Open SWAGLABS by Chrome
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --headless

