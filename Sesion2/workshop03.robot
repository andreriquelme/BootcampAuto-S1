*** Settings ***
Library    BuiltIn
Library    SeleniumLibrary
Variables    config.yml

*** Test Cases ***
Open google
    [Tags]    testweb
    Open Browser    https://www.google.com/    chrome
    Close Browser