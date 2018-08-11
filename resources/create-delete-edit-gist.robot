*** Settings ***
Documentation  keywords for creating editing delete and view gist
Resource       common.robot
Resource       ../elements/create-gist-elements.robot
Resource       ../elements/common-elements.robot

*** Keywords ***
click create new repo
    click element                   ${newrepo_button}

input repo name
    [Arguments]                     ${reponame}
    input text                      ${reponame_field}   ${reponame}

input repo description
    [Arguments]                     ${repodesc}
    input text                      ${repodesc_field}   ${repodesc}

select public
    click element                   ${public_radio}

select private
    click element                   ${private_radio}

uncheck readme
    click element                   ${readme_checkbox}

set git ignore
    [Arguments]                     ${ignore}
    click element                   ${addgitignore_dropdown}
    wait until element is visible   ${gitignore_opened}
    input text                      ${searchignore_dropdown}    ${ignore}

set license
    [Arguments]                     ${license}
    click element                   ${addlicense_dropdown}
    wait until element is visible   ${license_opened}
    input text                      ${searchlicense_dropdown}  ${license}

click edit repo
    click element                   ${editrepo_button}

input repo homepage
    [Arguments]                     ${repohome}
    input text                      ${repopage_field}   ${repohome}

save edited repo
    click element                   ${save_button}

cancel edited repo
    click element                   ${cancel_button}

open user profile
    click element                   ${userprofile_link}

open repository tab
    wait until element is visible   ${repositories_tab}
    click element                   ${repositories_tab}

click repo settings
    click element                   ${reposettings_button}

click delete repo
    click element                   ${deleterepo_button}

input repo name for confirmation
    [Arguments]                     ${reponame}
    input text                      ${deleteconfirm_field}  ${reponame}

click confirm delete repo
    click element                   ${deleteconfirm_button}

view repositories
    click element                   ${avatar_image}
    click element                   ${repository_dropdown}

verify if repository is deleted
    [Arguments]                     ${reponame}
    page should not contain         ${reponame}

verify if repository is not deleted
    [Arguments]                     ${reponame}
    page should contain             ${reponame}

click create repo button
    click element                   ${createrepo_button}

click repo name in repo list
    [Arguments]                     ${reponame}
    click element                   //a[contains(text(),'${reponame}')]

click close button
    click element                   ${closemodal_button}