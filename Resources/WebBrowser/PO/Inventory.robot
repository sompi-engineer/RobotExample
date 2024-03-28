*** Settings ***
Documentation       Inventory page functionality
Library             Browser
Library             Collections
Library             String
Library             ../../../Data/CalcLibrary.py

*** Variables ***
${INVENTORY_NAVIGATION_ELEMENT} =               xpath=/*//span[text()='Products']
${INVENTORY_NAVIGATION_ELEMENT_TEXT} =          Products
${INVENTORY_SORT_BY_LIST} =                     xpath=//*/select[@data-test="product-sort-container"]
${INVENTORY_SORT_LOHI} =                        lohi
${INVENTORY_SORT_HILO} =                        hilo
${INVENTORY_ITEM_PRICE} =                       xpath=/*//div[@class='inventory_item_price']
${INVENTORY_BIKE_LIGHT_ADD} =                   id=add-to-cart-sauce-labs-bike-light
${INVENTORY_BIKE_LIGHT_REMOVE} =                id=remove-sauce-labs-bike-light
${INVENTORY_ITEM_REMOVE_TEXT} =                 Remove
${INVENTORY_ITEM_GENERAL_ADD} =                 xpath=/*//button[contains(@id,'add-to-cart-')]
${INVENTORY_ITEM_GENERAL_REMOVE} =              xpath=/*//button[contains(@id,'remove-')]
${INVENTORY_ITEM_GENERAL_DETAIL} =              xpath=/*//div[@class='inventory_item_name ']
${INVENTORY_OPEN_CART} =                        xpath=/*//a[@class='shopping_cart_link']
${INVENTORY_CART_ITEMS} =                       xpath=/*//span[@class='shopping_cart_badge']


*** Keywords ***
Verify Page Loaded
    Get text                                    ${INVENTORY_NAVIGATION_ELEMENT}     ==         ${INVENTORY_NAVIGATION_ELEMENT_TEXT}

Sort Items High To Low
    Select options by                           ${INVENTORY_SORT_BY_LIST}           value       ${INVENTORY_SORT_HILO}

Sort Items Low To High
    Select options by                           ${INVENTORY_SORT_BY_LIST}           value       ${INVENTORY_SORT_LOHI}

Check Items Order High To Low
    ${Order} =                                  Set variable        Decrease
    ${List} =                                   Get elements        ${INVENTORY_ITEM_PRICE}
    @{Texts} =                                  Create list 
    FOR     ${element}   IN  @{List}
        ${Text} =   Get text   ${element}
        ${Text} =   Remove string  ${Text}      $                   # Remove the '$' character from the string
        Log  ${Text}
        Append to list  ${Texts}    ${Text}
    END
    Log  ${Texts}
    ${Result} =     Items order    ${Texts}    ${Order}
    IF    ${Result} == False
        Fail
    END

Check Items Order Low To High
    ${Order} =                                  Set variable        Increase
    ${List} =                                   Get elements        ${INVENTORY_ITEM_PRICE}
    @{Texts} =                                  Create list 
    FOR     ${element}   IN  @{List}
        ${Text} =   Get text   ${element}
        ${Text} =   Remove string  ${Text}      $                   # Remove the '$' character from the string
        Log  ${Text}
        Append to list  ${Texts}    ${Text}
    END
    Log  ${Texts}
    ${Result} =     Items order    ${Texts}    ${Order}
    IF    ${Result} == False
        Fail
    END

Add Bike Light Item To Cart
    Click                                       ${INVENTORY_BIKE_LIGHT_ADD}
    Get text                                    ${INVENTORY_BIKE_LIGHT_REMOVE}      ==      ${INVENTORY_ITEM_REMOVE_TEXT}

Remove Bike Light Item From Cart
    Click                                       ${INVENTORY_BIKE_LIGHT_REMOVE}
    Get text                                    ${INVENTORY_BIKE_LIGHT_ADD}

Add All Items To Cart
    ${Count_Add} =                              Get element count       ${INVENTORY_ITEM_GENERAL_ADD}
    ${Elements} =                               Get elements            ${INVENTORY_ITEM_GENERAL_ADD}
    Log    ${Elements}
    FOR    ${Counter}    IN RANGE    0      ${Count_Add}
        Click           ${Elements[0]}          # Browser library doesn't allow to use Click keyword for elements that uses the same attribute value but it still allows to click element from the list which has the same attribute value. Confusing but it works.
        Log    ${Elements[0]}
    END
    ${Count_Remove} =                           Get element count       ${INVENTORY_ITEM_GENERAL_REMOVE}
    Should be equal as integers                 ${Count_Add}            ${Count_Remove}

Open Cart
    Click                                       ${INVENTORY_OPEN_CART}