@green
Feature: BDSD-17642 - ATM - Solicitar la baja

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
    When tap on policy "Retiro de efectivo" position 1
    Then an user who is on "InsurancePolicyDetails.txtTitle"
    And swipe up 50 percentage
    When user tap on "InsurancePolicyDetails.bntUnsubscribeInsurance"
  
  @regression_green @regression  
  Scenario: BDSD-19769 - El usuario inicia la baja del seguro y obserba correctamente la primer pantalla
    Then user see label "InsuranceUnsubscribeInfo.txtTitle"
    And user see label "InsuranceUnsubscribeInfo.txtATMFirstText"
    And the screen contains the policy number
    And user see label "InsuranceUnsubscribeInfo.bntUnsubscribe"
  
  @regression_green @regression  
  Scenario: BDSD-19770 - El usuario inicia la baja del seguro y retorna desde la primer pantalla a la home de seguros
    Then user see label "InsuranceUnsubscribeInfo.txtTitle"
    And user see label "InsuranceUnsubscribeInfo.bntBack"
    When user tap on "InsuranceUnsubscribeInfo.bntBack"
    Then an user who is on "InsurancePolicyDetails.txtTitle"
    
  @regression_green @regression  
  Scenario: BDSD-19771 - El usuario visualiza la pantalla para seleccionar el motivo de baja
    Then user see label "InsuranceUnsubscribeInfo.txtTitle"
    When user tap on "InsuranceUnsubscribeInfo.bntUnsubscribe"
    Then user see label "InsuranceReasonUnsubscribe.txtTitle"
    And check all insurance reason "ATM" for unsubscribe
    And user see label "InsuranceReasonUnsubscribe.btnContinue"

  @regression_green @regression  
  Scenario: BDSD-19772 - El usuario visualiza la pantalla para seleccionar el motivo de baja y vuelve a la primer pantalla de baja
    Then user see label "InsuranceUnsubscribeInfo.txtTitle"
    When user tap on "InsuranceUnsubscribeInfo.bntUnsubscribe"
    Then user see label "InsuranceReasonUnsubscribe.txtTitle"
    When user tap on "InsuranceReasonUnsubscribe.bntBack"
    Then an user who is on "InsuranceUnsubscribeInfo.txtTitle"

  @regression_green @regression  
  Scenario: BDSD-19773 - El usuario visualiza el modal de la baja definitaba del seguro
    Then user see label "InsuranceUnsubscribeInfo.txtTitle"
    When user tap on "InsuranceUnsubscribeInfo.bntUnsubscribe"
    Then user see label "InsuranceReasonUnsubscribe.txtTitle"
    When user tap on "InsuranceReasonUnsubscribe.bntFirstReason"
    And user tap on "InsuranceReasonUnsubscribe.btnContinue"
    Then user see label "InsuranceUnsubscribeModal.txtATMTitle"
    And user see label "InsuranceUnsubscribeModal.txtText"
    And user see label "InsuranceUnsubscribeModal.bntCancelar"
    And user see label "InsuranceUnsubscribeModal.btnUnsubscribe"

  @regression_green @regression  
  Scenario: BDSD-19774 - El usuario visualiza el modal de la baja definitaba del seguro y cancela la operacion
    Then user see label "InsuranceUnsubscribeInfo.txtTitle"
    When user tap on "InsuranceUnsubscribeInfo.bntUnsubscribe"
    Then user see label "InsuranceReasonUnsubscribe.txtTitle"
    When user tap on "InsuranceReasonUnsubscribe.bntFirstReason"
    And user tap on "InsuranceReasonUnsubscribe.btnContinue"
    Then user see label "InsuranceUnsubscribeModal.txtATMTitle"
    When user tap on "InsuranceUnsubscribeModal.bntCancelar"
    Then user is not on "InsuranceUnsubscribeModal.txtATMTitle"
    
  @regression_green @regression  
  Scenario: BDSD-19775 - El usuario visualiza el modal de la baja definitaba del seguro y confirma la operacion
    Then user see label "InsuranceUnsubscribeInfo.txtTitle"
    When user tap on "InsuranceUnsubscribeInfo.bntUnsubscribe"
    Then user see label "InsuranceReasonUnsubscribe.txtTitle"
    When user tap on "InsuranceReasonUnsubscribe.bntFirstReason"
    And user tap on "InsuranceReasonUnsubscribe.btnContinue"
    Then user see label "InsuranceUnsubscribeModal.txtATMTitle"
    When user tap on "InsuranceUnsubscribeModal.btnUnsubscribe"
    Then user see label "InsuranceATMUnsubscribeSuccessfully.txtTitle"
    And user see label "InsuranceATMUnsubscribeSuccessfully.txtText"
    And user see label "InsuranceATMUnsubscribeSuccessfully.bntFinish"
    When user tap on "InsuranceATMUnsubscribeSuccessfully.bntFinish"
    Then user see label "InsuranceHome.txtTitle"
  
  @regression_green @regression  
  Scenario: BDSD-19776 - El usuario pierde la conexion a internet al confirmar la baja
    Then user see label "InsuranceUnsubscribeInfo.txtTitle"
    When user tap on "InsuranceUnsubscribeInfo.bntUnsubscribe"
    Then user see label "InsuranceReasonUnsubscribe.txtTitle"
    When user tap on "InsuranceReasonUnsubscribe.bntFirstReason"
    And user tap on "InsuranceReasonUnsubscribe.btnContinue"
    Then user see label "InsuranceUnsubscribeModal.txtATMTitle"
    When user set BS or local network conditions to "airplane-mode"
    When user tap on "InsuranceUnsubscribeModal.btnUnsubscribe"
    Then user see label "InsuranceUnsubscribeError.txtTitle"
    Then user see label "InsuranceUnsubscribeError.bntRetry"
    When user set BS or local network conditions to "4g-lte-good"

  @regression_green @regression  
  Scenario: BDSD-19777 - El usuario pierde la conexion a internet al confirmar la baja, luego la recupera y reintenta tapeando el boton Reintentar
    Then user see label "InsuranceUnsubscribeInfo.txtTitle"
    When user tap on "InsuranceUnsubscribeInfo.bntUnsubscribe"
    Then user see label "InsuranceReasonUnsubscribe.txtTitle"
    When user tap on "InsuranceReasonUnsubscribe.bntFirstReason"
    And user tap on "InsuranceReasonUnsubscribe.btnContinue"
    Then user see label "InsuranceUnsubscribeModal.txtATMTitle"
    When user set BS or local network conditions to "no-network"
    And user tap on "InsuranceUnsubscribeModal.btnUnsubscribe"
    Then user see label "InsuranceUnsubscribeError.txtTitle"
    When user set BS or local network conditions to "4g-lte-good"
    And user tap on "InsuranceUnsubscribeError.bntRetry"
    Then user see label "InsuranceATMUnsubscribeSuccessfully.txtTitle"

  @regression_green @regression  
  Scenario: BDSD-19778 - El usuaio tapea en la cruz y regresa al detalle de la poliza cuando aparece el mensaje de error al intentar realizar la baja
    Then user see label "InsuranceUnsubscribeInfo.txtTitle"
    When user tap on "InsuranceUnsubscribeInfo.bntUnsubscribe"
    Then user see label "InsuranceReasonUnsubscribe.txtTitle"
    When user tap on "InsuranceReasonUnsubscribe.bntFirstReason"
    And user tap on "InsuranceReasonUnsubscribe.btnContinue"
    Then user see label "InsuranceUnsubscribeModal.txtATMTitle"
    When user set BS or local network conditions to "no-network"
    And user tap on "InsuranceUnsubscribeModal.btnUnsubscribe"
    Then user see label "InsuranceUnsubscribeError.txtTitle"
    When user set BS or local network conditions to "4g-lte-good"
    And user tap on "InsuranceUnsubscribeError.bntBack"
    Then an user who is on "InsuranceUnsubscribeInfo.txtTitle"
    
    
