*** Settings ***
Library    BuiltIn
Library    SeleniumLibrary
Library    String


*** Variables ***


*** Test Cases ***
Generate Data
    [Tags]    datrdm
    Open Browser    https://testpages.herokuapp.com/styled/validation/input-validation.html    chrome
    ${low} =    Generate Random String    12
    ${hex} =    Generate Random String    2    [NUMBERS]
    Input Text    id:firstname    ${low}
    Input Text    id:surname    ${low}
    Input Text    id:age    ${hex}
    Select From List By Label    id:country    Angola
    Input Text    id:notes    ${low}
    Sleep    2
    Click Element    xpath://html/body/div/div[3]/form/input[4]
    Sleep    4
