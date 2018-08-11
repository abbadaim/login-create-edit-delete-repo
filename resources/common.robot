*** Settings ***
Documentation   Common function for accessing git
Library         SeleniumLibrary  timeout=10
Resource        ../data/input-data.robot
Resource        ../elements/common-elements.robot

*** Keywords ***
open dev
    open browser                   ${url.${environment}}  ${browser}
    Set Selenium Speed             ${setSeleniumSpeed}
    set window size                2560  1440
    maximize browser window

login with valid credential
    [Arguments]                    ${REGISTERED_USER}
    click sign in button
    set email address              ${REGISTERED_USER.Email}
    set password                   ${REGISTERED_USER.Password}
    click submit
    verify login success

login with invalid credential
    [Arguments]                    ${UNREGISTERED_USER}
    click sign in button
    set email address              ${UNREGISTERED_USER.Email}
    set password                   ${UNREGISTERED_USER.Password}
    click submit
    verify login failed

open login page
    click element                  ${hamburger_button}
    wait for animation
    click element                  ${sidebarlogin_button}

set email address
    [Arguments]                    ${email}
    input credential email         ${email}

set password
    [Arguments]                    ${password}
    input credential password      ${password}

click submit
    click element                  ${submit_button}

verify if submit button disabled
    page should contain element     ${disabled_submit}

verify login success
    wait until page contains element  ${newrepo_button}

verify login failed
    wait until page contains element  ${error_container}

wait for animation
    sleep                          0.5s

input credential email
    [Arguments]  ${credentialemail}
    run keyword unless  '${credentialemail}' == '#BLANK'  Input Text  ${username_field}  ${credentialemail}

input credential password
    [Arguments]  ${credentialpassword}
    run keyword unless  '${credentialpassword}' == '#BLANK'  Input Text  ${password_field}  ${credentialpassword}

end web test
    close browser

click sign in button
    click element               ${sidebarlogin_button}