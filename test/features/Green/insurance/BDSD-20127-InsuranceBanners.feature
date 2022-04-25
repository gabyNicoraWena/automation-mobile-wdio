@regression_green @regression
Feature: BDSD-16786 - Home Seguros

  Background:
    Given an user who is on "Welcome.registerButton"
    Given get login token with user email "bdsnoaddress@gmail.com"
    And an user who is on "Login.homeScreen"
    And enter passcode "192837"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    When user swipe rigth
    
  @regression_green @regression @este
  Scenario: BDSD-20773 - El usuario visualiza correctamente el banner de Seguros
    Then user see label "HomeScreen.InsuranceBanner"

@regression_green @regression
Scenario: BDSD-20774 - El usuario tapea el banner de Seguros pero no tiene polizas contratadas
    When change wiremock scenario "insuranceGetPolicies" to status "policyListEmpty"
    And user tap on "HomeScreen.InsuranceBanner"
    Then an user who is on "InsuranceNewPolicyType.txtTitle"
    And user see label "InsuranceNewPolicyType.txtSubtitle"

@regression_green @regression
Scenario: BDSD-20775 - El usuario tapea el banner de Seguros con polizas contratadas anteriormente
    When change wiremock scenario "insuranceGetPolicies" to status "allTypes"
    And user tap on "HomeScreen.InsuranceBanner"
    Then an user who is on "InsuranceHome.txtTitle"
    And user see label "InsuranceNewPolicyType.btnNewPolicyHome"

@regression_green @regression
Scenario: BDSD-20776 - El usuario tapea el banner de Seguros pero no tiene polizas contratadas y vuelve hacia atras
    When change wiremock scenario "insuranceGetPolicies" to status "policyListEmpty"
    And user tap on "HomeScreen.InsuranceBanner"
    Then an user who is on "InsuranceNewPolicyType.txtTitle"
    When user tap on "InsuranceNewPolicyType.btnBack"
    Then user see label "TabBar.bntInsurance"

@regression_green @regression
Scenario: BDSD-20777 - El usuario tapea el banner de Seguros con polizas contratadas anteriormente y vuelve hacia atras
    When change wiremock scenario "insuranceGetPolicies" to status "allTypes"
    And user tap on "HomeScreen.InsuranceBanner"
    Then an user who is on "InsuranceHome.txtTitle"
    And user see label "InsuranceNewPolicyType.btnNewPolicyHome"
    When user tap on "InsuranceNewPolicyType.btnBack"
    Then user see label "TabBar.bntInsurance"