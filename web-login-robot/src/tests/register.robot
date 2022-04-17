*** Settings ***
Resource  resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Browser
Test Setup  Go To Register Page

*** Test Cases ***
Register With Valid Username And Password
	Set Username  hemmo
	Set Password  kummo213421
	Set Password Confirmation  kummo213421
	Submit Registration Form
	Registration Should Succeed

Register With Too Short Username And Valid Password
	Set Username  da
	Set Password  kaegae3464a
	Set Password Confirmation  kaegae3464a
	Submit Registration Form
	Registration Should Fail With Message  Username too short

Register with Valid Username And Too Short Password
	Set Username  Lurpo
	Set Password  agewwew
	Set Password Confirmation  agewwew
	Submit Registration Form
	Registration Should Fail With Message  Password too short

Register With Nonmatching Password And Password Confirmation
	Set Username  Lurpo
	Set Password  agewwqwywyoju4294uj
	Set Password Confirmation  aaegonao24ty24y63
	Submit Registration Form
	Registration Should Fail With Message  Password doesn't match with confirmation

Login After Succesful Registration
	Set Username  ollipekka
	Set Password  pekka222olli111
	Set Password Confirmation  pekka222olli111
	Submit Registration Form
	Go To Login Page
	Set Username  ollipekka
	Set Password  pekka222olli111
	Submit Credentials
	Login Should Succeed

Login After Failed Registration
	Set Username  ol
	Set Password  pek
	Set Password Confirmation  pedhdj
	Submit Registration Form
	Go To Login Page
	Set Username  ol
	Set Password  pek
	Submit Credentials
	Login Should Fail With Message  Invalid username or password

*** Keywords ***
Submit Registration Form
	Click Button  Register

Registration Should Succeed
	Welcome Page Should Be Open

Registration Should Fail With Message
	[Arguments]  ${message}
	Register Page Should Be Open
	Page Should Contain  ${message}

Set Username
	[Arguments]  ${username}
	Input Text  username  ${username}

Set Password
    [Arguments]  ${password}
    Input Password  password  ${password}

Submit Credentials
	Click Button  Login

Set Password Confirmation
	[Arguments]  ${password_confirmation}
	Input Text  password_confirmation  ${password_confirmation}

Login Should Succeed
	Main Page Should Be Open

Login Should Fail With Message
    [Arguments]  ${message}
    Login Page Should Be Open
    Page Should Contain  ${message}
