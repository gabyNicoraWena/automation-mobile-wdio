@regression_green @regression
Feature: BDSD-19160 - Datos para cotizar

  Background:
    Given an user who is on "Welcome.registerButton"

  @regression_green @regression
  Scenario: BDSD-19336 - El usuario ingresa a la seccion donde elige su domicilio
     Given get login token with user email "pmallo@bdsol.com.ar"
     And an user who is on "Login.homeScreen"
     And enter passcode "192837"
     And skip biometry if it is activated
     And user close toolTip tapping on Understood
     When user tap on "TabBar.moreButton"
     And user tap on "TabBar.bntInsurance"
     Then an user who is on "InsuranceHome.txtTitle"
     When user tap on "InsuranceHome.bntNewInsurance"
     And user see label "InsuranceNewPolicyType.txtSubtitle"
     And user tap on "InsuranceNewPolicyType.btnNewPolicyAtm"
     And user tap on "InsuranceATMFistEntry.btnContinue"
     Then an user who is on "InsuranceSelectAddress.txtTitle"
     And user see label "InsuranceSelectAddress.btnContinue"

  @regression_green @regression
  Scenario: BDSD-19337 - El usuario ingresa a la seccion donde elige su domicilio pero no tiene ninguno pre-cargado
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
     And user tap on "InsuranceNewPolicyType.btnNewPolicyAtm"
     And user tap on "InsuranceATMFistEntry.btnContinue"
     Then user see label "InsuranceAddAddress.txtTitleATM"
     And user see label "InsuranceAddAddress.boxAddress"
     And user see label "InsuranceAddAddress.btnContinue"

  @regression_green @regression
  Scenario: BDSD-19338 - El usuario ingresa que no tiene ninguno domicilio pre-cargado ingresa un CP invalido
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
     And user tap on "InsuranceNewPolicyType.btnNewPolicyAtm"
     And user tap on "InsuranceFistEntry.btnContinue"
     Then user see label "InsuranceAddAddress.txtTitleATM"
     And user see label "InsuranceAddAddress.boxAddress"
     When user set "123456" on field "InsuranceAddAddress.boxAddress"
     And user tap on "InsuranceAddAddress.btnContinue"
     Then user see label "InsuranceAddAddress.txtErrorZipcodeInvalid"

  @regression_green @regression
  Scenario: BDSD-19339 - El usuario cuenta con direcciones pre-cargada e ingresa un nuevo domicilio
     Given get login token with user email "pmallo@bdsol.com.ar"
     And an user who is on "Login.homeScreen"
     And enter passcode "192837"
     And skip biometry if it is activated
     And user close toolTip tapping on Understood
     When user tap on "TabBar.moreButton"
     And user tap on "TabBar.bntInsurance"
     Then an user who is on "InsuranceHome.txtTitle"
     When user tap on "InsuranceHome.bntNewInsurance"
     And user see label "InsuranceNewPolicyType.txtSubtitle"
     And user tap on "InsuranceNewPolicyType.btnNewPolicyAtm"
     And user tap on "InsuranceFistEntry.btnContinue"
     And user tap on "InsuranceSelectAddress.btnAddPostalCode"
     Then user see label "InsuranceAddAddress.boxAddress"
     And user see label "InsuranceAddAddress.btnContinue"

  @regression_green @regression
  Scenario: BDSD-19340 - El usuario cuenta con direcciones pre-cargada e ingresa un nuevo domicilio utilizando un CP invalido
     Given get login token with user email "pmallo@bdsol.com.ar"
     And an user who is on "Login.homeScreen"
     And enter passcode "192837"
     And skip biometry if it is activated
     And user close toolTip tapping on Understood
     When user tap on "TabBar.moreButton"
     And user tap on "TabBar.bntInsurance"
     Then an user who is on "InsuranceHome.txtTitle"
     When user tap on "InsuranceHome.bntNewInsurance"
     And user see label "InsuranceNewPolicyType.txtSubtitle"
     And user tap on "InsuranceNewPolicyType.btnNewPolicyAtm"
     And user tap on "InsuranceFistEntry.btnContinue"
     And user tap on "InsuranceSelectAddress.btnAddPostalCode"
     Then user set "123456" on field "InsuranceAddAddress.boxAddress"
     When user tap on "InsuranceAddAddress.btnContinue"
     Then user see label "InsuranceAddAddress.txtErrorZipcodeInvalid"

  @regression_green @regression
  Scenario: BDSD-19341 - El usuario ingresa a la seccion donde elige su domicilio e intenta continuar sin seleccionar uno
     Given get login token with user email "pmallo@bdsol.com.ar"
     And an user who is on "Login.homeScreen"
     And enter passcode "192837"
     And skip biometry if it is activated
     And user close toolTip tapping on Understood
     When user tap on "TabBar.moreButton"
     And user tap on "TabBar.bntInsurance"
     Then an user who is on "InsuranceHome.txtTitle"
     When user tap on "InsuranceHome.bntNewInsurance"
     And user see label "InsuranceNewPolicyType.txtSubtitle"
     And user tap on "InsuranceNewPolicyType.btnNewPolicyAtm"
     And user tap on "InsuranceFistEntry.btnContinue"
     Then an user who is on "InsuranceSelectAddress.txtTitle"
     When user tap on "InsuranceSelectAddress.btnContinue"
     Then an user who is on "InsuranceSelectAddress.txtTitle"

@regression_green @regression
Scenario: BDSD-19342 - El usuario regresa a la pantalla para elegir el tipo de seguro a contratar
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
     And user tap on "InsuranceNewPolicyType.btnNewPolicyAtm"
     Then an user who is on "InsuranceATMFistEntry.txtPageTitle"
     When user tap on "InsuranceATMFistEntry.btnBack"
     Then an user who is on "InsuranceHome.txtTitle"
 
 @regression_green @regression
 Scenario: BDSD-19343 - El usuario ingresa a la seccion ayuda de Seguros ATM
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
     And user tap on "InsuranceNewPolicyType.btnNewPolicyAtm"
     Then an user who is on "InsuranceATMFistEntry.txtPageTitle"
     When user tap on "InsuranceATMFistEntry.btnHelp"
     Then user see label "HelpSection.textFrecuentlyAsq"