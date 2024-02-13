*** Settings ***
Documentation               Example Robot Framework suite for automation tests against Reqres API
Resource                    ../../Data/InputData.robot
Resource                    ../../Resources/Common.robot
Resource                    ../../Resources/API/ReqresAPI.robot
Suite Setup                 Common.Create Session API

*** Test Cases ***
Get list of users
    [Documentation]         API returns list of all users
    [Tags]                  API
    ReqresAPI.Get List Of Users

Create a new user
    [Documentation]         Create a new user in the list
    [Tags]                  API
    ReqresAPI.Create New User

Update old user
    [Documentation]         Update an old user in the list
    [Tags]                  API
    ReqresAPI.Update User

Get second user information
    [Documentation]         API returns second user information from the list
    [Tags]                  API
    ReqresAPI.Get Second User Data