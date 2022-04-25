@regression_green @regression
Feature: BDSD-15639 - Home Seguros

  Background:
    Given an user who is on "Welcome.registerButton"

  @regression_green @regression
  Scenario: BDSD-17426 - El usuario ingresa a la seccion de Seguros y no posee polizas
    Given get login token with user email "bdsnoaddress@gmail.com"
    And change wiremock scenario "insuranceGetPolicies" to status "policyListEmpty"
    And an user who is on "Login.homeScreen"
    And enter passcode "192837"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    When user tap on "TabBar.moreButton"
    And user tap on "TabBar.bntInsurance"
    Then an user who is on "InsuranceHome.txtTitle"
    And user see label "InsuranceNewPolicyType.btnNewPolicyHome"

  @regression_green @regression
  Scenario: BDSD-17427 - El usuario ingresa a la seccion de Seguros e intenta crear una nueva poliza
    Given get login token with user email "hmateikabdsolqe@gmail.com"
    And change wiremock scenario "insuranceGetPolicies" to status "4Policies"
    And an user who is on "Login.homeScreen"
    And enter passcode "192837"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    When user tap on "TabBar.moreButton"
    And user tap on "TabBar.bntInsurance"
    Then an user who is on "InsuranceHome.txtTitle"
    And user tap on "InsuranceHome.bntNewInsurance"
    When user tap on "InsuranceNewPolicyType.btnNewPolicyHome"
    Then an user who is on "InsuranceFistEntry.txtTitle"
  
  @regression_green @regression
  Scenario: BDSD-17428 - El usuario ingresa a la seccion de Seguros y vuelve a la Home de la app
    Given get login token with user email "hmateikabdsolqe@gmail.com"
    And change wiremock scenario "insuranceGetPolicies" to status "4Policies"
    And an user who is on "Login.homeScreen"
    And enter passcode "192837"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    When user tap on "TabBar.moreButton"
    And user tap on "TabBar.bntInsurance"
    Then an user who is on "InsuranceHome.txtTitle"
    When user tap on "InsuranceHome.bntBack"
    Then an user who is on "TabBar.bntInsurance"
    
  @regression_green @regression
  Scenario: BDSD-17428 - El usuario visualiza el estado de la póliza (Activa-Inactiva) en la lista
    Given get login token with user email "hmateikabdsolqe@gmail.com"
    And change wiremock scenario "insuranceGetPolicies" to status "4Policies"
    And an user who is on "Login.homeScreen"
    And enter passcode "192837"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    When user tap on "TabBar.moreButton"
    And user tap on "TabBar.bntInsurance"
    Then an user who is on "InsuranceHome.txtTitle"
    And user see the status into all policies
