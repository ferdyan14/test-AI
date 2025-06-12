***Settings***
Library    SeleniumLibrary
Resource   ../resources/common_keywords.robot
Test Setup       Open Browser And Maximize For Test    ${LOGIN_URL}    ${BROWSER}
Test Teardown    Close Browser

***Variables***
${ADMIN_PAGE_URL}    https://opensource-demo.orangehrmlive.com/web/index.php/admin/viewSystemUsers
${ADMIN_PAGE_TITLE}  OrangeHRM
${ADMIN_MENU_ITEM_XPATH}    xpath=//ul[contains(@class,'oxd-main-menu')]//a[.//span[text()='Admin']]
${USER_MANAGEMENT_HEADER_XPATH}    xpath=//h6[text()='User Management']

***Keywords***
Navigate To Admin Page
    Sleep    2s  # Allow time for dashboard elements to render fully
    Wait Until Page Contains Element    ${ADMIN_MENU_ITEM_XPATH}    timeout=10s
    Click Element    ${ADMIN_MENU_ITEM_XPATH}
    Wait Until Page Contains Element    ${USER_MANAGEMENT_HEADER_XPATH}    timeout=10s

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
