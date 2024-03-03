*** Settings ***
Documentation       Check out step 2 page functionality
Library             Browser


*** Variables ***
${CHECKOUT2_NAVIGATION_ELEMENT} =               xpath=/*//span[text()='Checkout: Overview']
${CHECKOUT2_NAVIGATION_ELEMENT_TEXT} =          Checkout: Overview
${CHECKOUT2_CONTINUE} =                         id=finish


*** Keywords ***
Verify Page Loaded
    Get text                                    ${CHECKOUT2_NAVIGATION_ELEMENT}             ==          ${CHECKOUT2_NAVIGATION_ELEMENT_TEXT}

Finish Order
    Click                                       ${CHECKOUT2_CONTINUE}