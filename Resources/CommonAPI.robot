*** Settings ***
Documentation               Common keywords
Resource                    ../Data/InputData.robot
Library                     RequestsLibrary



*** Keywords ***
# API COMMON
Create Session API
    Create session                          ${ALIAS}          ${URL_API}      verify=True