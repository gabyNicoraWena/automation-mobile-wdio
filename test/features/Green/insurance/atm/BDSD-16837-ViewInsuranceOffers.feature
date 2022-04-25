@regression_green @regression
Feature: BDSD-16839 - ATM Visializacion de ofertas

  Background:
     Given an user who is on "Welcome.registerButton"
     And get login token with user email "pmallo@bdsol.com.ar"
     And change wiremock scenario "insuranceGetPolicies" to status "allTypes"
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

  @regression_green @regression
  Scenario: BDSD-19447 - El usuario ingresa al cotizador de Seguros de ATM y visualiza correctamente todos los elementos
     When user tap on "InsuranceSelectAddress.btnAddPostalCode"
     And user types "2705" on field "InsuranceAddAddress.boxAddress"
     And user tap on "InsuranceSelectAddress.btnContinue"
     Then an user who is on "InsuranceATMViewOffers.txtTitle"
     And user see label "InsuranceViewOffers.bntFirstPlanSeeCoverage"
     And user see label "InsuranceViewOffers.bntFirstPlanBuyInsurance"
     And user see label "InsuranceATMViewOffers.txtPlanValueTitle"
     And user see label "InsuranceATMViewOffers.txtCoverageValue"   
     And user see label "InsuranceATMViewOffers.txtPlanValue"   

  @regression_green @regression @este
  Scenario: BDSD-19448 - El se ingresa a la seccion de cotizar y se comprueba los datos que muestra la app
     When user tap on "InsuranceSelectAddress.btnAddPostalCode"
     And user types "2705" on field "InsuranceAddAddress.boxAddress"
     And user tap on "InsuranceSelectAddress.btnContinue"
     Then an user who is on "InsuranceATMViewOffers.txtTitle"
     And check user data into atm view offers screen by zipcode "2705"

  @regression_green @regression
  Scenario: BDSD-19449 - El usuario ingresa a la seccion de cotizar y entra en la ayuda
     When user tap on "InsuranceSelectAddress.btnAddPostalCode"
     And user types "2705" on field "InsuranceAddAddress.boxAddress"
     And user tap on "InsuranceSelectAddress.btnContinue"
     Then an user who is on "InsuranceATMViewOffers.txtTitle"
     When user tap on "HelpSection.help"
     Then user see label "HelpSection.btnConsumerDefense"

  @regression_green @regression
  Scenario: BDSD-19450 - El usuario ingresa a la seccion de cotizar y luego regresa a la pantalla de seleccion de domicilios pre-cargados
     When user tap on "InsuranceSelectAddress.firstAddress"
     And user tap on "InsuranceSelectAddress.btnContinue"
     Then an user who is on "InsuranceATMViewOffers.txtTitle"
     When user tap on "InsuranceViewOffers.bntBackToSelectAddress"
     Then an user who is on "InsuranceSelectAddress.firstAddress"

  @regression_green @regression
  Scenario: BDSD-19451 - El usuario ingresa a la seccion de cotizar y luego regresa a la pantalla de ingreso de CP a cotizar
     When user tap on "InsuranceSelectAddress.btnAddPostalCode" 
     And user types "2705" on field "InsuranceAddAddress.boxAddress"
     And user tap on "InsuranceSelectAddress.btnContinue"
     Then an user who is on "InsuranceATMViewOffers.txtTitle"
     When user tap on "InsuranceViewOffers.bntBackToSelectAddress"
     Then an user who is on "InsuranceAddAddress.boxAddress"

  @regression_green @regression
  Scenario: BDSD-19452 - El usuario quiere ingresar a la pantalla de cotización pero el MS no responde
     When user tap on "InsuranceSelectAddress.firstAddress"
     When user set BS or local network conditions to "no-network"
     And user tap on "InsuranceSelectAddress.btnContinue"
     Then an user who is on "InsuranceViewOffersErrorPage.txtTitle"
     And an user who is on "InsuranceViewOffersErrorPage.txtText"
     And an user who is on "InsuranceViewOffersErrorPage.bntRetry"
     When user set BS or local network conditions to "4g-lte-good"
     And user tap on "InsuranceViewOffersErrorPage.bntRetry"
     Then an user who is on "InsuranceATMViewOffers.txtTitle"
     
     