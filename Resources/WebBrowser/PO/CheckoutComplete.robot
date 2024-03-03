*** Settings ***
Documentation       Check out complete page functionality
Library             Browser


*** Variables ***
${CHECKOUTCOMPLETE_NAVIGATION_ELEMENT} =                xpath=/*//span[text()='Checkout: Complete!']
${CHECKOUTCOMPLETE_NAVIGATION_ELEMENT_TEXT} =           Checkout: Complete!
${CHECKOUTCOMPLETE_BACK} =                              id=back-to-products
${CHECKOUTCOMPLETE_ORDER_COMPLETE} =                    xpath=//*/h2[@class="complete-header"]
${CHECKOUTCOMPLETE_ORDER_COMPLETE_TEXT} =                    Thank you for your order!


*** Keywords ***
Verify Page Loaded
    Get text                                            ${CHECKOUTCOMPLETE_NAVIGATION_ELEMENT}      ==      ${CHECKOUTCOMPLETE_NAVIGATION_ELEMENT_TEXT}

Finish Order
    Click                                               ${CHECKOUTCOMPLETE_BACK}

Order Completed Succesfully
    Get text                                            ${CHECKOUTCOMPLETE_ORDER_COMPLETE}          ==      ${CHECKOUTCOMPLETE_ORDER_COMPLETE_TEXT}