*** Settings ***
Library    BuiltIn
Library    SeleniumLibrary
Library    String
Library    RequestsLibrary
Library    OperatingSystem


*** Variables ***
${TEXTO1}    laptop
${TEXTO2}    java
${TEXTO3}    lima
${LISTA_DE_BUSQUEDA}    TST1    SECURITY API    PERFORMANCE API
${COUNT} =    0

*** Test Cases ***
Busqueda
    [Tags]    busq
    Open Browser    https://nkrlj.csb.app/    chrome
    Sleep    4
    Input Text    xpath://input[@class="search-field-input"]    ${TEXTO1}
    Click Button    xpath://button[@class="search-field-button"]
    Sleep    2
    Element Text Should Be    xpath://html/body/div/div/ul[1]/li[1]    ${TEXTO1}
    Element Text Should Be    xpath://html/body/div/div/ul[2]/li[1]    ${TEXTO1}
    #Clear Element Text    xpath://input[@class="search-field-input"]
    Input Text    xpath://input[@class="search-field-input"]    ${TEXTO2}
    Click Button    xpath://button[@class="search-field-button"]
    Sleep    2
    Element Text Should Be    xpath://html/body/div/div/ul[1]/li[2]    ${TEXTO2}
    Element Text Should Be    xpath://html/body/div/div/ul[2]/li[2]    ${TEXTO2}
    #Clear Element Text    xpath://input[@class="search-field-input"]
    Input Text    xpath://input[@class="search-field-input"]    ${TEXTO3}
    Click Button    xpath://button[@class="search-field-button"]
    Sleep    2
    Element Text Should Be    xpath://html/body/div/div/ul[1]/li[3]    ${TEXTO3}
    Element Text Should Be    xpath://html/body/div/div/ul[2]/li[3]    ${TEXTO3}


API
    [Tags]    api
    ${base_url} =    Set Variable    https://hn.algolia.com/api/v1/search?query=BUSQUEDA
    ${headers} =    Create Dictionary    Content-Type~application/json

    
    
    FOR    ${busqueda}    IN    @{LISTA_DE_BUSQUEDA}
        ${response}    GET    https://hn.algolia.com/api/v1/search?query=BUSQUEDA
        Input Text    locator    text
        ${elements} =    Get WebElements    locator
        FOR    ${articles}    IN    @{response['articles']}
            ${COUNT} =    ${COUNT}+1
            Should Contain    container    item
            Should Be Equal    first    second
        END

    END
    
    





