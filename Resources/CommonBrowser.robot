*** Settings ***
Documentation               Common keywords
Resource                    ../Data/InputData.robot
Resource                    ./WebBrowser/PO/Login.robot
Resource                    ./WebBrowser/PO/Inventory.robot
Library                     Browser



*** Keywords ***
Start Web Test
    New browser                             ${BROWSER2}      headless=No
    New page                                about:blank

Start Web Test And Login
    New browser                             ${BROWSER2}      headless=No
    New page                                about:blank
    Go To Login Page
    User Log In                             ${USER}

Go To Login Page
    Login.Navigate To

User Log In
    [Arguments]     ${User}
    Login.Login With Valid Credentials      ${User}
    Inventory.Verify Page Loaded

Stop Web Test
    Close page
