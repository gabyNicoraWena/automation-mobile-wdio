@regression_green @regression
Feature: Detalle de consulta de cobertura Bolso [Solicitud]

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
     When user tap on "InsuranceViewOffers.bntFirstPlanSeeCoverage"

  @regression_green @regression 
  Scenario: BDSD-20540 - Se muestra correctamente el detalle de la cobertura de Bolso
     Then user see contains text "150" on element "InsuranceBolsoPlanDetails.txtCoverageValue"
     And user see label "InsuranceBolsoPlanDetails.txtCoverage1"
     And user see contains text "10.000" on element "InsuranceBolsoPlanDetails.txtCoverageValue1"
     When user tap on "InsuranceBolsoPlanDetails.txtCoverage1"
     Then user see label "InsuranceBolsoPlanDetails.txtCoverageText1"
     When user tap on "InsuranceBolsoPlanDetails.txtSubCoverageBlock"
     And user swipe up
     Then user see label "InsuranceBolsoPlanDetails.txtSubCoverageTitle1"
     And user see label "InsuranceBolsoPlanDetails.txtSubCoverageDescription1"
     And user see contains text "2.500" on element "InsuranceBolsoPlanDetails.txtSubCoverageValue1"
     And user see label "InsuranceBolsoPlanDetails.txtSubCoverageTitle2"
     And user see label "InsuranceBolsoPlanDetails.txtSubCoverageDescription2"
     And user see contains text "5.900" on element "InsuranceBolsoPlanDetails.txtSubCoverageValue2"
     And user see label "InsuranceBolsoPlanDetails.txtSubCoverageTitle3"
     And user see label "InsuranceBolsoPlanDetails.txtSubCoverageDescription3"
     And user see contains text "1.000" on element "InsuranceBolsoPlanDetails.txtSubCoverageValue3"
     And user see label "InsuranceBolsoPlanDetails.txtSubCoverageTitle4"
     And user see label "InsuranceBolsoPlanDetails.txtSubCoverageDescription4"
     And user see contains text "600" on element "InsuranceBolsoPlanDetails.txtSubCoverageValue4"

  @regression_green @regression
  Scenario: BDSD-20541 - El usuario vuelve a la pantalla donde se visualizan los planes de Bolso
     When user tap on "InsuranceBolsoPlanDetails.bntBack"
     Then an user who is on "InsuranceBPViewOffers.txtTitle"