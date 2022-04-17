*** Settings ***
Resource  resource.robot

*** Test Cases ***
Register With Valid Username And Password
	Input New Command
	Input Credentials  hushhash  donkey2afwa
	Output Should Contain  New user registered

Register With Already Taken Username And Valid password
	Create User  klipper  klappe2rafa
	Input New Command
	Input Credentials  klipper  huuhu3afaa
	Output Should Contain  User with username klipper already exists

Register With Too Short Username And Valid Password
	Input New Command
	Input Credentials  fh  doae2agelj
	Output Should Contain  Username too short

Register With Valid Username And Too Short Password
	Input New Command
	Input Credentials  Gluup  3d
	Output Should Contain  Password too short

Register With Valid Username And Long Enough Password Containing Only Letters
	Input New Command
	Input Credentials  unage  doskaegageaaaa
	Output Should Contain  Password should not only contain alphabets
