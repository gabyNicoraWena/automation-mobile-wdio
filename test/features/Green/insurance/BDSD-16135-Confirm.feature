@regression_green @regression
Feature: BDSD-16135 - Confirmación de la solicitud de seguro [Solicitud]

  Background:
    Given an user who is on "Welcome.registerButton"

  @regression_green @regression
  Scenario: BDSD-17446 - El usuario confirma un nuevo seguro ingresando un nuevo CP
     Given get login token with user email "pmallo@bdsol.com.ar"
     And an user who is on "Login.homeScreen"
     And change wiremock scenario "insuranceGetPolicies" to status "allTypes"
     And enter passcode "192837"
     And skip biometry if it is activated
     And user close toolTip tapping on Understood
     When user tap on "TabBar.moreButton"
     And user tap on "TabBar.bntInsurance"
     Then an user who is on "InsuranceHome.txtTitle"
     And user tap on "InsuranceHome.bntNewInsurance"
     When user tap on "InsuranceNewPolicyType.btnNewPolicyHome"
     And user tap on "InsuranceFistEntry.btnContinue"
     Then an user who is on "InsuranceSelectAddress.txtTitle"
     When user tap on "InsuranceSelectAddress.btnAddPostalCode"
     When user types "2705" on field "InsuranceAddAddress.boxAddress"
     And user tap on "InsuranceAddAddress.btnContinue"
     Then an user who is on "InsuranceViewOffers.txtTitle"
     When user tap on "InsuranceViewOffers.bntFirstPlanBuyInsurance"
     Then an user who is on "InsuranceDataAddress.txtTitle"
     When user tap on "InsuranceDataAddress.chkBoxApartment"
     And set "Calle 1" on "InsuranceDataAddress.boxStreet"
     And set "100" on "InsuranceDataAddress.boxNumber"
     And set "1A" on "InsuranceDataAddress.boxDpto"
     And user swipe up
     And select option "1" on city combobox
     And set "11" on "InsuranceDataAddress.boxPhoneCode"
     And set "63658458" on "InsuranceDataAddress.boxPhone"
     And user tap on "InsuranceDataAddress.btnContinue"
     Then an user who is on "InsuranceConfirmPolicy.txtTitle"
     When user tap on "InsuranceConfirmPolicy.chkTermsAndConditions"
     And user tap on "InsuranceConfirmPolicy.btnContinue"
     Then user see label "InsuranceNewPolicySuccess.txtTitle"
     And user see label "InsuranceNewPolicySuccess.bntFinish"

  @regression_green @regression
  Scenario: BDSD-17448 - El usuario hace tap en el boton Finalizar en la pantalla de exito de la nueva poliza
     Given get login token with user email "pmallo@bdsol.com.ar"
     And an user who is on "Login.homeScreen"
     And change wiremock scenario "insuranceGetPolicies" to status "allTypes"
     And enter passcode "192837"
     And skip biometry if it is activated
     And user close toolTip tapping on Understood
     When user tap on "TabBar.moreButton"
     And user tap on "TabBar.bntInsurance"
     Then an user who is on "InsuranceHome.txtTitle"
     And user tap on "InsuranceHome.bntNewInsurance"
     When user tap on "InsuranceNewPolicyType.btnNewPolicyHome"
     And user tap on "InsuranceFistEntry.btnContinue"
     Then an user who is on "InsuranceSelectAddress.txtTitle"
     When user tap on "InsuranceSelectAddress.btnAddPostalCode"
     When user types "2705" on field "InsuranceAddAddress.boxAddress"
     And user tap on "InsuranceAddAddress.btnContinue"
     Then an user who is on "InsuranceViewOffers.txtTitle"
     When user tap on "InsuranceViewOffers.bntFirstPlanBuyInsurance"
     Then an user who is on "InsuranceDataAddress.txtTitle"
     When user tap on "InsuranceDataAddress.chkBoxApartment"
     And set "Calle 1" on "InsuranceDataAddress.boxStreet"
     And set "100" on "InsuranceDataAddress.boxNumber"
     And set "1A" on "InsuranceDataAddress.boxDpto"
     And user swipe up
     And select option "1" on city combobox
     And set "11" on "InsuranceDataAddress.boxPhoneCode"
     And set "63658458" on "InsuranceDataAddress.boxPhone"
     And user tap on "InsuranceDataAddress.btnContinue"
     Then an user who is on "InsuranceConfirmPolicy.txtTitle"
     When user tap on "InsuranceConfirmPolicy.chkTermsAndConditions"
     And user tap on "InsuranceConfirmPolicy.btnContinue"
     Then user see label "InsuranceNewPolicySuccess.txtTitle"
     When user tap on "InsuranceNewPolicySuccess.bntFinish"
     Then an user who is on "InsuranceHome.txtTitle"
     
  @regression_green @regression
  Scenario: BDSD-17447 - El usuario confirma un nuevo seguro ingresando una direccion pre-cargada
     Given get login token with user email "pmallo@bdsol.com.ar"
     And change wiremock scenario "insuranceGetPolicies" to status "allTypes"
     And an user who is on "Login.homeScreen"
     And enter passcode "192837"
     And skip biometry if it is activated
     And user close toolTip tapping on Understood
     When user tap on "TabBar.moreButton"
     And user tap on "TabBar.bntInsurance"
     Then an user who is on "InsuranceHome.txtTitle"
     And user tap on "InsuranceHome.bntNewInsurance"
     When user tap on "InsuranceNewPolicyType.btnNewPolicyHome"
     And user tap on "InsuranceFistEntry.btnContinue"
     Then an user who is on "InsuranceSelectAddress.txtTitle"
     When user tap on "InsuranceSelectAddress.firstAddress"
     And user tap on "InsuranceSelectAddress.btnContinue"
     Then an user who is on "InsuranceViewOffers.txtTitle"
     When user tap on "InsuranceViewOffers.bntFirstPlanBuyInsurance"
     Then an user who is on "InsuranceDataAddress.txtTitle"
     Then user scrolls up 70 percent until see "InsuranceDataAddress.boxPhone"
     And select option "1" on city combobox
     And set "11" on "InsuranceDataAddress.boxPhoneCode"
     And set "63658458" on "InsuranceDataAddress.boxPhone"
     And user tap on "InsuranceDataAddress.btnContinue"
     Then an user who is on "InsuranceConfirmPolicy.txtTitle"
     When user tap on "InsuranceConfirmPolicy.chkTermsAndConditions"
     And user tap on "InsuranceConfirmPolicy.btnContinue"
     Then user see label "InsuranceNewPolicySuccess.txtTitle"
     And user see label "InsuranceNewPolicySuccess.bntFinish"
