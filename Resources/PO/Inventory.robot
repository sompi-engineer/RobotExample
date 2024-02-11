*** Settings ***
Documentation       Inventory page functionality
Library             SeleniumLibrary
Library             Collections
Library             String
Library             ../../Data/CalcLibrary.py

*** Variables ***
${INVENTORY_NAVIGATION_ELEMENT} =               xpath=/*//span[text()='Products']
${INVENTORY_SORT_BY_LIST} =                     xpath=/*//span[@class='select_container']
${INVENTORY_SORT_LOHI} =                        xpath=/*//option[@value='lohi']
${INVENTORY_SORT_HILO} =                        xpath=/*//option[@value='hilo']
${INVENTORY_ITEM_PRICE} =                       xpath=/*//div[@class='inventory_item_price']
${INVENTORY_BIKE_LIGHT_ADD} =                   id=add-to-cart-sauce-labs-bike-light
${INVENTORY_BIKE_LIGHT_REMOVE} =                id=remove-sauce-labs-bike-light
${INVENTORY_ITEM_GENERAL_ADD} =                 xpath=/*//button[contains(@id,'add-to-cart-')]
${INVENTORY_ITEM_GENERAL_REMOVE} =              xpath=/*//button[contains(@id,'remove-')]
${INVENTORY_ITEM_GENERAL_DETAIL} =              xpath=/*//div[@class='inventory_item_name ']
${INVENTORY_OPEN_CART} =                        xpath=/*//a[@class='shopping_cart_link']
${INVENTORY_CART_ITEMS} =                       xpath=/*//span[@class='shopping_cart_badge']


*** Keywords ***
Verify Page Loaded
    Wait until page contains element            ${INVENTORY_NAVIGATION_ELEMENT}

Sort Items High To Low
    Click element                               ${INVENTORY_SORT_BY_LIST}
    Click element                               ${INVENTORY_SORT_HILO}

Sort Items Low To High
    Click element                               ${INVENTORY_SORT_BY_LIST}
    Click element                               ${INVENTORY_SORT_LOHI}

Check Items Order High To Low
    ${Order} =                                  Set variable        Decrease
    ${List} =                                   Get webelements     ${INVENTORY_ITEM_PRICE}
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
    ${List} =                                   Get webelements     ${INVENTORY_ITEM_PRICE}
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
    Click button                                ${INVENTORY_BIKE_LIGHT_ADD}
    Page should contain button                  ${INVENTORY_BIKE_LIGHT_REMOVE}

Remove Bike Light Item From Cart
    Click button                                ${INVENTORY_BIKE_LIGHT_REMOVE}
    Page should contain button                  ${INVENTORY_BIKE_LIGHT_ADD}

Add All Items To Cart
    ${Count_Add} =                              Get element count       ${INVENTORY_ITEM_GENERAL_ADD}
    FOR    ${counter}    IN RANGE    0      ${Count_Add}
        Click button    ${INVENTORY_ITEM_GENERAL_ADD}
    END
    ${Count_Remove} =                           Get element count       ${INVENTORY_ITEM_GENERAL_REMOVE}
    Should be equal as integers                 ${Count_Add}            ${Count_Remove}

Open Cart
    Page should contain element                 ${INVENTORY_CART_ITEMS}
    Click link                                  ${INVENTORY_OPEN_CART}