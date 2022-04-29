
[![Build Status](https://dev.azure.com/bdsdigital/QE/_apis/build/status/gss-bds.automation-mobile?branchName=develop)](https://dev.azure.com/bdsdigital/QE/_build/latest?definitionId=181&branchName=develop)

# Automation - Mobile With Appium + Wdio

A framework for run mobile test using wdio + appium, able to run in iOS and Android devices.

### Prerequisites

Dependencies needed:
 - Xcode. Install from app stor.
 - HomeBrew. Run on terminal /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/
Homebrew/install/master/install)"
 - Node (v16 or newer). brew install node
 - Android Studio.
 - app proyect (duh!).

## Getting Started

First you need to download all the dependencies:
```
 - yarn
```
**IMPORTANT:** For Login/Sessions related steps, you'll need to add Keycloak's server address to `/etc/hosts` :

> 10.224.1.191 keycloak-int-http.keycloak-int.svc.cluster.local
13.82.16.158 keycloak-uat-http.keycloak-uat.svc.cluster.local
52.170.152.44 keycloak-qa-http.keycloak-qa.svc.cluster.local

Then create an '.env' file in the root, to declare the iOS and Android app paths, as well as other important keys:

```
 - touch .env
 - open .env
```
Edit the file like the '.env.example' file.

Build the bds app!, go to bds-app proyect root, and buid it with 'yarn ios' and 'yarn android'.


#### Folder for features:
 - test/features

#### Folder for stepDefination:
 - test/steps-definitions
 
#### Folder for pageObject:
 - test/page-objects


## Adding a test:
 1 - Create a file with format `<SCENARIO_NAME>.feture` inside `feature` folder, with the next format:
 ```
 Feature: <FEATURE_NAME>

 Scenario: <TEST_NAME>
    When an user who is on "Welcome.registerButton" 
```

On `listSelectors.js`, the parameter used on the Gherkin `Welcome.registerButton` must be included as a property of the exported object with its corresponding `accessibilityLabel` or `xpath` selector:

```
const  listSelectors = {
Welcome: {

...

registerButton:  '~Registrarme',

...

},
```

These selectors can be tested using `Appium inspector`.

`accessibilityLabel` locators must be preceded with `~`. i.e: 

    registerButton: '~Registrarme',

`XPath` locators for elements that don't have an `accessibilityLabel` are allowed. i.e:
 

    homeScreen:  "//*[@text='Sesión activa']"

 2 - Use the next gherkin steps for fast implement of each action:

  ##Steps to login withouth VPN dependencies.
   #Background:
    Given an user who is on "Welcome.registerButton"
    And get login token with user email "USER@maildomain.com"
    And an user who is on "Login.homeScreen"
    And enter passcode "11111"
    
    Click on screen clickeable element:
    user tap on "*****label****"
    
    Find text by partial XPATH expresion:
    user see text "text to find on screen"
    
    Set amount masked fields: 
    user set "amount" on field "****LABEL******"
    
    Overwrite default waitElementTimeout waiting an element 
    "******label******" is displayed after xx seconds
    
      Overwrite default waitElementTimeout waiting to CLICK an element 
    User press on "****label****" after wait xx seconds
    
 "User selects on ***label***"
 "User selects on ***label***"
 “Systems shows ***label***"
 “User complete field ***label***" with value ***value***"”
 "System doesn’t show ***label***" "
 “User press on xpath ***xpath***" ”
 “System shows xpath ***xpath***" ”

## Running the tests

Running test only in android locally:
```
 - yarn test:android "path.feature" "@cucumbertags"
 
Running test only in android on BROWSERSTACK:

 - yarn test:bsandroid  "**/path.feature" "@cucumbertags" "BS build name" "BS proyecto name"
```

Running test only in iOS:
```
 - yarn test:ios "path.feature" "@cucumbertags"
``` 
 Running test only in android on BROWSERSTACK:
```
 - yarn test:bsios  "**/path.feature" "@cucumbertags" "BS build name" "BS proyecto name"
```
Running test in both platforms:
```
 - yarn test
```
 
 Running passing features and tags:
 
 yarn test:android "pathtofeatures" - run features passed in pathtofeatures
 yarn test:android "pathtofeatures" "" - run features passed in pathtofeatures
 yarn test:android "pathtofeatures" "@cucumberTAG" - Execute only the scenarios that have the @cucumberTAG tag from the requested feature (s).



