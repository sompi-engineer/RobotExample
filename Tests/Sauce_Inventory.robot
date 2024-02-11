*** Settings ***
Documentation               Example Robot Framework suite for automation tests against SauceDemo web page login
Resource                    ../Data/InputData.robot
Resource                    ../Resources/Common.robot
Resource                    ../Resources/SauceApp.robot
Test Setup                  Common.Start Web Test And Login
Test Teardown               Common.Stop Web Test

# Run Tests
# robot -d Results Tests/Sauce_Inventory.robot

*** Test Cases ***

Sort inventory items by currency value
    [Documentation]         User is able to sort inventory items from high to low and low to high by currency value
    [Tags]                  2001    Regression  Inventory
    SauceApp.Sort Items High To Low
    SauceApp.Sort Items Low To High

User is able to add all items to the cart
    [Documentation]         User is able to add all inventory items to the cart
    [Tags]                  2002    Regression   Inventory
    SauceApp.Add All Items To Cart

User is able to navigate in cart and continue shopping
    [Documentation]         User is able to add one inventory item to the cart, open cart and then continue shopping
    [Tags]                  2003    Smoke   Inventory   Cart
    SauceApp.Add Bike Light Item To Cart
    SauceApp.Open Cart
    SauceApp.Continue Shopping From Cart
    SauceApp.Remove Bike Light Item From Cart

User is able to order selected items
    [Documentation]         User is able to add one inventory item to the cart, open cart and make an order
    [Tags]                  2004    Smoke   Inventory   Cart    Order
    SauceApp.Add Bike Light Item To Cart
    SauceApp.Open Cart
    SauceApp.Continue To Checkout Step 1
    SauceApp.Make Order With Valid Customer Information    ${CUSTOMER1}
    SauceApp.Finish Order From Checkout Step 2