@regression_green @regression
Feature: BDSD-19991 - Detalle de pólizas Bolso [Consulta de Polizas]

  Background:
    Given an user who is on "Welcome.registerButton"
    And get login token with user email "pmallo@bdsol.com.ar"
    And an user who is on "Login.homeScreen"
    And enter passcode "192837"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    And change wiremock scenario "insuranceGetPolicies" to status "allTypes"
    When user tap on "TabBar.moreButton"
    And user tap on "TabBar.bntInsurance"
    Then an user who is on "InsuranceHome.txtTitle"
    When tap on policy "Bolso" position 1
    Then an user who is on "InsurancePolicyDetails.txtTitle"

  @regression_green @regression
  Scenario: BDSD-20548 - Los datos de la poliza son correctos
    Then user see policy data details

  @regression_green @regression  
  Scenario: BDSD-20549 - El usuario retorna correctamente a la Home de Seguros
    When swipe up 50 percentage
    Then user see label "InsurancePolicyDetails.bntCustomerServicePhone"
    And user see label "InsurancePolicyDetails.bntSinisterReport"
    And user see label "InsurancePolicyDetails.bntUnsubscribeInsurance"

  @regression_green @regression
  Scenario: BDSD-20551 - El usuario ve la opcion de llamar a "Atencion al cliente" desde la opcion que aparece en el detalle de la poliza
    When user swipe up
    And user tap on "InsurancePolicyDetails.bntCustomerServicePhone"

  @regression_green @regression
  Scenario: BDSD-20552 - El usuario visualiza correctamente la pantalla de reportar un sieniestro
    When user swipe up
    And user tap on "InsurancePolicyDetails.bntSinisterReport"
    Then user see label "InsuranceSinisterReport.txtTitle"
    And user see label "InsuranceSinisterReport.txtFisrtText"
    And the screen contains the policy number
    And user see label "InsuranceSinisterReport.bntCallSancor"
    When user tap on "InsuranceSinisterReport.bntCallSancor"
