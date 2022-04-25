@regression_green @regression
Feature: BDSD-15929 Datos para la poliza

  Background:
    Given an user who is on "Welcome.registerButton"
    And change wiremock scenario "insuranceGetPolicies" to status "allTypes"

@regression_green @regression
  Scenario: BDSD-17212 - El usuario ingresa a la pantalla de "Datos de poliza" y visualiza sus elementos correctamente
    Given get login token with user email "hmateikabdsolqe@gmail.com"
    And an user who is on "Login.homeScreen"
    And enter passcode "192837"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    When user tap on "TabBar.moreButton"
    And user tap on "TabBar.bntInsurance"
    Then an user who is on "InsuranceHome.txtTitle"
    And user tap on "InsuranceHome.bntNewInsurance"
    When user tap on "InsuranceNewPolicyType.btnNewPolicyHome"
    And user tap on "InsuranceFistEntry.btnContinue"
    Then an user who is on "InsuranceSelectAddress.txtTitle"
    When user tap on "InsuranceSelectAddress.firstAddress"
    And user tap on "InsuranceSelectAddress.btnContinue"
    Then an user who is on "InsuranceViewOffers.txtTitle"
    When user tap on "InsuranceViewOffers.bntFirstPlanBuyInsurance"
    Then an user who is on "InsuranceDataAddress.txtTitle"
    And user see label "InsuranceDataAddress.boxStreet"
    And user see label "InsuranceDataAddress.boxNumber"
    And user see label "InsuranceDataAddress.chkBoxHouse"
    And user see label "InsuranceDataAddress.chkBoxApartment"
    When user tap on "InsuranceDataAddress.chkBoxApartment"
    Then an user who is on "InsuranceDataAddress.boxDpto"
    And user see label "InsuranceDataAddress.boxReference"
    When user swipe up
    And user see label "InsuranceDataAddress.boxPostalCode"
    Then user see label "InsuranceDataAddress.boxCountry"
    And user see label "InsuranceDataAddress.comboCity"
    And user see label "InsuranceDataAddress.boxPhone"
    And user see label "InsuranceDataAddress.boxPhoneCode"
     
  @regression_green @regression
  Scenario: BDSD-17213 - El usuario ingresa a la pantalla de "Datos de poliza" y con direcciones pre cargadas
     Given get login token with user email "pmallo@bdsol.com.ar"
     And an user who is on "Login.homeScreen"
     And enter passcode "192837"
     And skip biometry if it is activated
     And user close toolTip tapping on Understood
     When user tap on "TabBar.moreButton"
     And user tap on "TabBar.bntInsurance"
     Then an user who is on "InsuranceHome.txtTitle"
     And user tap on "InsuranceHome.bntNewInsurance"
     When user tap on "InsuranceNewPolicyType.btnNewPolicyHome"
     And user tap on "InsuranceFistEntry.btnContinue"
     Then an user who is on "InsuranceSelectAddress.txtTitle"
     When user tap on "InsuranceSelectAddress.firstAddress"
     And user tap on "InsuranceSelectAddress.btnContinue"
     Then an user who is on "InsuranceViewOffers.txtTitle"
     When user tap on "InsuranceViewOffers.bntFirstPlanBuyInsurance"
     Then an user who is on "InsuranceDataAddress.txtTitle"
     And an user who is on "InsuranceDataAddress.boxStreet"
     And user see text "Avda Gral Jose De San Martin" on element "InsuranceDataAddress.boxStreet" on position of arrangement 3
     And user see text "16" on element "InsuranceDataAddress.boxNumber" on position of arrangement 3
     And user see text "" on element "InsuranceDataAddress.boxReference" on position of arrangement 3
     And user see text "B2705CXP" on element "InsuranceDataAddress.boxPostalCode" on position of arrangement 3
     When user swipe up
     Then user see text "Buenos Aires" on element "InsuranceDataAddress.boxCountry" on position of arrangement 3
     And user see text "" on element "InsuranceDataAddress.comboCity" on position of arrangement 2
     And user see text "" on element "InsuranceDataAddress.boxPhone" on position of arrangement 3
     And user see text "" on element "InsuranceDataAddress.boxPhoneCode" on position of arrangement 3

  @regression_green @regression
  Scenario: BDSD-17214 - El usuario ingresa a la pantalla de "Datos de poliza" y sin direcciones pre cargadas
     Given get login token with user email "hmateikabdsolqe@gmail.com"
     And an user who is on "Login.homeScreen"
     And enter passcode "192837"
     And skip biometry if it is activated
     And user close toolTip tapping on Understood
     When user tap on "TabBar.moreButton"
     And user tap on "TabBar.bntInsurance"
     Then an user who is on "InsuranceHome.txtTitle"
     And user tap on "InsuranceHome.bntNewInsurance"
     When user tap on "InsuranceNewPolicyType.btnNewPolicyHome"
     And user tap on "InsuranceFistEntry.btnContinue"
     Then an user who is on "InsuranceSelectAddress.txtTitle"
     When user tap on "InsuranceSelectAddress.btnAddPostalCode"
     When user types "2705" on field "InsuranceAddAddress.boxAddress"
     And user tap on "InsuranceAddAddress.btnContinue"
     Then an user who is on "InsuranceViewOffers.txtTitle"
     When user tap on "InsuranceViewOffers.bntFirstPlanBuyInsurance"
     Then an user who is on "InsuranceDataAddress.txtTitle"
     And user see text "" on element "InsuranceDataAddress.boxStreet"
     And user see text "" on element "InsuranceDataAddress.boxNumber"
     And user see text "" on element "InsuranceDataAddress.boxReference"
     And user see text "2705" on element "InsuranceDataAddress.boxPostalCode"
     When user swipe up
     Then user see text "Buenos Aires" on element "InsuranceDataAddress.boxCountry"
     And user see text "" on element "InsuranceDataAddress.comboCity"
     And user see text "" on element "InsuranceDataAddress.boxPhone"
     And user see text "" on element "InsuranceDataAddress.boxPhoneCode"

  @regression_green @regression
  Scenario: BDSD-17215 - El usuario ingresa a la pantalla de "Datos de poliza" e intenta avanzar sin completar los datos
     Given get login token with user email "hmateikabdsolqe@gmail.com"
     And an user who is on "Login.homeScreen"
     And enter passcode "192837"
     And skip biometry if it is activated
     And user close toolTip tapping on Understood
     When user tap on "TabBar.moreButton"
     And user tap on "TabBar.bntInsurance"
     Then an user who is on "InsuranceHome.txtTitle"
     And user tap on "InsuranceHome.bntNewInsurance"
     When user tap on "InsuranceNewPolicyType.btnNewPolicyHome"
     And user tap on "InsuranceFistEntry.btnContinue"
     Then an user who is on "InsuranceSelectAddress.txtTitle"
     When user tap on "InsuranceSelectAddress.btnAddPostalCode"
     When user types "2705" on field "InsuranceAddAddress.boxAddress"
     And user tap on "InsuranceAddAddress.btnContinue"
     Then an user who is on "InsuranceViewOffers.txtTitle"
     When user tap on "InsuranceViewOffers.bntFirstPlanBuyInsurance"
     Then an user who is on "InsuranceDataAddress.txtTitle"
     When user tap on "InsuranceDataAddress.chkBoxApartment"
     And user tap on "InsuranceDataAddress.btnContinue"
     Then an user who is on "InsuranceDataAddress.txtCompleteDataError"
     And user see label "InsuranceDataAddress.btnAcept"
     When user tap on "InsuranceDataAddress.btnAcept"
     Then an user who is on "InsuranceDataAddress.boxStreetIncompletedError"
     And user see label "InsuranceDataAddress.boxNumberIncompletedError"
     And user see label "InsuranceDataAddress.boxDptoIncompletedError"
     When user swipe up
     Then user see label "InsuranceDataAddress.boxCityIncompletedError"
     And user see label "InsuranceDataAddress.boxPhoneIncompletedError"

  @regression_green @regression
  Scenario: BDSD-17216 - El usuario ingresa todos los datos y no se muestran los mensajes de campos vacios
    Given get login token with user email "hmateikabdsolqe@gmail.com"
     And an user who is on "Login.homeScreen"
     And enter passcode "192837"
     And skip biometry if it is activated
     And user close toolTip tapping on Understood
     When user tap on "TabBar.moreButton"
     And user tap on "TabBar.bntInsurance"
     Then an user who is on "InsuranceHome.txtTitle"
     And user tap on "InsuranceHome.bntNewInsurance"
     When user tap on "InsuranceNewPolicyType.btnNewPolicyHome"
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
     And set "1" on "InsuranceDataAddress.boxNumber"
     And set "1" on "InsuranceDataAddress.boxDpto"
     And user swipe up
     And select option "1" on city combobox
     And set "11" on "InsuranceDataAddress.boxPhoneCode"
     And set "63658458" on "InsuranceDataAddress.boxPhone"
     And user tap on "InsuranceDataAddress.btnContinue"
     Then user cant see "InsuranceDataAddress.txtCompleteDataError"

  @regression_green @regression
  Scenario: BDSD-17217 - Se comprueba que la cantidad de ciudades del servicio sea la misma que la que se muestra en la app
     Given get login token with user email "hmateikabdsolqe@gmail.com"
     And an user who is on "Login.homeScreen"
     And enter passcode "192837"
     And skip biometry if it is activated
     And user close toolTip tapping on Understood
     When user tap on "TabBar.moreButton"
     And user tap on "TabBar.bntInsurance"
     Then an user who is on "InsuranceHome.txtTitle"
     And user tap on "InsuranceHome.bntNewInsurance"
     When user tap on "InsuranceNewPolicyType.btnNewPolicyHome"
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
     And set "1" on "InsuranceDataAddress.boxNumber"
     And set "1" on "InsuranceDataAddress.boxDpto"
     And user swipe up
     Then check cities acount for postal code "2705"

  @regression_green @regression
  Scenario: BDSD-19099 - El usuario no puede confirmar los datos del inmueble ya que no ingreso el codigo de area 
    Given get login token with user email "hmateikabdsolqe@gmail.com"
    And an user who is on "Login.homeScreen"
    And enter passcode "192837"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    When user tap on "TabBar.moreButton"
    And user tap on "TabBar.bntInsurance"
    Then an user who is on "InsuranceHome.txtTitle"
    And user tap on "InsuranceHome.bntNewInsurance"
    When user tap on "InsuranceNewPolicyType.btnNewPolicyHome"
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
    And set "1" on "InsuranceDataAddress.boxNumber"
    And set "1" on "InsuranceDataAddress.boxDpto"
    And user swipe up
    And select option "1" on city combobox
    And set "63658458" on "InsuranceDataAddress.boxPhone"
    And user tap on "InsuranceDataAddress.btnContinue"
    Then user see label "InsuranceDataAddress.txtCompleteDataError"

  @regression_green @regression
  Scenario: BDSD-19100 - El usuario no puede confirmar los datos del inmueble ya que no ingreso el numero telefonico
    Given get login token with user email "hmateikabdsolqe@gmail.com"
    And an user who is on "Login.homeScreen"
    And enter passcode "192837"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    When user tap on "TabBar.moreButton"
    And user tap on "TabBar.bntInsurance"
    Then an user who is on "InsuranceHome.txtTitle"
    And user tap on "InsuranceHome.bntNewInsurance"
    When user tap on "InsuranceNewPolicyType.btnNewPolicyHome"
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
    And set "1" on "InsuranceDataAddress.boxNumber"
    And set "1" on "InsuranceDataAddress.boxDpto"
    And user swipe up
    And select option "1" on city combobox
    And set "11" on "InsuranceDataAddress.boxPhoneCode"
    And user tap on "InsuranceDataAddress.btnContinue"
    Then user see label "InsuranceDataAddress.txtCompleteDataError"

  @regression_green @regression
  Scenario: BDSD-19101 - El usuario ingresa mas de 8 digitos en su numero telefonico
    Given get login token with user email "hmateikabdsolqe@gmail.com"
    And an user who is on "Login.homeScreen"
    And enter passcode "192837"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    When user tap on "TabBar.moreButton"
    And user tap on "TabBar.bntInsurance"
    Then an user who is on "InsuranceHome.txtTitle"
    And user tap on "InsuranceHome.bntNewInsurance"
    When user tap on "InsuranceNewPolicyType.btnNewPolicyHome"
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
    And set "1" on "InsuranceDataAddress.boxNumber"
    And set "1" on "InsuranceDataAddress.boxDpto"
    And user swipe up
    And select option "1" on city combobox
    And set "11" on "InsuranceDataAddress.boxPhoneCode"
    And set "635658458" on "InsuranceDataAddress.boxPhone"
    And user tap on "InsuranceDataAddress.btnContinue"
    Then user see label "InsuranceDataAddress.txtCompleteDataError"
    When user tap on "InsuranceDataAddress.btnAcept"
    Then user see label "InsuranceDataAddress.txtErrorMore8CharacterPhone"

   @regression_green @regression
   Scenario: BDSD-19102 - El usuario ingresa mas de 4 digitos en el codigo de area
     Given get login token with user email "hmateikabdsolqe@gmail.com"
     And an user who is on "Login.homeScreen"
     And enter passcode "192837"
     And skip biometry if it is activated
     And user close toolTip tapping on Understood
     When user tap on "TabBar.moreButton"
     And user tap on "TabBar.bntInsurance"
     Then an user who is on "InsuranceHome.txtTitle"
     And user tap on "InsuranceHome.bntNewInsurance"
     When user tap on "InsuranceNewPolicyType.btnNewPolicyHome"
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
     And set "1" on "InsuranceDataAddress.boxNumber"
     And set "1" on "InsuranceDataAddress.boxDpto"
     And user swipe up
     And select option "1" on city combobox
     And set "11541" on "InsuranceDataAddress.boxPhoneCode"
     And set "65658458" on "InsuranceDataAddress.boxPhone"
     And user tap on "InsuranceDataAddress.btnContinue"
     Then user see label "InsuranceDataAddress.txtCompleteDataError"
     When user tap on "InsuranceDataAddress.btnAcept"
     Then user see label "InsuranceDataAddress.txtErrorMore4CharacterCodePhone"
 
  @regression_green @regression
  Scenario: BDSD-19103 - El usuario un numero de telefono invalido (todos numeros iguales)
     Given get login token with user email "hmateikabdsolqe@gmail.com"
     And an user who is on "Login.homeScreen"
     And enter passcode "192837"
     And skip biometry if it is activated
     And user close toolTip tapping on Understood
     When user tap on "TabBar.moreButton"
     And user tap on "TabBar.bntInsurance"
     Then an user who is on "InsuranceHome.txtTitle"
     And user tap on "InsuranceHome.bntNewInsurance"
     When user tap on "InsuranceNewPolicyType.btnNewPolicyHome"
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
     And set "1" on "InsuranceDataAddress.boxNumber"
     And set "1" on "InsuranceDataAddress.boxDpto"
     And user swipe up
     And select option "1" on city combobox
     And set "1111" on "InsuranceDataAddress.boxPhoneCode"
     And set "111111" on "InsuranceDataAddress.boxPhone"
     And user tap on "InsuranceDataAddress.btnContinue"
     And user swipe up
     Then user see label "InsuranceDataAddress.txtErrorLessInvalidNumberPhone"
   
  @regression_green @regression
   Scenario: BDSD-19104 - El usuario un numero de telefono invalido (numeros consecutivos)
     Given get login token with user email "hmateikabdsolqe@gmail.com"
     And an user who is on "Login.homeScreen"
     And enter passcode "192837"
     And skip biometry if it is activated
     And user close toolTip tapping on Understood
     When user tap on "TabBar.moreButton"
     And user tap on "TabBar.bntInsurance"
     Then an user who is on "InsuranceHome.txtTitle"
     And user tap on "InsuranceHome.bntNewInsurance"
     When user tap on "InsuranceNewPolicyType.btnNewPolicyHome"
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
     And set "1" on "InsuranceDataAddress.boxNumber"
     And set "1" on "InsuranceDataAddress.boxDpto"
     And user swipe up
     And select option "1" on city combobox
     And set "11" on "InsuranceDataAddress.boxPhoneCode"
     And set "12345678" on "InsuranceDataAddress.boxPhone"
     And user tap on "InsuranceDataAddress.btnContinue"
     And user swipe up
     Then user see label "InsuranceDataAddress.txtErrorLessInvalidNumberPhone"

   @regression_green @regression
   Scenario: BDSD-19105 - El usuario ingresa menos de 2 digitos en el codigo de area
     Given get login token with user email "hmateikabdsolqe@gmail.com"
     And an user who is on "Login.homeScreen"
     And enter passcode "192837"
     And skip biometry if it is activated
     And user close toolTip tapping on Understood
     When user tap on "TabBar.moreButton"
     And user tap on "TabBar.bntInsurance"
     Then an user who is on "InsuranceHome.txtTitle"
     And user tap on "InsuranceHome.bntNewInsurance"
     When user tap on "InsuranceNewPolicyType.btnNewPolicyHome"
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
     And set "1" on "InsuranceDataAddress.boxNumber"
     And set "1" on "InsuranceDataAddress.boxDpto"
     And user swipe up
     And select option "1" on city combobox
     And set "1" on "InsuranceDataAddress.boxPhoneCode"
     And set "19532286" on "InsuranceDataAddress.boxPhone"
     And user tap on "InsuranceDataAddress.btnContinue"
     Then user see label "InsuranceDataAddress.txtCompleteDataError"
     When user tap on "InsuranceDataAddress.btnAcept"
     And user swipe up
     Then user see label "InsuranceDataAddress.txtErrorLess2CharacterCodePhone"
   
   @regression_green @regression
   Scenario: BDSD-19106 - El usuario ingresa menos de 6 digitos en su numero telefonico
     Given get login token with user email "hmateikabdsolqe@gmail.com"
     And an user who is on "Login.homeScreen"
     And enter passcode "192837"
     And skip biometry if it is activated
     And user close toolTip tapping on Understood
     When user tap on "TabBar.moreButton"
     And user tap on "TabBar.bntInsurance"
     Then an user who is on "InsuranceHome.txtTitle"
     And user tap on "InsuranceHome.bntNewInsurance"
     When user tap on "InsuranceNewPolicyType.btnNewPolicyHome"
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
     And set "1" on "InsuranceDataAddress.boxNumber"
     And set "1" on "InsuranceDataAddress.boxDpto"
     And user swipe up
     And select option "1" on city combobox
     And set "2515" on "InsuranceDataAddress.boxPhoneCode"
     And set "55214" on "InsuranceDataAddress.boxPhone"
     And user tap on "InsuranceDataAddress.btnContinue"
     Then user see label "InsuranceDataAddress.txtCompleteDataError"
     When user tap on "InsuranceDataAddress.btnAcept"
     Then user see label "InsuranceDataAddress.txtErrorLess6CharacterPhone"
