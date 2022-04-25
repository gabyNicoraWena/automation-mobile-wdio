@regression_green @regression
Feature: BDSD-16839 - ATM Confirmar seguro

  Background:
    Given an user who is on "Welcome.registerButton"
     And get login token with user email "pmallo@bdsol.com.ar"
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
      When user tap on "InsuranceSelectAddress.btnAddPostalCode"
     And user types "2705" on field "InsuranceAddAddress.boxAddress"
     And user tap on "InsuranceSelectAddress.btnContinue"
     Then an user who is on "InsuranceATMViewOffers.txtTitle"
     And user see label "InsuranceViewOffers.bntFirstPlanSeeCoverage"
     And user tap on "InsuranceViewOffers.bntFirstPlanBuyInsurance"
     Then an user who is on "InsuranceDataAddress.txtTitle"
     When user tap on "InsuranceDataAddress.chkBoxApartment"
     And set "Calle 1" on "InsuranceDataAddress.boxStreet"
     And set "100" on "InsuranceDataAddress.boxNumber"
     And set "1A" on "InsuranceDataAddress.boxDpto"
     And user swipe up
     And select option "2" on city combobox
     And set "11" on "InsuranceDataAddress.boxPhoneCode"
     And set "63658458" on "InsuranceDataAddress.boxPhone"
     And user tap on "InsuranceDataAddress.btnContinue"
     Then user see label "InsuranceATMConfirmPolicy.txtTitle"

  @regression_green @regression
  Scenario: BDSD-19377 - El usuario ingresa a la pantalla de confirmacion de Seguros de ATM y visualiza correctamente todos los elementos
     Then user see label "InsuranceATMConfirmPolicy.txtPlanValue"
     And user see label "InsuranceATMConfirmPolicy.txtPlanValueLabel"
     And user see label "InsuranceATMConfirmPolicy.txtPlanDetailsLabel"
     And user see label "InsuranceATMConfirmPolicy.txtCoverageAmountLabel"
     And user see label "InsuranceATMConfirmPolicy.txtCoverageAmountValue"
     And user see label "InsuranceATMConfirmPolicy.txtCoverageTitle"
     And user see label "InsuranceATMConfirmPolicy.txtCoverageDescription"
     And user see label "InsuranceATMConfirmPolicy.linkViewCoverage"
     And user see contains text "Calle 1" on element "InsuranceConfirmPolicy.txtAddress"
     And user see contains text "100" on element "InsuranceConfirmPolicy.txtAddress"
     And user see contains text "1A" on element "InsuranceConfirmPolicy.txtAddress"
     And user see contains text "Departamento" on element "InsuranceConfirmPolicy.txtAddress"
     When swipe up 50 percentage
     Then user see contains text "CP 2705" on element "InsuranceConfirmPolicy.txtAddress"
     And user see contains text "Buenos Aires" on element "InsuranceConfirmPolicy.txtAddress"
     And user see label "InsuranceATMConfirmPolicy.txtPaymentDetailsLabel"
     And user see label "InsuranceATMConfirmPolicy.txtPaymentModeTitle"
     And user see label "InsuranceATMConfirmPolicy.txtWayToPay"
     When swipe up 25 percentage
     Then user see label "InsuranceATMConfirmPolicy.txtEmailTitle"
     And user see label "InsuranceATMConfirmPolicy.txtEmailValue"
     And user see label "InsuranceATMConfirmPolicy.linkPolicyConditions"
     And user see label "InsuranceATMConfirmPolicy.checkboxPolicyConditions"
     And user see label "InsuranceATMConfirmPolicy.btnContinue"
     
  @regression_green @regression
  Scenario: BDSD-19378 - El usuario ingresa al cotizador de Seguros de ATM e intenta contratar el seguro sin aceptar los terminos y condiciones
     When user tap on "InsuranceATMConfirmPolicy.btnContinue"
     Then user see label "InsuranceATMConfirmPolicy.txtPlanValue"

  @regression_green @regression
  Scenario: BDSD-19379 - El usuario confirma la adquisicion y tapea en finalizar
     When user tap on "InsuranceATMConfirmPolicy.checkboxPolicyConditions"
     And user tap on "InsuranceATMConfirmPolicy.btnContinue"
     Then user see label "InsuranceNewATMPolicySuccess.txtTitle"
     And user see label "InsuranceNewATMPolicySuccess.txtSubTitle"
     When user tap on "InsuranceNewATMPolicySuccess.btnFinish"
     Then user see label "InsuranceHome.txtTitle"

  @regression_green @regression
  Scenario: BDSD-19380 - El usuario confirma la adquisicion y tapea la cruz
    When user tap on "InsuranceATMConfirmPolicy.checkboxPolicyConditions"
    And user tap on "InsuranceATMConfirmPolicy.btnContinue"
    Then user see label "InsuranceNewATMPolicySuccess.txtTitle"
    And user see label "InsuranceNewATMPolicySuccess.txtSubTitle"
    When user tap on "InsuranceNewATMPolicySuccess.btnBack"
    Then user see label "InsuranceHome.txtTitle"

  @regression_green @regression
  Scenario: BDSD-19685 - Comprobar que los montos del plan se visualicen correctamente en la pantalla de confirmacion
    Then check user data into atm confirm screen by zipcode "2705"
