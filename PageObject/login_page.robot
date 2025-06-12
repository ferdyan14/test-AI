***Settings***
Library    SeleniumLibrary
Resource   ../resources/common_keywords.robot # For BROWSER variable and Open Browser keyword if kept there

***Variables***
${LOGIN_URL}     https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${VALID_USER}    Admin
${VALID_PASS}    admin123
${INVALID_PASS}                 wrongpassword
${DASHBOARD_URL}                https://opensource-demo.orangehrmlive.com/web/index.php/dashboard/index
${DASHBOARD_TITLE}              OrangeHRM
${DASHBOARD_HEADER_XPATH}    xpath=//h6[text()='Dashboard']
${LOGIN_ERROR_MESSAGE_XPATH}    xpath=//div[contains(@class,'oxd-alert--error')]//p
${EXPECTED_LOGIN_ERROR_TEXT}    Invalid credentials

***Keywords***
Input Login Credentials
    [Arguments]    ${username}    ${password}
    Input Text      name:username    ${username}
    Input Password  name:password    ${password}

Click Login Button
    Click Button    xpath://button[@type='submit']

Verify Successful Login
    Wait Until Page Contains Element    ${DASHBOARD_HEADER_XPATH}    timeout=10s

Attempt Login With Credentials
    [Arguments]    ${username}    ${password}
    Input Login Credentials    ${username}    ${password}
    Click Login Button
    Verify Successful Login

Ensure Login Page Is Ready
    ${current_url} =    Get Location
    Run Keyword If    "${current_url}" != "${LOGIN_URL}"    Go To    ${LOGIN_URL}
    Wait Until Page Contains Element    name:username    timeout=10s
