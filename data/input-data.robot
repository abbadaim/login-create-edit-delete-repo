*** Variables ***
#config
${browser}               headlesschrome
${environment}           dev
${setSeleniumSpeed}      0.3
&{url}                   dev=https://github.com/

#data
&{REGISTERED_USER}       Email=registeredemail    Password=password
&{UNREGISTERED_USER}     Email=falsegit    Password=shop2018
&{BLANK}     Email=#BLANK    Password=#BLANK

