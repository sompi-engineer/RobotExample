*** Settings ***
Documentation       Inventory page functionality
Library             SeleniumLibrary


*** Variables ***
${CART_NAVIGATION_ELEMENT} =                xpath=/*//span[text()='Your Cart']
${CART_CONTINUE_CHECKOUT} =                 id=checkout
${CART_CONTINUE_SHOPPING} =                 id=continue-shopping
${CART_ITEM_GENERAL_REMOVE} =               xpath=/*//button[contains(@id,'remove-')]


*** Keywords ***
Verify Page Loaded
    Wait until page contains element            ${CART_NAVIGATION_ELEMENT}

Continue To Checkout
    Click button                                ${CART_CONTINUE_CHECKOUT}

Continue Shopping
    Click button                                ${CART_CONTINUE_SHOPPING}
