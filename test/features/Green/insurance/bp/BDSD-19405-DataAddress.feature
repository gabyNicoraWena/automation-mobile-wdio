@regression_green @regression
Feature: BDSD-19405 - Bolso Datos para la poliza

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
     When user tap on "InsuranceSelectAddress.btnAddPostalCode"
     And user types "2705" on field "InsuranceAddAddress.boxAddress"
     And user tap on "InsuranceSelectAddress.btnContinue"
     Then an user who is on "InsuranceBPViewOffers.txtTitle"
     And user see label "InsuranceViewOffers.bntFirstPlanSeeCoverage"
     And user tap on "InsuranceViewOffers.bntFirstPlanBuyInsurance"
     Then an user who is on "InsuranceDataAddress.txtTitle"

  @regression_green @regression
  Scenario: BDSD-20514 - El usuario ingresa a la pantalla de "Datos de poliza" y visualiza sus elementos correctamente
     Then user see label "InsuranceDataAddress.boxStreet"
     And user see label "InsuranceDataAddress.boxNumber"
     And user see label "InsuranceDataAddress.chkBoxHouse"
     And user see label "InsuranceDataAddress.chkBoxApartment"
     When user tap on "InsuranceDataAddress.chkBoxApartment"
     Then an user who is on "InsuranceDataAddress.boxDpto"
     And user see label "InsuranceDataAddress.boxReference"
     When user swipe up
     And user see label "InsuranceDataAddress.boxPostalCode"
     Then user see label "InsuranceDataAddress.boxCountry"
     And user see label "InsuranceDataAddress.comboCity"
     And user see label "InsuranceDataAddress.boxPhone"
     And user see label "InsuranceDataAddress.boxPhoneCode"

  @regression_green @regression
  Scenario: BDSD-20515 - El usuario ingresa retorna desde "Datos de poliza" (Bolso) a la pantalla del cotizador
     When user tap on "InsuranceDataAddress.btnBack"
     Then an user who is on "InsuranceBPViewOffers.txtTitle"