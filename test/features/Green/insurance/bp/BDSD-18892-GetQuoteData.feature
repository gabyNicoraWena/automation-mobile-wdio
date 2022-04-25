@regression_green @regression
Feature: BDSD-18892 - Datos para cotizar

  Background:
    Given an user who is on "Welcome.registerButton"

  @regression_green @regression
  Scenario: BDSD-20206 - El usuario ingresa a la seccion donde elige su domicilio
    Given get login token with user email "pmallo@bdsol.com.ar"
    And an user who is on "Login.homeScreen"
    And enter passcode "192837"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    When user tap on "TabBar.moreButton"
    And user tap on "TabBar.bntInsurance"
    Then an user who is on "InsuranceHome.txtTitle"
    When user tap on "InsuranceHome.bntNewInsurance"
    And user tap on "InsuranceNewPolicyType.btnNewPolicyBP"
    Then user see label "InsuranceBPFistEntry.txtTitle"
    When user tap on "InsuranceBPFistEntry.btnContinue"
    Then an user who is on "InsuranceSelectAddress.txtTitle"
    And user see label "InsuranceSelectAddress.btnContinue"

  @regression_green @regression
  Scenario: BDSD-20207 - El usuario ingresa a la seccion donde elige su domicilio pero no tiene ninguno pre-cargado
    Given get login token with user email "bdsnoaddress@gmail.com"
    And an user who is on "Login.homeScreen"
    And enter passcode "192837"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    When user tap on "TabBar.moreButton"
    And user tap on "TabBar.bntInsurance"
    Then an user who is on "InsuranceHome.txtTitle"
    When user tap on "InsuranceHome.bntNewInsurance"
    And user tap on "InsuranceNewPolicyType.btnNewPolicyBP"
    Then user see label "InsuranceBPFistEntry.txtTitle"
    When user tap on "InsuranceBPFistEntry.btnContinue"
    Then user see label "InsuranceAddAddress.txtTitleATM"
    And user see label "InsuranceAddAddress.boxAddress"
    And user see label "InsuranceAddAddress.btnContinue"

  @regression_green @regression @este
  Scenario: BDSD-20208 - El usuario cuenta con direcciones pre-cargada e ingresa un nuevo domicilio
     Given get login token with user email "pmallo@bdsol.com.ar"
     And an user who is on "Login.homeScreen"
     And enter passcode "192837"
     And skip biometry if it is activated
     And user close toolTip tapping on Understood
     When user tap on "TabBar.moreButton"
     And user tap on "TabBar.bntInsurance"
     Then an user who is on "InsuranceHome.txtTitle"
     When user tap on "InsuranceHome.bntNewInsurance"
     And user tap on "InsuranceNewPolicyType.btnNewPolicyBP"
     Then user see label "InsuranceBPFistEntry.txtTitle"
     When user tap on "InsuranceBPFistEntry.btnContinue"
     And user tap on "InsuranceSelectAddress.btnAddPostalCode"
     Then user see label "InsuranceAddAddress.boxAddress"
     And user see label "InsuranceAddAddress.btnContinue"
 
 @regression_green @regression
 Scenario: BDSD-20209 - El usuario ingresa a la seccion ayuda de Seguros BS
     Given get login token with user email "bdsnoaddress@gmail.com"
     And an user who is on "Login.homeScreen"
     And enter passcode "192837"
     And skip biometry if it is activated
     And user close toolTip tapping on Understood
     When user tap on "TabBar.moreButton"
     And user tap on "TabBar.bntInsurance"
     Then an user who is on "InsuranceHome.txtTitle"
     When user tap on "InsuranceHome.bntNewInsurance"
     And user see label "InsuranceNewPolicyType.txtSubtitle"
     And user tap on "InsuranceNewPolicyType.btnNewPolicyBP"
    Then user see label "InsuranceBPFistEntry.txtTitle"
    When user tap on "InsuranceBPFistEntry.btnContinue"
     When user tap on "InsuranceATMFistEntry.btnHelp"
     Then user see label "HelpSection.textFrecuentlyAsq"