***Settings***
Library    SeleniumLibrary
Resource   ../PageObject/admin_page.robot
Resource   ../PageObject/login_page.robot
Resource   ../resources/common_keywords.robot
Test Setup       Open Browser And Maximize For Test    ${LOGIN_URL}    ${BROWSER}
Test Teardown    Close Browser

***Test Cases***
Navigate To Admin Page And Validate
    [Documentation]    Logs in, navigates to Admin page, and validates URL and title.
    [Tags]    Admin    Navigation    Positive
    Attempt Login With Credentials    ${VALID_USER}    ${VALID_PASS}
    Navigate To Admin Page
    ${current_url} =    Get Location
    Should Be Equal As Strings    ${current_url}    ${ADMIN_PAGE_URL}
    ${page_title} =     Get Title
    Should Be Equal As Strings    ${page_title}    ${ADMIN_PAGE_TITLE}
