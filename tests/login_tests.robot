***Settings***
Library    SeleniumLibrary
Resource   ../resources/common_keywords.robot
Test Setup       Open Browser And Maximize For Test    ${LOGIN_URL}    ${BROWSER}
Test Teardown    Close Browser

***Variables***
${INVALID_PASS}                 wrongpassword
${DASHBOARD_URL}                https://opensource-demo.orangehrmlive.com/web/index.php/dashboard/index
${DASHBOARD_TITLE}              OrangeHRM
${LOGIN_ERROR_MESSAGE_XPATH}    xpath=//div[contains(@class,'oxd-alert--error')]//p
${EXPECTED_LOGIN_ERROR_TEXT}    Invalid credentials

***Test Cases***
Valid Login Test
    [Documentation]    Test login with valid credentials and verify dashboard access.
    [Tags]    Smoke    Login    Positive
    Ensure Login Page Is Ready
    Attempt Login With Credentials    ${VALID_USER}    ${VALID_PASS}
    # Verify Successful Login is part of Attempt Login With Credentials

Invalid Login Test
    [Documentation]    Test login with invalid credentials and verify error message.
    [Tags]    Login    Negative
    Ensure Login Page Is Ready
    Input Login Credentials    ${VALID_USER}    ${INVALID_PASS}  # Don't use Attempt Login as it expects success
    Click Login Button
    Wait Until Page Contains Element    ${LOGIN_ERROR_MESSAGE_XPATH}    timeout=10s
    ${error_text} =    Get Text    ${LOGIN_ERROR_MESSAGE_XPATH}
    Should Be Equal As Strings    ${error_text}    ${EXPECTED_LOGIN_ERROR_TEXT}

Dashboard Page Validation After Login
    [Documentation]    Validate dashboard URL and title after a successful login.
    [Tags]    Dashboard    Positive
    Ensure Login Page Is Ready
    Attempt Login With Credentials    ${VALID_USER}    ${VALID_PASS}
    ${current_url} =    Get Location
    Should Be Equal As Strings    ${current_url}    ${DASHBOARD_URL}
    ${page_title} =     Get Title
    Should Be Equal As Strings    ${page_title}    ${DASHBOARD_TITLE}
