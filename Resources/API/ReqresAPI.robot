*** Settings ***
Documentation               Keywords for Reqres API
Resource                    ../../Data/InputData.robot
Library                     RequestsLibrary
Library                     Collections


*** Keywords ***
Get List Of Users
    ${response} =                   Get on session      ${ALIAS}        ${API_USERS}
    Status should be                ${STATUS_200}
    ${json} =                       Set variable        ${response.json()}
    # Compare that the received json is similar to the original
    ${original_json}                evaluate            json.loads($API_USERS_LIST)    json
    Dictionaries Should Be Equal    ${original_json}    ${json}

Create New User
    Post on session                 ${ALIAS}            ${API_USERS}        ${API_USER_ADD}
    Status should be                ${STATUS_201}

Update User
    Put on session                  ${ALIAS}            ${API_USERS_2}      ${API_USER_UPDATE}
    Status should be                ${STATUS_200}

Get Second User Data
    ${response} =                   Get on session      ${ALIAS}        ${API_USERS_2}
    Status should be                ${STATUS_200}
    # Store json in variable
    ${json} =                       Set variable        ${response.json()}
    Should be equal as strings      ${json['data']['first_name']}       ${API_USERS_2_FIRSTNAME}

Delete Second User Data
    Delete on session               ${ALIAS}            ${API_USERS_2}
    Status should be                ${STATUS_204}
