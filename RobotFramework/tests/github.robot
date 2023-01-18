*** Settings ***
Documentation     Test& documentation
Suite Setup       !SuiteSetup
Suite Teardown    !SuiteTeardown
Library           Selenium2Library

*** Variables ***
${URL}  https://github.com/
${Signin Button Locator}  xpath: //*[contains(text(), "Sign in")]
${username}   test
${password}   test
${username location}  xpath: //*[@id="login_field"]
${password location}  xpath: //*[@id="password"]
${connect location}  xpath: //*[@name="commit"]

*** Keywords ***
!SuiteSetup
    Open Browser    about:blank   chrome
    Sleep  2s
    
!SuiteTeardown
    Close All Browsers


Check Availability
    Click Element  ${Signin Button Locator}
    Sleep  5s

authentification
    Input Text   ${username location}   ${username}
    Sleep  1s
    Input Text   ${password location}   ${password}
    Sleep  1s
    Click Element  ${connect location}
    Sleep  2s


*** Test Cases ***
01_homepage
    [Documentation]    Test d'accès à Github
    Go To    ${URL}
    Wait Until Page Contains    Sign in    timeout=10


02_navigation
    [Documentation]    Test Vérification formulaire authentification
    Sleep  3s
    Check Availability
    Wait Until Page Contains    Username    timeout=10

03_connexion
    [Documentation]    Test authentification
    Sleep  3s
    authentification
    Sleep  3s