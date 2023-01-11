*** Settings ***
Documentation     Test& documentation
Suite Setup       !SuiteSetup
Suite Teardown    !SuiteTeardown
Library           Selenium2Library

*** Variables ***
${URL}  https://orange.sn/
${OM Button Locator}  //*[@id="osn_header"]/div[1]/nav/div[1]/div[2]/a[1]
${Menu}  //*[@id="osn_header"]/div[1]/div[2]/div/a[3]

*** Keywords ***
!SuiteSetup
    Open Browser    about:blank   ff
    #Open Browser    about:blank    chrome   remote_url=http://ras-grid.orange-sonatel.com/wd/hub
    #Set Window Size  1200  1000  True
    Sleep  2s
    
!SuiteTeardown
    Close All Browsers
    #Log    internal scenario tag:EDL/web


Check Availability
    Click Element  ${OM Button Locator}
    Sleep  5s

*** Test Cases ***
01_homepage
    [Documentation]    Test d'accès au portail orange.sn
    Go To    ${URL}
    Wait Until Page Contains    Orange    timeout=10


02_navigation
    [Documentation]    Test verification disponibilité menu OrangeMoney
    Check Availability
    Wait Until Page Contains    Transfert    timeout=10

03_additional_step
    [Documentation]    Etape additionnel
    Capture Page Screenshot  smctest.png