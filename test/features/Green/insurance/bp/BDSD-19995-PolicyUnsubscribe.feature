@green @regression_green @regression
Feature: BDSD-19995 - Bolso - Solicitar la baja

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
    And swipe up 50 percentage
    When user tap on "InsurancePolicyDetails.bntUnsubscribeInsurance"

  @regression_green @regression
  Scenario: BDSD-20614 - El usuario inicia la baja del seguro y obserba correctamente la primer pantalla
    Then user see label "InsuranceUnsubscribeInfo.txtTitle"
    And user see label "InsuranceUnsubscribeInfo.txtBPFirstText"
    And the screen contains the policy number
    And user see label "InsuranceUnsubscribeInfo.bntUnsubscribe"
  
  @regression_green @regression
  Scenario: BDSD-20615 - El usuario visualiza la pantalla para seleccionar el motivo de baja
    Then user see label "InsuranceUnsubscribeInfo.txtTitle"
    When user tap on "InsuranceUnsubscribeInfo.bntUnsubscribe"
    Then user see label "InsuranceReasonUnsubscribe.txtTitle"
    And check all insurance reason "BOLSO" for unsubscribe
    And user see label "InsuranceReasonUnsubscribe.btnContinue"
  
  @regression_green @regression
  Scenario: BDSD-20616 - El usuario visualiza el modal de la baja definitaba del seguro
    Then user see label "InsuranceUnsubscribeInfo.txtTitle"
    When user tap on "InsuranceUnsubscribeInfo.bntUnsubscribe"
    Then user see label "InsuranceReasonUnsubscribe.txtTitle"
    When user tap on "InsuranceReasonUnsubscribe.bntFirstReason"
    And user tap on "InsuranceReasonUnsubscribe.btnContinue"
    Then user see label "InsuranceUnsubscribeModal.txtBPTitle"
    And user see label "InsuranceUnsubscribeModal.txtText"
    And user see label "InsuranceUnsubscribeModal.bntCancelar"
    And user see label "InsuranceUnsubscribeModal.btnUnsubscribe"

  @regression_green @regression
  Scenario: BDSD-20617 - El usuario visualiza el modal de la baja definitaba del seguro y confirma la operacion
    Then user see label "InsuranceUnsubscribeInfo.txtTitle"
    When user tap on "InsuranceUnsubscribeInfo.bntUnsubscribe"
    Then user see label "InsuranceReasonUnsubscribe.txtTitle"
    When user tap on "InsuranceReasonUnsubscribe.bntFirstReason"
    And user tap on "InsuranceReasonUnsubscribe.btnContinue"
    Then user see label "InsuranceUnsubscribeModal.txtBPTitle"
    When user tap on "InsuranceUnsubscribeModal.btnUnsubscribe"
    Then user see label "InsuranceBPUnsubscribeSuccessfully.txtTitle"
    And user see label "InsuranceBPUnsubscribeSuccessfully.txtText"
    And user see label "InsuranceBPUnsubscribeSuccessfully.bntFinish"
    When user tap on "InsuranceBPUnsubscribeSuccessfully.bntFinish"
    Then user see label "InsuranceHome.txtTitle"

  @regression_green @regression
  Scenario: BDSD-20618 - El usuario pierde la conexion a internet al confirmar la baja, luego la recupera y reintenta tapeando el boton Reintentar
    Then user see label "InsuranceUnsubscribeInfo.txtTitle"
    When user tap on "InsuranceUnsubscribeInfo.bntUnsubscribe"
    Then user see label "InsuranceReasonUnsubscribe.txtTitle"
    When user tap on "InsuranceReasonUnsubscribe.bntFirstReason"
    And user tap on "InsuranceReasonUnsubscribe.btnContinue"
    Then user see label "InsuranceUnsubscribeModal.txtBPTitle"
    When user set BS or local network conditions to "no-network"
    And user tap on "InsuranceUnsubscribeModal.btnUnsubscribe"
    Then user see label "InsuranceUnsubscribeError.txtTitle"
    When user set BS or local network conditions to "4g-lte-good"
    And user tap on "InsuranceUnsubscribeError.bntRetry"
    Then user see label "InsuranceBPUnsubscribeSuccessfully.txtTitle"
