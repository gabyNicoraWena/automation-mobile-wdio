@regression_green @regression
Feature: BDSD-19303 Condiciones generales de Bolso protegido

  Background:
    Given an user who is on "Welcome.registerButton"
    And get login token with user email "bdsnoaddress@gmail.com"
    And an user who is on "Login.homeScreen"
    And enter passcode "192837"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    When user tap on "TabBar.moreButton"
    And user tap on "TabBar.bntInsurance"
    Then an user who is on "InsuranceHome.txtTitle"
    When user tap on "InsuranceHome.bntNewInsurance"
    And user see label "InsuranceNewPolicyType.txtSubtitle"
    And user tap on "InsuranceNewPolicyType.btnNewPolicyBP"
    Then an user who is on "InsuranceBPFistEntry.txtPageTitle"

  @regression_green @regression
  Scenario: BDSD-20165 - El usuario inicia el flujo para generar un Seguro de Bolso Protegido
     Then user see label "InsuranceBPFistEntry.txtTitle"
     And user see label "InsuranceBPFistEntry.txtSubtitle"
     And user see label "InsuranceBPFistEntry.txtCoverageTitle"
     And user see label "InsuranceBPFistEntry.txtFirstCoverage"
     And user see label "InsuranceBPFistEntry.txtSecondCoverage"
     And user see label "InsuranceBPFistEntry.txtThirdCoverage"
     And user see label "InsuranceBPFistEntry.txtFourthCoverage"
     And user see label "InsuranceBPFistEntry.btnContinue"

  @regression_green @regression
  Scenario: BDSD-20166 - El usuario ingresa a la seccion de ayuda
     When user tap on "InsuranceBPFistEntry.btnHelp"
     Then user see label "HelpSection.btnConsumerDefense"

  @regression_green @regression
  Scenario: BDSD-20167 - El usuario regresa a la home
     When user tap on "InsuranceBPFistEntry.btnBack"
     Then an user who is on "InsuranceHome.txtTitle"