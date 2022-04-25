@regression_green @regression
Feature: BDSD-16838 - ATM Terminos y condiciones

  Background:
    Given an user who is on "Welcome.registerButton"

  @regression_green @regression
  Scenario: BDSD-19423 - El usuario ve los terminos y condiciones de ATM
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
     And user tap on "InsuranceATMConfirmPolicy.linkPolicyConditions"
     Then user see label "InsuranceATMTermAndConditions.txtTitle"
     And user see label "InsuranceATMTermAndConditions.btnShare"
     And user see label "InsuranceATMTermAndConditions.btnBack"

   @skip() @OCRNotWorker
   Scenario: BDSD-19424 - Se carga correctamente el PDF con los terminos y condiciones
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
     And user tap on "InsuranceATMConfirmPolicy.linkPolicyConditions"
     Then user see label "InsuranceATMTermAndConditions.txtTitle"
     And user see text OCR "Robo"
  
   @regression_green @regression
   Scenario: BDSD-19425 - El usuario comparte los terminos y condiciones
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
     And user tap on "InsuranceATMConfirmPolicy.linkPolicyConditions"
     Then user see label "InsuranceATMTermAndConditions.txtTitle"
     When user tap on "InsuranceATMTermAndConditions.btnShare"
     Then user see label "InsuranceATMTermAndConditions.txtShareMenu"

   @regression_green @regression
   Scenario: BDSD-19426 - El usuario ve los terminos y condiciones, luego vuelve a la pantalla de confirmacion
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
     And user tap on "InsuranceATMConfirmPolicy.linkPolicyConditions"
     Then user see label "InsuranceATMTermAndConditions.txtTitle"
     When user tap on "InsuranceATMTermAndConditions.btnBack"
     Then user see label "InsuranceATMConfirmPolicy.linkPolicyConditions"
  