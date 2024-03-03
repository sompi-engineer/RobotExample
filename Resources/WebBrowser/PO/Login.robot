*** Settings ***
Documentation       Login page functionality
Resource            ../../../Data/InputData.robot
Resource            ../../CommonBrowser.robot
Library             Browser


*** Variables ***
${LOGIN_NAVIGATION_ELEMENT} =               xpath=//*/div[text()='Swag Labs']
${LOGIN_USERNAME_TEXTBOX} =                 id=user-name
${LOGIN_PASSWORD_TEXTBOX} =                 id=password
${LOGIN_SIGNIN_BUTTON} =                    id=login-button
${LOGIN_ERROR} =                            xpath=//*/h3[@data-test="error"]


*** Keywords ***
Navigate To
    Go to                                   ${URL}              wait_until=load

Login With Valid Credentials
    [Arguments]    ${User}
    Fill Username                           ${User.User}
    Fill Password                           ${User.Password}
    Submit Sign In

Fill Username
    [Arguments]    ${User.User}
    Fill text                              ${LOGIN_USERNAME_TEXTBOX}      ${User.User}

Fill Password
    [Arguments]    ${User.Password}
    Fill text                              ${LOGIN_PASSWORD_TEXTBOX}      ${User.Password}

Enter Credentials
    [Arguments]    ${Credentials}
    IF  '${Credentials.User}' != '#BLANK'
        Fill text                          ${LOGIN_USERNAME_TEXTBOX}      ${Credentials.User}
    END
    IF  '${Credentials.Password}' != '#BLANK'
        Fill text                          ${LOGIN_PASSWORD_TEXTBOX}      ${Credentials.Password}
    END

Verify Error Message
    [Arguments]  ${ExpectedErrorMessage}
    Get text                                ${LOGIN_ERROR}      ==          ${ExpectedErrorMessage}

Submit Sign In
    Click                                   ${LOGIN_SIGNIN_BUTTON}