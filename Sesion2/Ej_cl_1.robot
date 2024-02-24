*** Settings ***
Library    BuiltIn
Library    SeleniumLibrary
Variables    config.yml

*** Test Cases ***
Open tranzact
    [Tags]    testweb
    Open Browser    https://www.google.com/    chrome

#Search tranzact
    Click Element	id:APjFqb
    Input Text    id:APjFqb    Tranzact Net
    Press Keys    id:APjFqb    ENTER
    Click Element    xpath://h3[@class="LC20lb MBeuO DKV0Md"]
    #Close Browser