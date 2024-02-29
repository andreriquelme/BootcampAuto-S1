*** Settings ***
Library    BuiltIn
Library    SeleniumLibrary
Library    String
Library    RequestsLibrary
Library    OperatingSystem
Library    Collections
#Suite Setup    Create Session    busquedas    https://hn.algolia.com/api

*** Variables ***
${TEXTO1}    laptop
${TEXTO2}    java
${TEXTO3}    lima
${COUNT} =    0
${base_url}    https://hn.algolia.com/api/v1/search
${BUSQUEDA1}    TESTING API
${BUSQUEDA2}    SECURITY API
${BUSQUEDA3}    PERFORMANCE API

*** Keywords ***
Buscar laptop
    Input Text    xpath://input[@class="search-field-input"]    ${TEXTO1}

Buscar java
    Input Text    xpath://input[@class="search-field-input"]    ${TEXTO2}

Buscar lima
    Input Text    xpath://input[@class="search-field-input"]    ${TEXTO3}

Click en search
    Click Button    xpath://button[@class="search-field-button"]

Validar el historial 1
    Element Text Should Be    xpath://html/body/div/div/ul[1]/li[1]    ${TEXTO1}
    Element Text Should Be    xpath://html/body/div/div/ul[2]/li[1]    ${TEXTO1}

Validar el historial 2
    Element Text Should Be    xpath://html/body/div/div/ul[1]/li[2]    ${TEXTO2}
    Element Text Should Be    xpath://html/body/div/div/ul[2]/li[2]    ${TEXTO2}

Validar el historial 3
    Element Text Should Be    xpath://html/body/div/div/ul[1]/li[3]    ${TEXTO3}
    Element Text Should Be    xpath://html/body/div/div/ul[2]/li[3]    ${TEXTO3}

*** Test Cases ***
Busqueda UI
    [Tags]    busq
    Open Browser    https://nkrlj.csb.app/    chrome
    Sleep    4
    Buscar laptop
    Click en search
    Sleep    2
    Buscar java
    Click en search
    #Clear Element Text    xpath://input[@class="search-field-input"]   
    Sleep    2
    Buscar lima
    Click en search
    #Clear Element Text    xpath://input[@class="search-field-input"]
    Sleep    2
    Validar el historial 1
    Validar el historial 2
    Validar el historial 3

API
    [Tags]    api

    ${lista}    Create List    TESTING API    SECURITY API    PERFORMANCE API
    ${response} =    GET    ${base_url}    params=query=${BUSQUEDA1}    expected_status=200
    Log To Console    ${response.content}
    #Should Be Equal As Strings    50    ${response.json()}[nbPages]
    ${response2} =    GET    ${base_url}    params=query=${BUSQUEDA2}    expected_status=200
    Log To Console    ${response2.content}
    ${response3} =    GET    ${base_url}    params=query=${BUSQUEDA3}    expected_status=200
    Log To Console    ${response3.content}
    #Log    ${response.Content}
    #Dictionary Should Contain Value    ${response.json()}    false
    #Should Be Equal As Strings    ${response.reason}    OK
    #FOR    ${BUSQUEDA}    IN    @{busquedas}
    Open Browser    https://nkrlj.csb.app/    chrome
    FOR    ${busqueda}    IN    @{lista}
            ${response} =    GET    url=https://hn.algolia.com/api/v1/search?query=BUSQUEDA
            Input Text    xpath://input[@class="search-field-input"]    ${busqueda}
            ${elements} =    Get WebElements    locator    
    
    #FOR    ${busqueda}    IN    @{LISTA_DE_BUSQUEDA}
            #${response}    GET    https://hn.algolia.com/api/v1/search?query=BUSQUEDA
           # Input Text    xpath://input[@class="search-field-input"]    ${TEXTO1}
            #${elements} =    Get WebElements    locator
            #FOR    ${articles}    IN    @{response['articles']}
                #${COUNT} =    ${COUNT}+1
                #Should Contain    container    item
                #Should Be Equal    first    second
        #END

    #END
    
    





