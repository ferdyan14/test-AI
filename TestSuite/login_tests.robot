***Settings***
Library    SeleniumLibrary
Resource   ../PageObject/login_page.robot
Resource   ../resources/common_keywords.robot # For BROWSER variable and Open Browser keyword for Test Setup
Test Setup       Open Browser And Maximize For Test    ${LOGIN_URL}    ${BROWSER}
Test Teardown    Close Browser

***Test Cases***
Valid Login Test
    [Documentation]    Test login with valid credentials and verify dashboard access, URL, and title.
    [Tags]    Smoke    Login    Positive
    Ensure Login Page Is Ready
    Attempt Login With Credentials    ${VALID_USER}    ${VALID_PASS}
    # Verify Successful Login is part of Attempt Login With Credentials
    ${current_url} =    Get Location
    Should Be Equal As Strings    ${current_url}    ${DASHBOARD_URL}
    ${page_title} =     Get Title
    Should Be Equal As Strings    ${page_title}    ${DASHBOARD_TITLE}

Invalid Login Test
    [Documentation]    Test login with invalid credentials and verify error message.
    [Tags]    Login    Negative
    Ensure Login Page Is Ready
    Input Login Credentials    ${VALID_USER}    ${INVALID_PASS}
    Click Login Button
    Wait Until Page Contains Element    ${LOGIN_ERROR_MESSAGE_XPATH}    timeout=10s
    ${error_text} =    Get Text    ${LOGIN_ERROR_MESSAGE_XPATH}
    Should Be Equal As Strings    ${error_text}    ${EXPECTED_LOGIN_ERROR_TEXT}
