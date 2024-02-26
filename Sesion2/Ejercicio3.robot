*** Settings ***
Library    BuiltIn
Library    SeleniumLibrary
Library    String


*** Variables ***
${Upload}    xpath://html/body/div/div[3]/form/table/tbody/tr[4]/td/input[1]
${Add}    C:${/}Users${/}andre.riquelme${/}Desktop${/}TEST1.PNG

*** Test Cases ***
Complete Data
    [Tags]    form
    Open Browser    https://testpages.eviltester.com/styled/basic-html-form-test.html    chrome
    Input Text    name=username    Andre
    Input Text    name=password    hola123
    Clear Element Text    name=comments
    Input Text    name=comments    Test1
    Choose File    ${Upload}    ${Add}
    #Checkbox #2 #1
    Click Element    xpath://html/body/div/div[3]/form/table/tbody/tr[5]/td/input[2]
    Click Element    xpath://html/body/div/div[3]/form/table/tbody/tr[5]/td/input[1]
    Click Element    xpath://html/body/div/div[3]/form/table/tbody/tr[5]/td/input[3]
    #Radio #1
    Click Element    xpath://html/body/div/div[3]/form/table/tbody/tr[6]/td/input[1]
    #Multiple #2
    Click Element    xpath://html/body/div/div[3]/form/table/tbody/tr[7]/td/select/option[4]
    Click Element    xpath://html/body/div/div[3]/form/table/tbody/tr[7]/td/select/option[2]
    #Dropdown #6
    Select From List By Label    name=dropdown    Drop Down Item 6
    Sleep    3
    #Submit
    Click Element    xpath://html/body/div/div[3]/form/table/tbody/tr[9]/td/input[2]
    Sleep    10