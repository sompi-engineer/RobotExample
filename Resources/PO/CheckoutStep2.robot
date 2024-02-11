*** Settings ***
Documentation       Check out step 2 page functionality
Library             SeleniumLibrary


*** Variables ***
${CHECKOUT2_NAVIGATION_ELEMENT} =               xpath=/*//span[text()='Checkout: Overview']
${CHECKOUT2_CONTINUE} =                         id=finish


*** Keywords ***
Verify Page Loaded
    Wait until page contains element            ${CHECKOUT2_NAVIGATION_ELEMENT}

Finish Order
    Click button                                ${CHECKOUT2_CONTINUE}