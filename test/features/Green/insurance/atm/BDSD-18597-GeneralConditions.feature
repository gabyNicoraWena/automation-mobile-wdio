@regression_green @regression
Feature: BDSD-18597 Condiciones generales de ATM

  Background:
    Given an user who is on "Welcome.registerButton"

  @regression_green @regression
  Scenario: BDSD-19335 - El usuario ingresa a la seccion de Seguros ATM
     Given get login token with user email "bdsnoaddress@gmail.com"
     And change wiremock scenario "insuranceGetPolicies" to status "allTypes"
     And an user who is on "Login.homeScreen"
     And enter passcode "192837"
     And skip biometry if it is activated
     And user close toolTip tapping on Understood
     When user tap on "TabBar.moreButton"
     And user tap on "TabBar.bntInsurance"
     Then an user who is on "InsuranceHome.txtTitle"
     When user tap on "InsuranceHome.bntNewInsurance"
     And user see label "InsuranceNewPolicyType.txtSubtitle"
     And user tap on "InsuranceNewPolicyType.btnNewPolicyAtm"
     Then an user who is on "InsuranceATMFistEntry.txtPageTitle"
     And user see label "InsuranceATMFistEntry.txtTitle"
     And user see label "InsuranceATMFistEntry.txtSubtitle"
     And user see label "InsuranceATMFistEntry.txtCoverageTitle"
     And user see label "InsuranceATMFistEntry.txtFirstCoverage"
     And user see label "InsuranceATMFistEntry.txtSecondCoverage"
     And user see label "InsuranceATMFistEntry.txtThirdCoverage"
     And user see label "InsuranceATMFistEntry.btnContinue"