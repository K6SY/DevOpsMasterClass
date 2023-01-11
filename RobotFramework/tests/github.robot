*** Settings ***
Documentation     Test& documentation
Suite Setup       !SuiteSetup
Suite Teardown    !SuiteTeardown
Library           Selenium2Library

*** Variables ***
${URL}  https://github.com/
${Signin Button Locator}  xpath: //*[contains(text(), "Sign in")]

*** Keywords ***
!SuiteSetup
    Open Browser    about:blank   ff
    Sleep  2s
    
!SuiteTeardown
    Close All Browsers


Check Availability
    Click Element  ${Signin Button Locator}
    Sleep  5s

*** Test Cases ***
01_homepage
    [Documentation]    Test d'accès à Github
    Go To    ${URL}
    Wait Until Page Contains    Sign in    timeout=10


02_navigation
    [Documentation]    Test Vérification formulaire authentification
    Sleep  5s
    Check Availability
    Wait Until Page Contains    Username    timeout=10