Feature: Se comprueba todo el flujo principal del producto Seguros

  Background:
    Given an user who is on "Welcome.registerButton"

  Scenario: El usuario genera una nueva poliza y la misma se visualiza en el menu de seguros
     Given get login token with user email "hmateikabdsolqe@gmail.com"
     And an user who is on "Login.homeScreen"
     And change wiremock scenario "insuranceGetPolicies" to status "4Policies"
     And enter passcode "192837"
     And skip biometry if it is activated
     And user close toolTip tapping on Understood  
     When user tap on "TabBar.moreButton"
     And user tap on "TabBar.bntInsurance"
     Then an user who is on "InsuranceHome.txtTitle"
     When save current policies on webdriver.io session
     And user tap on "InsuranceHome.bntNewInsurance"
     And user tap on "InsuranceFistEntry.btnContinue"
     Then an user who is on "InsuranceSelectAddress.txtTitle"
     When user tap on "InsuranceSelectAddress.btnAddPostalCode"
     When user types "2705" on field "InsuranceAddAddress.boxAddress"
     And user tap on "InsuranceAddAddress.btnContinue"
     Then an user who is on "InsuranceViewOffers.txtTitle"
     When user tap on "InsuranceViewOffers.bntFirstPlanBuyInsurance"
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
     Then an user who is on "InsuranceConfirmPolicy.txtTitle"
     When user tap on "InsuranceConfirmPolicy.chkTermsAndConditions"
     When change wiremock scenario "insuranceGetPolicies" to status "5Policies"
     And user tap on "InsuranceConfirmPolicy.btnContinue"
     Then user see label "InsuranceNewPolicySuccess.txtTitle"
     When user tap on "InsuranceNewPolicySuccess.bntFinish"
     Then an user who is on "InsuranceHome.txtTitle"
     And exist a new policy into Insurance Home policies list

  Scenario: El usuario genera una nueva poliza y la misma se visualiza en el menu de seguros
     Given get login token with user email "hmateikabdsolqe@gmail.com"
     And an user who is on "Login.homeScreen"
     And enter passcode "192837"
     When change wiremock scenario "insuranceGetPolicies" to status "5Policies"
     And skip biometry if it is activated
     And user close toolTip tapping on Understood
     When user tap on "TabBar.moreButton"
     And user tap on "TabBar.bntInsurance"
     Then an user who is on "InsuranceHome.txtTitle"
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
     When change wiremock scenario "insuranceGetPolicies" to status "4Policies"
     And user tap on "InsuranceUnsubscribeModal.btnUnsubscribe"
     Then user see label "InsuranceUnsubscribeSuccessfully.txtTitle"
     And user see label "InsuranceUnsubscribeSuccessfully.txtText"
     And user see label "InsuranceUnsubscribeSuccessfully.bntFinish"
     And user tap on "InsuranceUnsubscribeSuccessfully.bntFinish"
     Then an user who is on "InsuranceHome.txtTitle"
     And the policy unsubscribe not exist into policies list
