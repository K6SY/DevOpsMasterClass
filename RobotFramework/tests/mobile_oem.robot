*** Settings ***
Documentation  Test application OEM - Paiement facture
Library  AppiumLibrary

*** Variables ***
${ANDROID_AUTOMATION_NAME}    UiAutomator2
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_PLATFORM_VERSION}   11
${DEVICE_NAME}    R58R50ZV4EK
${ACTIVITY_NAME}    com.orange.myorange.osn.MainActivity
${PACKAGE_NAME}     com.orange.myorange.osn

${WELCOME}   /hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.TextView[2]
#${SEARCH_LOCATION}   //android.widget.TextView[@content-desc="Rechercher"]
#${SEARCH_FIELD_ID}   com.whatsapp:id/search_input
#${BOT_LOCATION}     com.whatsapp:id/conversations_row_contact_name
#${MESSAGE_FIELD}    com.whatsapp:id/entry
#${SEND_MESSAGE_LOCATION}   com.whatsapp:id/send
#${MESSAGE}   Bonjour



*** Keywords ***
Open Test Application
  Open Application  http://0.0.0.0:4723/wd/hub 
  ...  automationName=${ANDROID_AUTOMATION_NAME}
  ...  platformName=${ANDROID_PLATFORM_NAME}
  ...  platformVersion=${ANDROID_PLATFORM_VERSION}
  ...  newCommandTimeout=2500
  ...  deviceName=${DEVICE_NAME}
  ...  appPackage=${PACKAGE_NAME}
  ...  appActivity=${ACTIVITY_NAME}
  ...  noReset=true
  ...  fullReset=false
  Sleep  1s



*** Test Cases ***
01_Open_OEM_Application
  Open Test Application