@green
Feature: BDSD-16494 - Solicitar la baja

  Background:
    Given an user who is on "Welcome.registerButton"
    And get login token with user email "hmateikabdsolqe@gmail.com"
    And an user who is on "Login.homeScreen"
    And enter passcode "192837"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    When user tap on "TabBar.moreButton"
    And user tap on "TabBar.bntInsurance"
    Then an user who is on "InsuranceHome.txtTitle"

  Scenario: BDSD-18197 - El usuario inicia la baja del seguro y obserba correctamente la primer pantalla
    When user wait to loading image to disappear
    And tap on policy "Hogar" position 1
    Then an user who is on "InsurancePolicyDetails.txtTitle"
    When user swipe up
    And user tap on "InsurancePolicyDetails.bntUnsubscribeInsurance"
    Then user see label "InsuranceUnsubscribeInfo.txtTitle"
    And user see label "InsuranceUnsubscribeInfo.txtFirstText"
    And the screen contains the policy number
    And user see label "InsuranceUnsubscribeInfo.bntUnsubscribe"
  
  Scenario: BDSD-18198 - El usuario inicia la baja del seguro y retorna desde la primer pantalla a la home de seguros
    When user wait to loading image to disappear
    And tap on policy "Hogar" position 1
    Then an user who is on "InsurancePolicyDetails.txtTitle"
    When user swipe up
    And user tap on "InsurancePolicyDetails.bntUnsubscribeInsurance"
    Then user see label "InsuranceUnsubscribeInfo.txtTitle"
    And user see label "InsuranceUnsubscribeInfo.bntBack"
    When user tap on "InsuranceUnsubscribeInfo.bntBack"
    Then an user who is on "InsurancePolicyDetails.txtTitle"
  
  Scenario: BDSD-18199 - El usuario visualiza la pantalla para seleccionar el motivo de baja
    When user wait to loading image to disappear
    And tap on policy "Hogar" position 1
    Then an user who is on "InsurancePolicyDetails.txtTitle"
    When user swipe up
    And user tap on "InsurancePolicyDetails.bntUnsubscribeInsurance"
    Then user see label "InsuranceUnsubscribeInfo.txtTitle"
    When user tap on "InsuranceUnsubscribeInfo.bntUnsubscribe"
    Then user see label "InsuranceReasonUnsubscribe.txtTitle"
    And check all insurance reason "HOGAR" for unsubscribe
    And user see label "InsuranceReasonUnsubscribe.btnContinue"

  Scenario: BDSD-18200 - El usuario visualiza la pantalla para seleccionar el motivo de baja y vuelve a la primer pantalla de baja
    When user wait to loading image to disappear
    And tap on policy "Hogar" position 1
    Then an user who is on "InsurancePolicyDetails.txtTitle"
    When user swipe up
    And user tap on "InsurancePolicyDetails.bntUnsubscribeInsurance"
    Then user see label "InsuranceUnsubscribeInfo.txtTitle"
    When user tap on "InsuranceUnsubscribeInfo.bntUnsubscribe"
    Then user see label "InsuranceReasonUnsubscribe.txtTitle"
    When user tap on "InsuranceReasonUnsubscribe.bntBack"
    Then an user who is on "InsuranceUnsubscribeInfo.txtTitle"


  Scenario: BDSD-18201 - El usuario visualiza el modal de la baja definitaba del seguro
    When user wait to loading image to disappear
    And tap on policy "Hogar" position 1
    Then an user who is on "InsurancePolicyDetails.txtTitle"
    When user swipe up
    And user tap on "InsurancePolicyDetails.bntUnsubscribeInsurance"
    Then user see label "InsuranceUnsubscribeInfo.txtTitle"
    When user tap on "InsuranceUnsubscribeInfo.bntUnsubscribe"
    Then user see label "InsuranceReasonUnsubscribe.txtTitle"
    When user tap on "InsuranceReasonUnsubscribe.bntFirstReason"
    And user tap on "InsuranceReasonUnsubscribe.btnContinue"
    Then user see label "InsuranceUnsubscribeModal.txtTitle"
    And user see label "InsuranceUnsubscribeModal.txtText"
    And user see label "InsuranceUnsubscribeModal.bntCancelar"
    And user see label "InsuranceUnsubscribeModal.btnUnsubscribe"

  Scenario: BDSD-18202 - El usuario visualiza el modal de la baja definitaba del seguro y cancela la operacion
    When user wait to loading image to disappear
    And tap on policy "Hogar" position 1
    Then an user who is on "InsurancePolicyDetails.txtTitle"
    When user swipe up
    And user tap on "InsurancePolicyDetails.bntUnsubscribeInsurance"
    Then user see label "InsuranceUnsubscribeInfo.txtTitle"
    When user tap on "InsuranceUnsubscribeInfo.bntUnsubscribe"
    Then user see label "InsuranceReasonUnsubscribe.txtTitle"
    When user tap on "InsuranceReasonUnsubscribe.bntFirstReason"
    And user tap on "InsuranceReasonUnsubscribe.btnContinue"
    Then user see label "InsuranceUnsubscribeModal.txtTitle"
    When user tap on "InsuranceUnsubscribeModal.bntCancelar"
    And user is not on "InsuranceUnsubscribeModal.txtTitle"
    
    
  Scenario: BDSD-18203 - El usuario visualiza el modal de la baja definitaba del seguro y confirma la operacion
    When user wait to loading image to disappear
    And tap on policy "Hogar" position 1
    Then an user who is on "InsurancePolicyDetails.txtTitle"
    When user swipe up
    And user tap on "InsurancePolicyDetails.bntUnsubscribeInsurance"
    Then user see label "InsuranceUnsubscribeInfo.txtTitle"
    When user tap on "InsuranceUnsubscribeInfo.bntUnsubscribe"
    Then user see label "InsuranceReasonUnsubscribe.txtTitle"
    When user tap on "InsuranceReasonUnsubscribe.bntFirstReason"
    And user tap on "InsuranceReasonUnsubscribe.btnContinue"
    Then user see label "InsuranceUnsubscribeModal.txtTitle"
    When user tap on "InsuranceUnsubscribeModal.btnUnsubscribe"
    Then user see label "InsuranceUnsubscribeSuccessfully.txtTitle"
    And user see label "InsuranceUnsubscribeSuccessfully.txtText"
    And user see label "InsuranceUnsubscribeSuccessfully.bntFinish"
    And user tap on "InsuranceUnsubscribeSuccessfully.bntFinish"
    When getPageSource "5000"


  Scenario: BDSD-16598 - El usuario pierde la conexion a internet al confirmar la baja
    When user wait to loading image to disappear
    And tap on policy "Hogar" position 1
    Then an user who is on "InsurancePolicyDetails.txtTitle"
    When user swipe up
    And user tap on "InsurancePolicyDetails.bntUnsubscribeInsurance"
    Then user see label "InsuranceUnsubscribeInfo.txtTitle"
    When user tap on "InsuranceUnsubscribeInfo.bntUnsubscribe"
    Then user see label "InsuranceReasonUnsubscribe.txtTitle"
    When user tap on "InsuranceReasonUnsubscribe.bntFirstReason"
    And user tap on "InsuranceReasonUnsubscribe.btnContinue"
    Then user see label "InsuranceUnsubscribeModal.txtTitle"
    When user set BS or local network conditions to "airplane-mode"
    When user tap on "InsuranceUnsubscribeModal.btnUnsubscribe"
    Then user see label "InsuranceUnsubscribeError.txtTitle"
    Then user see label "InsuranceUnsubscribeError.bntRetry"
    When user set BS or local network conditions to "4g-lte-good"
    
  Scenario: BDSD-18204 - El usuario pierde la conexion a internet al confirmar la baja, luego la recupera y reintenta tapeando el boton Reintentar
    When user wait to loading image to disappear
    And tap on policy "Hogar" position 1
    Then an user who is on "InsurancePolicyDetails.txtTitle"
    When user swipe up
    And user tap on "InsurancePolicyDetails.bntUnsubscribeInsurance"
    Then user see label "InsuranceUnsubscribeInfo.txtTitle"
    When user tap on "InsuranceUnsubscribeInfo.bntUnsubscribe"
    Then user see label "InsuranceReasonUnsubscribe.txtTitle"
    When user tap on "InsuranceReasonUnsubscribe.bntFirstReason"
    And user tap on "InsuranceReasonUnsubscribe.btnContinue"
    Then user see label "InsuranceUnsubscribeModal.txtTitle"
    When user set BS or local network conditions to "airplane-mode"
    And user tap on "InsuranceUnsubscribeModal.btnUnsubscribe"
    Then user see label "InsuranceUnsubscribeError.txtTitle"
    When user set BS or local network conditions to "4g-lte-good"
    And user tap on "InsuranceUnsubscribeError.bntRetry"
    Then user see label "InsuranceUnsubscribeSuccessfully.txtTitle"

     
  Scenario: BDSD-18205 - El usuaio tapea en la cruz y regresa al detalle de la poliza cuando aparece el mensaje de error al intentar realizar la baja
    When user wait to loading image to disappear
    And tap on policy "Hogar" position 1
    Then an user who is on "InsurancePolicyDetails.txtTitle"
    When user swipe up
    And user tap on "InsurancePolicyDetails.bntUnsubscribeInsurance"
    Then user see label "InsuranceUnsubscribeInfo.txtTitle"
    When user tap on "InsuranceUnsubscribeInfo.bntUnsubscribe"
    Then user see label "InsuranceReasonUnsubscribe.txtTitle"
    When user tap on "InsuranceReasonUnsubscribe.bntFirstReason"
    And user tap on "InsuranceReasonUnsubscribe.btnContinue"
    Then user see label "InsuranceUnsubscribeModal.txtTitle"
    When user set BS or local network conditions to "airplane-mode"
    And user tap on "InsuranceUnsubscribeModal.btnUnsubscribe"
    Then user see label "InsuranceUnsubscribeError.txtTitle"
    When user set BS or local network conditions to "4g-lte-good"
    And user tap on "InsuranceUnsubscribeError.bntBack"
    Then an user who is on "InsurancePolicyDetails.txtTitle"
    
    
