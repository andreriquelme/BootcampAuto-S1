*** Settings ***
Library    BuiltIn
Library    SeleniumLibrary
Library    String


*** Variables ***


*** Test Cases ***
Generate Data
    [Tags]    datrdm
    Open Browser    https://testpages.herokuapp.com/styled/validation/input-validation.html    chrome
    ${low} =    Generate Random String    8
    ${hex} =    Generate Random String    2
    Input Text    id=firstname    ${low}
    Input Text    id=surname    ${low}
    Input Text    id=age    ${hex}

    #${low} =    Generate Random String    8
    #Log To Console    ${low}

     
