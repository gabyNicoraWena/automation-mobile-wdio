@regression_green @regression
Feature: BDSD-15640 Datos para obtener una cotización

  Background:
    Given an user who is on "Welcome.registerButton"
    And change wiremock scenario "insuranceGetPolicies" to status "allTypes"

  @regression_green @regression
  Scenario: BDSD-16067 - El usuario ingresa a la seccion de Seguros
     Given get login token with user email "bdsgreenqe@gmail.com"
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
     And user see label "InsuranceFistEntry.btnContinue"

  @regression_green @regression
  Scenario: BDSD-16068 - El usuario ingresa a la seccion donde elige su domicilio
     Given get login token with user email "hmateikabdsolqe@gmail.com"
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
     And user see label "InsuranceSelectAddress.btnContinue"
   
  @regression_green @regression
  Scenario: BDSD-16073 - El usuario ingresa a la seccion donde elige su domicilio pero no tiene ninguno pre-cargado
     Given get login token with user email "bdsnoaddress@gmail.com"
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
     Then user see label "InsuranceAddAddress.txtTitle"
     And user see label "InsuranceAddAddress.boxAddress"
     And user see label "InsuranceAddAddress.btnContinue"

  @regression_green @regression
  Scenario: BDSD-16075 - El usuario ingresa que no tiene ninguno domicilio pre-cargado ingresa un CP invalido
     Given get login token with user email "bdsnoaddress@gmail.com"
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
     Then user see label "InsuranceAddAddress.txtTitle"
     And user see label "InsuranceAddAddress.boxAddress"
     When user set "123456" on field "InsuranceAddAddress.boxAddress"
     And user tap on "InsuranceAddAddress.btnContinue"
     Then user see label "InsuranceAddAddress.txtErrorZipcodeInvalid"

  @regression_green @regression
  Scenario: BDSD-16069 - El usuario ingresa a la seccion donde ingresa un nuevo domicilio
     Given get login token with user email "hmateikabdsolqe@gmail.com"
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
     And user tap on "InsuranceSelectAddress.btnAddPostalCode"
     Then user see label "InsuranceAddAddress.boxAddress"
     And user see label "InsuranceAddAddress.btnContinue"

  @regression_green @regression
  Scenario: BDSD-16077 - El usuario ingresa a la seccion donde ingresa un nuevo domicilio utilizando un CP invalido
     Given get login token with user email "hmateikabdsolqe@gmail.com"
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
     And user tap on "InsuranceSelectAddress.btnAddPostalCode"
     Then user set "123456" on field "InsuranceAddAddress.boxAddress"
     When user tap on "InsuranceAddAddress.btnContinue"
     Then user see label "InsuranceAddAddress.txtErrorZipcodeInvalid"

  @regression_green @regression
  Scenario: BDSD-16081 - El usuario ingresa a la seccion donde elige su domicilio e intenta continuar sin seleccionar uno
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
     When user tap on "InsuranceSelectAddress.btnContinue"
      Then an user who is on "InsuranceSelectAddress.txtTitle"
     