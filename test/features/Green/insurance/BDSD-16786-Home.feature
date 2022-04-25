@regression_green @regression
Feature: BDSD-16786 - Home Seguros

  Background:
    Given an user who is on "Welcome.registerButton"

  @regression_green @regression
  Scenario: BDSD-19245 - El usuario ingresa a la seccion de Seguros de ATM y no posee polizas
    Given get login token with user email "bdsnoaddress@gmail.com"
    And an user who is on "Login.homeScreen"
    And enter passcode "192837"
    And change wiremock scenario "insuranceGetPolicies" to status "policyListEmpty"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    When user tap on "TabBar.moreButton"
    And user tap on "TabBar.bntInsurance"
    Then user see label "InsuranceNewPolicyType.btnBack"
    And user see label "InsuranceNewPolicyType.txtTitle"
    And user see label "InsuranceNewPolicyType.txtSubtitle"
    And user see label "InsuranceNewPolicyType.btnHelp"
    And user see label "InsuranceNewPolicyType.btnNewPolicyHome"
    And user see label "InsuranceNewPolicyType.btnNewPolicyAtm"
    And user see label "InsuranceNewPolicyType.btnNewPolicyBP"

  @regression_green @regression
  Scenario: BDSD-19246 - El usuario ingresa a la seccion de Seguros de ATM y posee polizas
    Given get login token with user email "hmateikabdsolqe@gmail.com"
    And change wiremock scenario "insuranceGetPolicies" to status "allTypes"
    And an user who is on "Login.homeScreen"
    And enter passcode "192837"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    When user tap on "TabBar.moreButton"
    And user tap on "TabBar.bntInsurance"
    Then user see label "InsuranceHome.bntNewInsurance"

@regression_green @regression
Scenario: BDSD-19247 - El usuario retorna a al menu del boton Más
    Given get login token with user email "bdsnoaddress@gmail.com"
    And an user who is on "Login.homeScreen"
    And enter passcode "192837"
    And change wiremock scenario "insuranceGetPolicies" to status "policyListEmpty"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    When user tap on "TabBar.moreButton"
    And user tap on "TabBar.bntInsurance"
    Then user see label "InsuranceNewPolicyType.btnBack"
    And user see label "InsuranceNewPolicyType.txtTitle"
    And user see label "InsuranceNewPolicyType.txtSubtitle"
    When user tap on "InsuranceNewPolicyType.btnBack"
    Then user see label "TabBar.bntInsurance"

@regression_green @regression
Scenario: BDSD-19248 - El usuario ingresa a la seccion seguros
    Given get login token with user email "bdsnoaddress@gmail.com"
    And an user who is on "Login.homeScreen"
    And enter passcode "192837"
    And change wiremock scenario "insuranceGetPolicies" to status "policyListEmpty"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    When user tap on "TabBar.moreButton"
    And user tap on "TabBar.bntInsurance"
    Then user see label "InsuranceNewPolicyType.btnBack"
    And user see label "InsuranceNewPolicyType.txtTitle"
    And user see label "InsuranceNewPolicyType.txtSubtitle"
    And user tap on "InsuranceNewPolicyType.btnHelp"
    And user see label "HelpSection.textFrecuentlyAsq"