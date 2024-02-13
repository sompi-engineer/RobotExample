*** Settings ***
Documentation       Login page functionality
Resource            ../../../Data/InputData.robot
Resource            ../../Common.robot
Library             SeleniumLibrary


*** Variables ***
${LOGIN_NAVIGATION_ELEMENT} =               xpath=//*/div[text()='Swag Labs']
${LOGIN_USERNAME_TEXTBOX} =                 id=user-name
${LOGIN_PASSWORD_TEXTBOX} =                 id=password
${LOGIN_SIGNIN_BUTTON} =                    id=login-button


*** Keywords ***
Navigate To
    Go to                                   ${URL}

Verify Page Loaded
    Wait until page contains element        ${LOGIN_NAVIGATION_ELEMENT}

Login With Valid Credentials
    [Arguments]    ${User}
    Fill Username                           ${User.User}
    Fill Password                           ${User.Password}
    Submit Sign In

Fill Username
    [Arguments]    ${User.User}
    Input text                              ${LOGIN_USERNAME_TEXTBOX}      ${User.User}

Fill Password
    [Arguments]    ${User.Password}
    Input text                              ${LOGIN_PASSWORD_TEXTBOX}      ${User.Password}

Enter Credentials
    [Arguments]    ${Credentials}
    IF  '${Credentials.User}' != '#BLANK'
        Input text                          ${LOGIN_USERNAME_TEXTBOX}      ${Credentials.User}
    END
    IF  '${Credentials.Password}' != '#BLANK'
        Input text                          ${LOGIN_PASSWORD_TEXTBOX}      ${Credentials.Password}
    END

Verify Error Message
    [Arguments]  ${ExpectedErrorMessage}
    Page should contain                     ${ExpectedErrorMessage}
    Reload page
    Wait until page contains element        ${LOGIN_NAVIGATION_ELEMENT}

Submit Sign In
    Click element                           ${LOGIN_SIGNIN_BUTTON}