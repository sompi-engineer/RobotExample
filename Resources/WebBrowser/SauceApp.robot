*** Settings ***
Documentation               Keywords for SauceDemo web application for BrowserLibrary
Resource                    ../../Data/InputData.robot
Resource                    ./PO/Login.robot
Resource                    ./PO/Inventory.robot
Resource                    ./PO/Cart.robot
Resource                    ./PO/CheckoutStep1.robot
Resource                    ./PO/CheckoutStep2.robot
Resource                    ./PO/CheckoutComplete.robot


*** Keywords ***
# Login Page
Go To Login Page
    Login.Navigate To

User Log In
    [Arguments]     ${User}
    Go To Login Page
    Login.Login With Valid Credentials      ${User}
    Inventory.Verify Page Loaded

Test Multiple Login Scenarios
    [Arguments]     ${Credentials}
    Go To Login Page
    Attempt Login                           ${Credentials}
    Verify Login Page Error Message         ${Credentials.ExpectedErrorMessage}

Attempt Login
    [Arguments]     ${Credentials}
    Login.Enter Credentials                 ${Credentials}
    Login.Submit Sign In

Verify Login Page Error Message
    [Arguments]     ${ExpectedErrorMessage}
    Login.Verify Error Message              ${ExpectedErrorMessage}

Sort Items High To Low
    Inventory.Sort Items High To Low
    Inventory.Check Items Order High To Low

Sort Items Low To High
    Inventory.Sort Items Low To High
    Inventory.Check Items Order Low To High

Add Bike Light Item To Cart
    Inventory.Add Bike Light Item To Cart

Remove Bike Light Item From Cart
    Inventory.Remove Bike Light Item From Cart

Add All Items To Cart
    Inventory.Add All Items To Cart

Open Cart
    Inventory.Open Cart
    Cart.Verify Page Loaded

Continue Shopping From Cart
    Cart.Continue Shopping
    Inventory.Verify Page Loaded

Continue To Checkout Step 1
    Cart.Continue To Checkout
    CheckoutStep1.Verify Page Loaded

Continue Order From Checkout Step 1
    CheckoutStep1.Continue Order
    CheckoutStep2.Verify Page Loaded

Finish Order From Checkout Step 2
    CheckoutStep2.Finish Order
    CheckoutComplete.Verify Page Loaded
    CheckoutComplete.Order Completed Succesfully

Make Order With Valid Customer Information
    [Arguments]     ${Customer1}
    CheckoutStep1.Customer With Valid Information      ${Customer1}
    Continue Order From Checkout Step 1
    