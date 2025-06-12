***Settings***
Library    SeleniumLibrary

***Variables***
${BROWSER}       Chrome

***Keywords***
Open Browser And Maximize For Test
    [Arguments]    ${url_to_open}    ${browser_to_use}
    Open Browser    ${url_to_open}    ${browser_to_use}    options=add_argument("--headless");add_argument("--no-sandbox");add_argument("--disable-dev-shm-usage");add_argument("--window-size=1920,1080")
    Maximize Browser Window
    Wait Until Page Contains Element    name:username    timeout=10s # This wait might be too specific if this keyword is truly generic
