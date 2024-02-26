*** Settings ***
Library    BuiltIn
Library    SeleniumLibrary


*** Variables ***


*** Test Cases ***
Open iframe
    [Tags]    testframes
    Open Browser    https://testpages.herokuapp.com/styled/iframes-test.html    chrome
    Select Frame	id:thedynamichtml
    ${frs} =    Get WebElements    xpath=//ul/li
    FOR    ${fr}    IN    @{frs}
        Log To Console    ${fr.text}
        #Log to Console    $x("//li")
    END



    