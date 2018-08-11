*** Variables ***
${reponame_field}               css=input#repository_name
${repodesc_field}               css=input#repository_description
${public_radio}                 css=input#repository_public_true
${private_radio}                css=input#repository_public_false
${readme_checkbox}              css=input#repository_auto_init
${addgitignore_dropdown}        xpath=//i[contains(text(), "Add .gitignore:")]
${addlicense_dropdown}          xpath=//i[contains(text(), "Add a license:")]
${searchignore_dropdown}        css=input#context-ignore-filter-field
${searchlicense_dropdown}       css=input#context-license-filter-field
${editrepo_button}              css=button.js-edit-repo-meta-toggle
${repopage_field}               css=input#repo_homepage
${save_button}                  xpath=//button[contains(text(),'Save')]
${cancel_button}                xpath=//button[contains(text(),'Cancel')]
${userprofile_link}             css=a.url
${repositories_tab}             css=a[title="Repositories"]
${reposettings_button}          //nav[contains(@class,'reponav js-repo-nav js-sidenav-container-pjax container')]//a[4]
${deleterepo_button}            css=//summary[contains(text(),'Delete this repository')]
${deleteconfirm_field}          css=input.input-block
${deleteconfirm_button}         xpath=//button[contains(text(),'I understand the consequences, delete this reposit')]
${gitignore_opened}             //div[contains(text(),'Actionscript')]
${license_opened}               //div[contains(text(),'Apache License 2.0')]
${avatar_image}                 css=img.avatar.float-left
${repository_dropdown}          xpath=//a[contains(text(),'Your repositories')]
${createrepo_button}            xpath=//button[contains(text(),'Create repository')]
${closemodal_button}            xpath=//details-dialog[@class='Box Box--overlay d-flex flex-column anim-fade-in fast']//button[@type='button']