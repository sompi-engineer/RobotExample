*** Settings ***
Documentation               Example Robot Framework suite for automation tests against SauceDemo web page inventory using BrowserLibrary
Resource                    ../../Data/InputData.robot
Resource                    ../../Resources/CommonBrowser.robot
Resource                    ../../Resources/WebBrowser/SauceApp.robot
Test Setup                  CommonBrowser.Start Web Test
Test Teardown               CommonBrowser.Stop Web Test

# Run Tests
# robot -d Results Tests/WebBrowser/Sauce_Login.robot

*** Test Cases ***
Time
    [Documentation]         Test case to validate if Robot Framework environment is properly set up
    [Tags]      101
    ${time}     get time    epoch
    log         ${time}

User is able to login
    [Documentation]         User should be able to login with valid credentials
    [Tags]                  1001    Smoke   LogIn
    SauceApp.User Log In    ${USER}

Invalid login scenarios should display correct error messages
    [Documentation]         Using wrong login credentials should display correct error message
    [Tags]                  1002    Regression  LogIn
    [Template]              SauceApp.Test Multiple Login Scenarios
    ${UNREGISTERED_USER}
    ${ONLY_USER}
    ${ONLY_PASSWORD}
    ${BLANK_CREDENTIALS_USER}
