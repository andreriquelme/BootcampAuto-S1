*** Settings ***
Library    BuiltIn
Library    SeleniumLibrary
Library    String

*** Variables ***


*** Test Cases ***
Test 01
#Create new user
    [Tags]    t01
    Open Browser    https://dev--taupe-pithivier-3c339a.netlify.app/#/    chrome
    Sleep    1
    Click Element    xpath://html/body/app-root/app-header/header/ul/li[3]
    Input Text    xpath://html/body/app-root/div/app-register/div/form/input[1]    Teeest1
    Input Text    xpath://html/body/app-root/div/app-register/div/form/input[2]    Teeest1
    Input Password    xpath://html/body/app-root/div/app-register/div/form/input[3]    1
    Click Element    xpath://html/body/app-root/div/app-register/div/form/button

Test 02
#Log in - Credencials OK
    [Tags]    t02
    Open Browser    https://dev--taupe-pithivier-3c339a.netlify.app/#/    chrome
    Sleep    1
    Click Element    xpath://html/body/app-root/app-header/header/ul/li[2]
    Input Text    xpath://html/body/app-root/div/app-login/div/form/input[1]    Teeest1
    Input Password    xpath://html/body/app-root/div/app-login/div/form/input[2]    1
    Click Element    xpath://html/body/app-root/div/app-login/div/form/button

Test 03
#Create existing user - Error
    [Tags]    t03
    Open Browser    https://dev--taupe-pithivier-3c339a.netlify.app/#/    chrome
    Sleep    1
    Click Element    xpath://html/body/app-root/app-header/header/ul/li[3]
    Input Text    xpath://html/body/app-root/div/app-register/div/form/input[1]    Teest1
    Input Text    xpath://html/body/app-root/div/app-register/div/form/input[2]    Teest1
    Input Password    xpath://html/body/app-root/div/app-register/div/form/input[3]    1
    Click Element    xpath://html/body/app-root/div/app-register/div/form/button
    Sleep    1
    Element Text Should Be    xpath://html/body/app-root/div/app-register/div/form/app-form-errors/ul/li[1]    email has already been taken
    Element Text Should Be    xpath://html/body/app-root/div/app-register/div/form/app-form-errors/ul/li[2]    username has already been taken

Test 04
#Log in - Credencials ERROR
    [Tags]    t04
    Open Browser    https://dev--taupe-pithivier-3c339a.netlify.app/#/    chrome
    Sleep    1
    Click Element    xpath://html/body/app-root/app-header/header/ul/li[2]
    Input Text    xpath://html/body/app-root/div/app-login/div/form/input[1]    Teest1
    Input Password    xpath://html/body/app-root/div/app-login/div/form/input[2]    rr
    Click Element    xpath://html/body/app-root/div/app-login/div/form/button
    Sleep    1
    Element Text Should Be    xpath://li[@class="error"]    email or password is invalid


Test 05
#New Article
    [Tags]    t05
    Open Browser    https://dev--taupe-pithivier-3c339a.netlify.app/#/    chrome
    Sleep    1
    Click Element    xpath://html/body/app-root/app-header/header/ul/li[2]
    Input Text    xpath://html/body/app-root/div/app-login/div/form/input[1]    Teest1
    Input Password    xpath://html/body/app-root/div/app-login/div/form/input[2]    1
    Click Element    xpath://html/body/app-root/div/app-login/div/form/button
    Sleep    1
    Click Element    xpath://html/body/app-root/app-header/header/ul/li[2]
    Input Text    xpath://html/body/app-root/div/app-new-article/app-article-form/form/input[1]    Art01
    Input Text    xpath://html/body/app-root/div/app-new-article/app-article-form/form/input[2]    Abou01
    Input Text    xpath://html/body/app-root/div/app-new-article/app-article-form/form/textarea    Body01
    Input Text    xpath://html/body/app-root/div/app-new-article/app-article-form/form/div/app-tag-list-select/input    Tag01
    Click Button    xpath://button[@class="btn submit-btn btn-lg"]
    Sleep    4

Test 06
#Create existing article - ERROR
    [Tags]    t06
    Open Browser    https://dev--taupe-pithivier-3c339a.netlify.app/#/    chrome
    Sleep    1
    Click Element    xpath://html/body/app-root/app-header/header/ul/li[2]
    Input Text    xpath://html/body/app-root/div/app-login/div/form/input[1]    Teest1
    Input Password    xpath://html/body/app-root/div/app-login/div/form/input[2]    1
    Click Element    xpath://html/body/app-root/div/app-login/div/form/button
    Sleep    1
    Click Element    xpath://html/body/app-root/app-header/header/ul/li[2]
    Input Text    xpath://html/body/app-root/div/app-new-article/app-article-form/form/input[1]    Art01
    Input Text    xpath://html/body/app-root/div/app-new-article/app-article-form/form/input[2]    Abou01
    Input Text    xpath://html/body/app-root/div/app-new-article/app-article-form/form/textarea    Body01
    Click Button    xpath://button[@class="btn submit-btn btn-lg"]
    Sleep    1
    Element Text Should Be    xpath://li[@class="error"]    title must be unique
    Sleep    3

Test 07
#Create article with empty fields - ERROR
    [Tags]    t07
    Open Browser    https://dev--taupe-pithivier-3c339a.netlify.app/#/    chrome
    Sleep    1
    Click Element    xpath://html/body/app-root/app-header/header/ul/li[2]
    Input Text    xpath://html/body/app-root/div/app-login/div/form/input[1]    Teest1
    Input Password    xpath://html/body/app-root/div/app-login/div/form/input[2]    1
    Click Element    xpath://html/body/app-root/div/app-login/div/form/button
    Sleep    1
    Click Element    xpath://html/body/app-root/app-header/header/ul/li[2]  
    Click Button    xpath://button[@class="btn submit-btn btn-lg"]
    Sleep    1
    Element Text Should Be    xpath://li[@class="error"]    title can't be blank
    Sleep    3

