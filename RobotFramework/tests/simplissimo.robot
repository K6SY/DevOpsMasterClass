*** Settings ***
Documentation     Test& documentation
Suite Setup       !SuiteSetup
Suite Teardown    !SuiteTeardown
Library           Selenium2Library

*** Variables ***
${URL}    https://simplissimo-osn.orange-sonatel.com

${username field}  //*[@id="ctl00_ContentPlaceHolder1_Login1_UserName"]
${password field}  //*[@id="ctl00_ContentPlaceHolder1_Login1_Password"]
${login button}  //*[@id="ctl00_ContentPlaceHolder1_Login1_LoginButton"]


${phone field}  //*[@id="ctl00_ContentPlaceHolder1_msisdnTextBox"]
${search button}  //*[@id="ctl00_ContentPlaceHolder1_rechercherButton"]


${username}   ROB_INT
${password}   $SUPPIT@2013
${phone number}   775543132

*** Keywords ***
!SuiteSetup
    Open Browser    ${URL}    chrome    remote_url=http://ras-grid.orange-sonatel.com/wd/hub    options=add_argument("--disable-popup-blocking");add_argument("--ignore-certificate-errors");add_argument('--allow-running-insecure-content')
    Sleep  2s
    
!SuiteTeardown
    Close All Browsers

Authentication
    Input Text    ${username field}  ${username}
    Sleep  2s
    Input Text    ${password field}  ${password}
    Sleep  2s
    Click Element   ${login button}
    Sleep  5s

SearchClient
    Input Text    ${phone field}  ${phone number}
    Sleep  2s
    Click Element   ${search button}
    Sleep  5s


*** Test Cases ***
01_homepage
    [Documentation]    Test d'accès au portail simplissimo
    Go To    ${URL}
    Wait Until Page Contains    Nom d'utilisateur    timeout=10


02_authentication
    [Documentation]    Test Authentification sur Simplissimo
    Authentication
    Wait Until Page Contains    Numéro de Téléphone    timeout=10

03_search_client
    [Documentation]    Test pour la vérification d'un  client
    SearchClient
    Wait Until Page Contains    DIEME    timeout=10