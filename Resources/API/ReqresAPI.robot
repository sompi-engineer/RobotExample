*** Settings ***
Documentation               Keywords for Reqres API
Resource                    ../../Data/InputData.robot
Library                     RequestsLibrary

*** Keywords ***
Get List Of Users
    ${response} =                   Get on session      ${ALIAS}        ${USERS}
    Status should be                ${STATUS_200}

Create New User
    Post on session                 ${ALIAS}            ${USERS}        ${CUSTOMER1_API}
    Status should be                ${STATUS_201}

Update User
    Put on session                  ${ALIAS}            ${USERS_2}      ${CUSTOMER_UPDATE_API}
    Status should be                ${STATUS_200}

Get Second User Data
    ${response} =                   Get on session      ${ALIAS}        ${USERS_2}
    Status should be                ${STATUS_200}
    # Store json in variable
    ${json} =                       Set variable        ${response.json()}
    Should be equal as strings      ${json['data']['first_name']}       ${USERS_2_FIRSTNAME}
