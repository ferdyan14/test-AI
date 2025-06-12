***Settings***
Library    SeleniumLibrary

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
