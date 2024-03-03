*** Settings ***
Documentation       Inventory page functionality
Library             Browser


*** Variables ***
${CART_NAVIGATION_ELEMENT} =                xpath=/*//span[text()='Your Cart']
${CART_NAVIGATION_ELEMENT_TEXT} =           Your Cart
${CART_CONTINUE_CHECKOUT} =                 id=checkout
${CART_CONTINUE_SHOPPING} =                 id=continue-shopping
${CART_ITEM_GENERAL_REMOVE} =               xpath=/*//button[contains(@id,'remove-')]


*** Keywords ***
Verify Page Loaded
    Get text                                ${CART_NAVIGATION_ELEMENT}      ==      ${CART_NAVIGATION_ELEMENT_TEXT}

Continue To Checkout
    Click                                   ${CART_CONTINUE_CHECKOUT}

Continue Shopping
    Click                                   ${CART_CONTINUE_SHOPPING}
