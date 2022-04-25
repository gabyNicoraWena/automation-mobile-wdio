@regression_green @regression
Feature: BDSD-15851/BDSD-16297 - Detalle de la cobertura

  Background:
    Given an user who is on "Welcome.registerButton"

  @regression_green @regression 
  Scenario: BDSD-16903 - El usuario ingresa correctamente al detalle de la poliza
     Given get login token with user email "pmallo@bdsol.com.ar"
     And an user who is on "Login.homeScreen"
     And enter passcode "192837"
     And skip biometry if it is activated
     And user close toolTip tapping on Understood
     When user tap on "TabBar.moreButton"
     And user tap on "TabBar.bntInsurance"
      Then an user who is on "InsuranceHome.txtTitle"
     When user tap on "InsuranceHome.bntNewInsurance"
     When user tap on "InsuranceNewPolicyType.btnNewPolicyHome"
     And user tap on "InsuranceFistEntry.btnContinue"
     Then an user who is on "InsuranceSelectAddress.txtTitle"
     When user tap on "InsuranceSelectAddress.firstAddress"
     And user tap on "InsuranceSelectAddress.btnContinue"
     Then an user who is on "InsuranceViewOffers.txtTitle"
     When user tap on "InsuranceViewOffers.bntFirstPlanSeeCoverage"
     Then user see text "Plan 1500"
     
  @regression_green @regression
  Scenario: BDSD-16904 - El usuario ingresa al detalle de la poliza y vuelve correctamente a la pantalla de cotizacion
     Given get login token with user email "pmallo@bdsol.com.ar"
     And an user who is on "Login.homeScreen"
     And enter passcode "192837"
     And skip biometry if it is activated
     And user close toolTip tapping on Understood
     When user tap on "TabBar.moreButton"
     And user tap on "TabBar.bntInsurance"
      Then an user who is on "InsuranceHome.txtTitle"
     When user tap on "InsuranceHome.bntNewInsurance"
     When user tap on "InsuranceNewPolicyType.btnNewPolicyHome"
     And user tap on "InsuranceFistEntry.btnContinue"
     Then an user who is on "InsuranceSelectAddress.txtTitle"
     When user tap on "InsuranceSelectAddress.firstAddress"
     And user tap on "InsuranceSelectAddress.btnContinue"
     Then an user who is on "InsuranceViewOffers.txtTitle"
     When user tap on "InsuranceViewOffers.bntFirstPlanSeeCoverage"
     Then user see text "Plan 1500"
     When user tap on "InsurancePlanDetails.bntBack"
     Then an user who is on "InsuranceViewOffers.txtTitle"

  @regression_green @regression
  Scenario: BDSD-16905 - Todos los detalle de la poliza se muestran correctamente
     Given get login token with user email "pmallo@bdsol.com.ar"
     And an user who is on "Login.homeScreen"
     And enter passcode "192837"
     And skip biometry if it is activated
     And user close toolTip tapping on Understood
     When user tap on "TabBar.moreButton"
     And user tap on "TabBar.bntInsurance"
     Then an user who is on "InsuranceHome.txtTitle"
     When user tap on "InsuranceHome.bntNewInsurance"
     When user tap on "InsuranceNewPolicyType.btnNewPolicyHome"
     And user tap on "InsuranceFistEntry.btnContinue"
     Then an user who is on "InsuranceSelectAddress.txtTitle"
     When user tap on "InsuranceSelectAddress.firstAddress"
     And user tap on "InsuranceSelectAddress.btnContinue"
     Then an user who is on "InsuranceViewOffers.txtTitle"
     When user tap on "InsuranceViewOffers.bntFirstPlanSeeCoverage"
     Then user see text "Plan 1500"
     And user view the plan details for zipcode "2705"
     And view clean service for plan by zipcode "2705"
    
   @regression_green @regression
   Scenario: BDSD-18325 - Se muestra correctamente el detalle de una cobertura cuando la misma tiene una descripción
     Given get login token with user email "pmallo@bdsol.com.ar"
     And an user who is on "Login.homeScreen"
     And enter passcode "192837"
     And skip biometry if it is activated
     And user close toolTip tapping on Understood
     When user tap on "TabBar.moreButton"
     And user tap on "TabBar.bntInsurance"
     Then an user who is on "InsuranceHome.txtTitle"
     When user tap on "InsuranceHome.bntNewInsurance"
     When user tap on "InsuranceNewPolicyType.btnNewPolicyHome"
     And user tap on "InsuranceFistEntry.btnContinue"
     Then an user who is on "InsuranceSelectAddress.txtTitle"
     When user tap on "InsuranceSelectAddress.firstAddress"
     And user tap on "InsuranceSelectAddress.btnContinue"
     Then an user who is on "InsuranceViewOffers.txtTitle"
     When user tap on "InsuranceViewOffers.bntFirstPlanSeeCoverage"
     Then an user who is on "InsurancePlanDetails.txtPlan1500Title"
     When user tap on "InsurancePlanDetails.bntFirstCoverageWithDescription"
     Then user see label "InsurancePlanDetails.txtFirstCoverageWithDescription"

  @regression_green @regression
  Scenario: BDSD-18326 - No se muestra el detalle de una cobertura cuando la misma no tiene una descripción
     Given get login token with user email "pmallo@bdsol.com.ar"
     And an user who is on "Login.homeScreen"
     And enter passcode "192837"
     And skip biometry if it is activated
     And user close toolTip tapping on Understood
     When user tap on "TabBar.moreButton"
     And user tap on "TabBar.bntInsurance"
     Then an user who is on "InsuranceHome.txtTitle"
     When user tap on "InsuranceHome.bntNewInsurance"
     When user tap on "InsuranceNewPolicyType.btnNewPolicyHome"
     And user tap on "InsuranceFistEntry.btnContinue"
     Then an user who is on "InsuranceSelectAddress.txtTitle"
     When user tap on "InsuranceSelectAddress.firstAddress"
     And user tap on "InsuranceSelectAddress.btnContinue"
     Then an user who is on "InsuranceViewOffers.txtTitle"
     When user tap on "InsuranceViewOffers.bntFirstPlanSeeCoverage"
     Then an user who is on "InsurancePlanDetails.txtPlan1500Title"
     When user tap on "InsurancePlanDetails.bntFirstCoverageWithoutDescription"
     Then user cant see "InsurancePlanDetails.txtFirstCoverageWithoutDescription"

     