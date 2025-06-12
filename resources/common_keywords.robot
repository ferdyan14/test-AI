***Settings***
Library    SeleniumLibrary

***Variables***
${BROWSER}       Chrome
${LOGIN_URL}     https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${VALID_USER}    Admin
${VALID_PASS}    admin123
${DASHBOARD_HEADER_XPATH}    xpath=//h6[text()='Dashboard']

***Keywords***
Open Browser And Maximize For Test
    [Arguments]    ${url_to_open}    ${browser_to_use}
    Open Browser    ${url_to_open}    ${browser_to_use}    options=add_argument("--headless");add_argument("--no-sandbox");add_argument("--disable-dev-shm-usage");add_argument("--window-size=1920,1080")
    Maximize Browser Window
    Wait Until Page Contains Element    name:username    timeout=10s

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
