*** Settings ***
Documentation       Check out step 1 page functionality
Library             Browser


*** Variables ***
${CHECKOUT1_NAVIGATION_ELEMENT} =               xpath=/*//span[text()='Checkout: Your Information']
${CHECKOUT1_NAVIGATION_ELEMENT_TEXT} =          Checkout: Your Information
${CHECKOUT1_CONTINUE} =                         id=continue
${CHECKOUT1_CANCEL} =                           id=cancel
${CHECKOUT1_FIRSTNAME} =                        id=first-name
${CHECKOUT1_LASTNAME} =                         id=last-name
${CHECKOUT1_ZIP} =                              id=postal-code


*** Keywords ***
Verify Page Loaded
    Get text                                    ${CHECKOUT1_NAVIGATION_ELEMENT}         ==          ${CHECKOUT1_NAVIGATION_ELEMENT_TEXT}

Continue Order
    Click                                       ${CHECKOUT1_CONTINUE}

Cancel Order
    Click                                       ${CHECKOUT1_CANCEL}

Customer With Valid Information
    [Arguments]    ${Customer1}
    Fill First Name                             ${Customer1.FirstName}
    Fill Last Name                              ${Customer1.LastName}
    Fill Postal Code                            ${Customer1.Zip}

Fill First Name
    [Arguments]    ${Customer1.FirstName}
    Fill text                                   ${CHECKOUT1_FIRSTNAME}      ${Customer1.FirstName}

Fill Last Name
    [Arguments]    ${Customer1.LastName}
    Fill text                                   ${CHECKOUT1_LASTNAME}      ${Customer1.LastName}

Fill Postal Code
    [Arguments]    ${Customer1.Zip}
    Fill text                                   ${CHECKOUT1_ZIP}      ${Customer1.Zip}