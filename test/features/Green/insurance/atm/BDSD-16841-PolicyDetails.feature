@regression_green @regression
Feature: BDSD-16841 - Detalle de pólizas [Consulta de Polizas]

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

  @regression_green @regression
  Scenario: BDSD-19457 - Los datos de la poliza son correctos
    When tap on policy "Retiro de efectivo" position 1
    Then an user who is on "InsurancePolicyDetails.txtTitle"
    And user see policy data details

  @regression_green @regression  
  Scenario: BDSD-19458 - El usuario visualiza correctamente los botones
    When tap on policy "Retiro de efectivo" position 1
    Then an user who is on "InsurancePolicyDetails.txtTitle"
    And swipe up 50 percentage
    And user see label "InsurancePolicyDetails.bntCustomerServicePhone"
    And user see label "InsurancePolicyDetails.bntSinisterReport"
    And user see label "InsurancePolicyDetails.bntUnsubscribeInsurance"

  @skip(local='no')
  Scenario: BDSD-19459 - El usuario llama a "Atencion al cliente" desde la opcion que aparece en el detalle de la poliza
    When tap on policy "Retiro de efectivo" position 1
    Then an user who is on "InsurancePolicyDetails.txtTitle"
    When user swipe up
    And user tap on "InsurancePolicyDetails.bntCustomerServicePhone"
    Then Samsung phone app is in foreground

  @skip(local='no')
  Scenario: BDSD-19460 - El usuario quiere reportar un sieniestro
    When tap on policy "Retiro de efectivo" position 1
    And user swipe up
    And user tap on "InsurancePolicyDetails.bntSinisterReport"
    Then user see label "InsuranceSinisterReport.txtTitle"
    And user see label "InsuranceSinisterReport.txtFisrtText"
    And the screen contains the policy number
    And user see label "InsuranceSinisterReport.bntCallSancor"
    When user tap on "InsuranceSinisterReport.bntCallSancor"
    Then Samsung phone app is in foreground