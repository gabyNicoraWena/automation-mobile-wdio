@regression_green @regression
Feature: Detalle de consulta de cobertura ATM [Solicitud]

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
     And user tap on "InsuranceNewPolicyType.btnNewPolicyAtm"
     And user tap on "InsuranceFistEntry.btnContinue"

  @regression_green @regression 
  Scenario: BDSD-19885 - Se muestra correctamente el detalle de la cobertura de ATM
     When user tap on "InsuranceSelectAddress.btnAddPostalCode"
     And user types "2705" on field "InsuranceAddAddress.boxAddress"
     And user tap on "InsuranceSelectAddress.btnContinue"
     Then an user who is on "InsuranceATMViewOffers.txtTitle"
     When user tap on "InsuranceATMViewOffers.btnViewCoverage"
     Then an user who is on "InsuranceATMPlanDetails.txtTitle"
     And user see contains text "32" on element "InsuranceATMPlanDetails.txtCoverageValue"
     And user see label "InsuranceATMPlanDetails.txtCoverage1"
     And user see label "InsuranceATMPlanDetails.txtCoverage2"
     And user see label "InsuranceATMPlanDetails.txtCoverage3"
     And user see label "InsuranceATMPlanDetails.txtCoverage4"
     And user see contains text "10.000" on element "InsuranceATMPlanDetails.txtCoverageValue1"
     And user see contains text "1.250" on element "InsuranceATMPlanDetails.txtCoverageValue2"
     And user see contains text "20.000" on element "InsuranceATMPlanDetails.txtCoverageValue3"
     And user see contains text "150" on element "InsuranceATMPlanDetails.txtCoverageValue4"
     And user tap on "InsuranceATMPlanDetails.txtCoverage4"
     And user see label "InsuranceATMPlanDetails.txtCoverageText4"
     And user tap on "InsuranceATMPlanDetails.txtCoverage3"
     And user see label "InsuranceATMPlanDetails.txtCoverageText3"
     And user tap on "InsuranceATMPlanDetails.txtCoverage2"
     And user see label "InsuranceATMPlanDetails.txtCoverageText2"
     And user tap on "InsuranceATMPlanDetails.txtCoverage1"
     And user see label "InsuranceATMPlanDetails.txtCoverageText1"
     