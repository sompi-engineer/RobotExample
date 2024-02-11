*** Settings ***
Documentation       Check out complete page functionality
Library             SeleniumLibrary


*** Variables ***
${CHECKOUTCOMPLETE_NAVIGATION_ELEMENT} =                xpath=/*//span[text()='Checkout: Complete!']
${CHECKOUTCOMPLETE_BACK} =                              id=back-to-products
${CHECKOUTCOMPLETE_ORDER_COMPLETE} =                    Thank you for your order!


*** Keywords ***
Verify Page Loaded
    Wait until page contains element                    ${CHECKOUTCOMPLETE_NAVIGATION_ELEMENT}

Finish Order
    Click button                                        ${CHECKOUTCOMPLETE_BACK}

Order Completed Succesfully
    Page should contain                                 ${CHECKOUTCOMPLETE_ORDER_COMPLETE}