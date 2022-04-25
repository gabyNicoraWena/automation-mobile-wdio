@regression_green @regression
Feature: BDSD-16133 - Resumen de la solicitud de seguro [Solicitud]

  Background:
    Given an user who is on "Welcome.registerButton"
    And change wiremock scenario "insuranceGetPolicies" to status "allTypes"

  @regression_green @regression
  Scenario: BDSD- 17347 - Se visualiza correctamente la pantalla y sus datos
     Given get login token with user email "pmallo@bdsol.com.ar"
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
     And set "14745247" on "InsuranceDataAddress.boxPhone"
     And user tap on "InsuranceDataAddress.btnContinue"
     Then an user who is on "InsuranceConfirmPolicy.txtTitle"
     And check exist plan name and value for planId 1 zipcode "2705" on "InsuranceConfirmPolicy.txtPolicyTitlePlan" "InsuranceConfirmPolicy.txtPolicyTitleValue"
     And check exist plan name and value for planId 1 zipcode "2705" on "InsuranceConfirmPolicy.txtPolicyPlan" "InsuranceConfirmPolicy.txtPolicyValue"
     And user see contains text "Calle 1" on element "InsuranceConfirmPolicy.txtAddress"
     And user see contains text "100" on element "InsuranceConfirmPolicy.txtAddress"
     And user see contains text "1A" on element "InsuranceConfirmPolicy.txtAddress"
     And user see contains text "Departamento" on element "InsuranceConfirmPolicy.txtAddress"
     And user see contains text "CP 2705" on element "InsuranceConfirmPolicy.txtAddress"
     And user see contains text "Buenos Aires" on element "InsuranceConfirmPolicy.txtAddress"
     Then user scrolls up 35 percent until see "InsuranceConfirmPolicy.txtModality"
     Then user see contains text "Débito automático mensual" on element "InsuranceConfirmPolicy.txtModality"
     And user see contains text "Las cuotas se debitan de tu caja de ahorro Nº 1000000149 de Banco del Sol" on element "InsuranceConfirmPolicy.txtMethodPayment"
     Then user scrolls up 35 percent until see "InsuranceConfirmPolicy.txtSSNURL"
     Then user see contains text "pmallo@bdsol.com.ar" on element "InsuranceConfirmPolicy.txtEMail"
     And user see label "InsuranceConfirmPolicy.txtSSNText"
     And user see label "InsuranceConfirmPolicy.txtSSNPhone"
     And user see label "InsuranceConfirmPolicy.txtSSNURL"
     And user see label "InsuranceConfirmPolicy.chkTermsAndConditions"
     And user see label "InsuranceConfirmPolicy.btnContinue"

  @regression_green @regression
  Scenario: BDSD- 17348 - El usuario intenta confirmar la poliza pero no acepto los terminos y condiciones
     Given get login token with user email "hmateikabdsolqe@gmail.com"
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
     And set "14745247" on "InsuranceDataAddress.boxPhone"
     And user tap on "InsuranceDataAddress.btnContinue"
     Then an user who is on "InsuranceConfirmPolicy.txtTitle"
     When user tap on "InsuranceConfirmPolicy.btnContinue"
     Then an user who is on "InsuranceConfirmPolicy.txtTitle"

  @regression_green @regression
  Scenario: BDSD- 17349 - El usuario navega al detalle de la poliza desde "Ver detalle de la poliza"
     Given get login token with user email "hmateikabdsolqe@gmail.com"
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
     And set "14745247" on "InsuranceDataAddress.boxPhone"
     And user tap on "InsuranceDataAddress.btnContinue"
     Then an user who is on "InsuranceConfirmPolicy.txtTitle"
     When user tap on "InsuranceConfirmPolicy.bntPlanSeeCoverage"
     Then user see text "Plan 1500"

  @regression_green @regression
  Scenario: BDSD- 17350 - El usuario navega al detalle de la poliza desde "Ver detalle de la poliza"
     Given get login token with user email "hmateikabdsolqe@gmail.com"
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
     And set "14745247" on "InsuranceDataAddress.boxPhone"
     And user tap on "InsuranceDataAddress.btnContinue"
     Then an user who is on "InsuranceConfirmPolicy.txtTitle"
     When user tap on "InsuranceConfirmPolicy.bntBack"
     Then an user who is on "InsuranceDataAddress.txtTitle"
