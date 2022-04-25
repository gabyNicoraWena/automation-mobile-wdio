@regression_green @regression
Feature: BDSD-18889 - Home Seguros Bolso

  Background:
    Given an user who is on "Welcome.registerButton"

  @regression_green @regression
  Scenario: BDSD-20163 - El usuario ingresa a la seccion de Seguros y posee una poliza de Bolso protegido
    Given get login token with user email "hmateikabdsolqe@gmail.com"
    And change wiremock scenario "insuranceGetPolicies" to status "allTypes"
    And an user who is on "Login.homeScreen"
    And enter passcode "192837"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    When user tap on "TabBar.moreButton"
    And user tap on "TabBar.bntInsurance"
    Then an user who is on "InsuranceHome.BPPolicy"
