*** Settings ***
Documentation               Common keywords
Resource                    ../Data/InputData.robot
Resource                    ./PO/Login.robot
Resource                    ./PO/Inventory.robot
Library                     SeleniumLibrary


*** Keywords ***
Start Web Test
    #Set selenium speed                      0.2s      # Debug purpose
    Set selenium timeout                    10s
    Open browser                            about:blank      ${BROWSER}
    Maximize browser window

Start Web Test And Login
    #Set selenium speed                      0.2s      # Debug purpose
    Set selenium timeout                    10s
    Open browser                            about:blank      ${BROWSER}
    Maximize browser window
    Go To Login Page
    User Log In                             ${USER}

Go To Login Page
    Login.Navigate To
    Login.Verify Page Loaded

User Log In
    [Arguments]     ${User}
    Login.Login With Valid Credentials      ${User}
    Inventory.Verify Page Loaded

Stop Web Test
    Close all browsers
