@regression_green @regression
Feature: BDSD-15846 Visualizar ofertas disponibles sin animación

  Background:
    Given an user who is on "Welcome.registerButton"
    And change wiremock scenario "insuranceGetPolicies" to status "allTypes"
    
  @regression_green @regression
  Scenario: BDSD-16557 - El usuario ingresa a la seccion de cotizar y en la parte superior se muestra correctamente los datos del primer plan
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
     Then an user who is on "InsuranceFistEntry.txtTitle"
     And user tap on "InsuranceFistEntry.btnContinue"
     Then an user who is on "InsuranceSelectAddress.txtTitle"
     When user tap on "InsuranceSelectAddress.firstAddress"
     And user tap on "InsuranceSelectAddress.btnContinue"
     Then an user who is on "InsuranceViewOffers.txtTitle"
     And user see the 1 plan into header screen from zipcode "2705"
     And user see the 2 plan into header screen from zipcode "2705"
     And user see the 3 plan into header screen from zipcode "2705"
  
  @regression_green @regression
  Scenario: BDSD-16558 - El usuario ingresa a la seccion de cotizar, seleciona los 3 planes y comprueba sus datos
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
     When user tap on "InsuranceViewOffers.firstPlan"
     Then user views the detail of the 1 plan for zip code "2705"
     And user see label "InsuranceViewOffers.bntFirstPlanSeeCoverage"
     And user see label "InsuranceViewOffers.bntFirstPlanBuyInsurance"
     When user tap on "InsuranceViewOffers.secondPlan"
     Then user views the detail of the 2 plan for zip code "2705"
     And user see label "InsuranceViewOffers.bntSecondPlanSeeCoverage"
     And user see label "InsuranceViewOffers.bntSecondPlanBuyInsurance"
     When user tap on "InsuranceViewOffers.thirdPlan"
     Then user views the detail of the 3 plan for zip code "2705"
     And user see label "InsuranceViewOffers.bntThirdPlanSeeCoverage"
     And user see label "InsuranceViewOffers.bntThirdPlanBuyInsurance"

  @regression_green @regression 
  Scenario: BDSD-16559 - El usuario ingresa a la seccion de cotizar y entra en la ayuda
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
     When user tap on "HelpSection.help"
     Then user see label "HelpSection.btnConsumerDefense"

  @regression_green @regression
  Scenario: BDSD-16560 - El usuario ingresa a la seccion de cotizar y luego regresa a la pantalla de seleccion de domicilios pre-cargados
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
     When user tap on "InsuranceSelectAddress.firstAddress"
     And user tap on "InsuranceSelectAddress.btnContinue"
     Then an user who is on "InsuranceViewOffers.txtTitle"
     And user see the 1 plan into header screen from zipcode "2705"
     When user tap on "InsuranceViewOffers.bntBackToSelectAddress"
     Then an user who is on "InsuranceSelectAddress.txtTitle"

  @regression_green @regression
  Scenario: BDSD-16561 - El usuario ingresa a la seccion de cotizar y luego regresa a la pantalla de ingreso de CP a cotizar
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
     And user tap on "InsuranceSelectAddress.btnAddPostalCode"
     Then user set "2705" on field "InsuranceAddAddress.boxAddress"
     When user tap on "InsuranceAddAddress.btnContinue"
     Then an user who is on "InsuranceViewOffers.txtTitle"
     And user see the 1 plan into header screen from zipcode "2705"
     When user tap on "InsuranceViewOffers.bntBackToAddAddress"
     Then user see label "InsuranceAddAddress.boxAddress"

  @regression_green @regression
  Scenario: BDSD-16562 - El usuario ingresa a la seccion de cotizar y adquiere el primer plan
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
     When user tap on "InsuranceSelectAddress.firstAddress"
     And user tap on "InsuranceSelectAddress.btnContinue"
     Then an user who is on "InsuranceViewOffers.txtTitle"
     When user tap on "InsuranceViewOffers.firstPlan"
     And user tap on "InsuranceViewOffers.bntFirstPlanBuyInsurance"
     Then an user who is on "InsuranceDataAddress.txtTitle"

  @regression_green @regression
  Scenario: BDSD-16598 - El usuario quiere ingresar a la pantalla de cotización pero el MS no responde
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
     When user set BS or local network conditions to "no-network"
     And user tap on "InsuranceSelectAddress.btnContinue"
     Then an user who is on "InsuranceViewOffersErrorPage.txtTitle"
     And an user who is on "InsuranceViewOffersErrorPage.txtText"
     And an user who is on "InsuranceViewOffersErrorPage.bntRetry"
     When user set BS or local network conditions to "4g-lte-good"
     And user tap on "InsuranceViewOffersErrorPage.bntRetry"
     Then an user who is on "InsuranceViewOffers.txtTitle"