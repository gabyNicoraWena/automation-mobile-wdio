@regression_green @regression
Feature: BDSD-16839 - ATM Visializacion de ofertas

  Background:
     Given an user who is on "Welcome.registerButton"
     And get login token with user email "pmallo@bdsol.com.ar"
     And change wiremock scenario "insuranceGetPolicies" to status "allTypes"
     And an user who is on "Login.homeScreen"
     And enter passcode "192837"
     And skip biometry if it is activated
     And user close toolTip tapping on Understood
     And user tap on "TabBar.moreButton"
     And user tap on "TabBar.bntInsurance"
     And an user who is on "InsuranceHome.txtTitle"
     And user tap on "InsuranceHome.bntNewInsurance"
     And user see label "InsuranceNewPolicyType.txtSubtitle"
     And user tap on "InsuranceNewPolicyType.btnNewPolicyBP"
     And user tap on "InsuranceFistEntry.btnContinue"

  @regression_green @regression
  Scenario: BDSD-20475 - El se ingresa a la seccion de cotizar Bolso y se comprueba los datos que muestra la app
     When user tap on "InsuranceSelectAddress.btnAddPostalCode"
     And user types "2705" on field "InsuranceAddAddress.boxAddress"
     And user tap on "InsuranceSelectAddress.btnContinue"
     Then an user who is on "InsuranceBPViewOffers.txtTitle"
     Then check user data into bolso view offers screen by zipcode "2705"
     
