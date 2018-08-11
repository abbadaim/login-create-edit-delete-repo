*** Settings ***
Documentation  create private office booking
Resource       ../resources/common.robot
Resource       ../resources/create-delete-edit-gist.robot
Default Tags   dev
Test Setup     common.open dev
Test Teardown  common.end web test

*** Test Cases ***
Login successfully with valid credential
    login with valid credential             ${REGISTERED_USER}

login failed with invalid credential
    login with invalid credential           ${UNREGISTERED_USER}

login with blank credential should fail
    login with invalid credential           ${BLANK}

create public repo without readme
    login with valid credential             ${REGISTERED_USER}
    click create new repo
    input repo name                         test
    input repo description                  testing
    select public
    uncheck readme
    click create repo button

create public repo with readme and license
    login with valid credential             ${REGISTERED_USER}
    click create new repo
    input repo name                         test
    input repo description                  testing
    select public
    set git ignore                          Python
    set license                             GNU General Public License v3.0
    click create repo button

create public repo without name should not be able to submit
    login with valid credential             ${REGISTERED_USER}
    click create new repo
    input repo name                         #BLANK
    input repo description                  testing
    select public
    set git ignore                          Python
    set license                             GNU General Public License v3.0
    verify if submit button disabled

edit repo homepage
    login with valid credential             ${REGISTERED_USER}
    view repositories
    click repo name in repo list            test
    click edit repo
    input repo homepage                     www.test.com
    save edited repo

edit repo name then cancel should not be saved
    login with valid credential             ${REGISTERED_USER}
    view repositories
    click repo name in repo list            test
    click edit repo
    cancel edited repo

delete repo without confirmation
    login with valid credential             ${REGISTERED_USER}
    view repositories
    click repo name in repo list            test
    click repo settings
    click delete repo
    click close button
    verify if repository is not deleted

delete repo with wrong repo name should fail
    login with valid credential             ${REGISTERED_USER}
    view repositories
    click repo name in repo list            test
    click repo settings
    click delete repo
    input repo name for confirmation        123
    verify if submit button disabled

delete repo with confirmation
    login with valid credential             ${REGISTERED_USER}
    view repositories
    click repo name in repo list            test
    click repo settings
    click delete repo
    input repo name for confirmation        test
    click confirm delete repo
    verify if repository is deleted




