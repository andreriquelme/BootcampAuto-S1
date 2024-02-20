***Settings***
Variables    config.yml
 
*** Test Cases ***
Workshop Test 01
    Log to console    \n${USERNAME}\n
    Log To Console    ${SITES}\n
    Log To Console    ${SITES['ANHELO']}\n
    Log To Console    ${SITES['ANHELO']['QA']}\n
    Loguear palabra workshop


*** Keywords ***
Loguear palabra workshop
    Log To Console    workshop