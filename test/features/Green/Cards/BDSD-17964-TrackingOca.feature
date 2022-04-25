@regression_green @regression
Feature: BDSD-17964 - Ver donde está la Tarjeta
   
  Background:
    Given an user who is on "Welcome.registerButton"
    And get login token with user email "hmateikabdsolqe@gmail.com"
    And an user who is on "Login.homeScreen"
    And enter passcode "192837"

  @regression_green @regression
  Scenario: Se muestra correctamente los elementos de la pantalla de tracking
    When change wiremock scenario "ocaTrack" to status "status1"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    And an user who is on "TabBar.cardsButton"
    And user tap on "TabBar.cardsButton"
    And user tap on "CardListScreen.physicalCardSecondTab"
    And user tap on "CardListScreen.bntTracking"
    Then an user who is on "CardsTracking.txtTitle"
    And user see label "CardsTracking.bntCardActive"
    And user see label "CardsTracking.bntBack"
    And user see label "CardsTracking.bntHelp"

  @regression_green @regression
  Scenario: El usuario tapea en el boton "Activar"
    When change wiremock scenario "ocaTrack" to status "status1"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    And an user who is on "TabBar.cardsButton"
    And user tap on "TabBar.cardsButton"
    And user tap on "CardListScreen.physicalCardSecondTab"
    And user tap on "CardListScreen.bntTracking"
    Then an user who is on "CardsTracking.txtTitle"
    And user see label "CardsTracking.bntCardActive"
    When user tap on "CardsTracking.bntCardActive"
    Then user see label "CardsTracking.txtActiveCardTitle"

  @regression_green @regression
  Scenario: El usuario tapea en el boton "Volver"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    And an user who is on "TabBar.cardsButton"
    And user tap on "TabBar.cardsButton"
    And user tap on "CardListScreen.physicalCardSecondTab"
    And user tap on "CardListScreen.bntTracking"
    Then an user who is on "CardsTracking.txtTitle"
    When user tap on "CardsTracking.bntBack"
    Then user see label "CardListScreen.bntTracking"

  @regression_green @regression
  Scenario: El usuario tapea el boton "Contactanos"
    When change wiremock scenario "ocaTrack" to status "status14"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    And an user who is on "TabBar.cardsButton"
    And user tap on "TabBar.cardsButton"
    And user tap on "CardListScreen.physicalCardSecondTab"
    And user tap on "CardListScreen.bntTracking"
    Then an user who is on "CardsTracking.txtTitle"
    When user tap on "CardsTracking.bntContactUs"
    Then user see label "Chat.screenTitle"

  @regression_green @regression
  Scenario: La pieza se encuentra en el estado 1 de Oca
    When change wiremock scenario "ocaTrack" to status "status1"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    And an user who is on "TabBar.cardsButton"
    And user tap on "TabBar.cardsButton"
    And user tap on "CardListScreen.physicalCardSecondTab"
    And user tap on "CardListScreen.bntTracking"
    Then an user who is on "CardsTracking.txtTitle"
    And user see label "CardsTracking.txtTrackingStatus1"
    And user see label "CardsTracking.txtTrackingStatus1Desc"
    And user cant see "CardsTracking.txtTrackingStatus2Desc"
    And user see label "CardsTracking.bntCardActive"
    And user cant see "CardsTracking.bntContactUs"

  @regression_green @regression
  Scenario: La pieza se encuentra en el estado 3 de Oca
    When change wiremock scenario "ocaTrack" to status "status3"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    And an user who is on "TabBar.cardsButton"
    And user tap on "TabBar.cardsButton"
    And user tap on "CardListScreen.physicalCardSecondTab"
    And user tap on "CardListScreen.bntTracking"
    Then an user who is on "CardsTracking.txtTitle"
    And user see label "CardsTracking.txtTrackingStatus1"
    And user see label "CardsTracking.txtTrackingStatus1Desc"
    And user cant see "CardsTracking.txtTrackingStatus2Desc"
    And user see label "CardsTracking.bntCardActive"
    And user cant see "CardsTracking.bntContactUs"

  @regression_green @regression
  Scenario: La pieza se encuentra en el estado 4 de Oca
    When change wiremock scenario "ocaTrack" to status "status4"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    And an user who is on "TabBar.cardsButton"
    And user tap on "TabBar.cardsButton"
    And user tap on "CardListScreen.physicalCardSecondTab"
    And user tap on "CardListScreen.bntTracking"
    Then an user who is on "CardsTracking.txtTitle"
    And user see label "CardsTracking.txtTrackingStatus1"
    And user see label "CardsTracking.txtTrackingStatus1Desc"
    And user see label "CardsTracking.txtTrackingStatus2"
    And user see label "CardsTracking.txtTrackingStatus2Desc"
    And user cant see "CardsTracking.txtTrackingStatus4Desc"
    And user see label "CardsTracking.bntCardActive"
    And user cant see "CardsTracking.bntContactUs"

  @regression_green @regression
  Scenario: La pieza se encuentra en el estado 5 de Oca
    When change wiremock scenario "ocaTrack" to status "status5"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    And an user who is on "TabBar.cardsButton"
    And user tap on "TabBar.cardsButton"
    And user tap on "CardListScreen.physicalCardSecondTab"
    And user tap on "CardListScreen.bntTracking"
    Then an user who is on "CardsTracking.txtTitle"
    And user see label "CardsTracking.txtTrackingStatus1"
    And user see label "CardsTracking.txtTrackingStatus1Desc"
    And user see label "CardsTracking.txtTrackingStatus2"
    And user see label "CardsTracking.txtTrackingStatus2Desc"
    And user cant see "CardsTracking.txtTrackingStatus4Desc"
    And user see label "CardsTracking.bntCardActive"
    And user cant see "CardsTracking.bntContactUs"

  @regression_green @regression
  Scenario: La pieza se encuentra en el estado 6 de Oca
    When change wiremock scenario "ocaTrack" to status "status6"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    And an user who is on "TabBar.cardsButton"
    And user tap on "TabBar.cardsButton"
    And user tap on "CardListScreen.physicalCardSecondTab"
    And user tap on "CardListScreen.bntTracking"
    Then an user who is on "CardsTracking.txtTitle"
    And user see label "CardsTracking.txtTrackingStatus1"
    And user see label "CardsTracking.txtTrackingStatus1Desc"
    And user see label "CardsTracking.txtTrackingStatus2"
    And user see label "CardsTracking.txtTrackingStatus2Desc"
    And user cant see "CardsTracking.txtTrackingStatus4Desc"
    And user see label "CardsTracking.bntCardActive"
    And user cant see "CardsTracking.bntContactUs"

  @regression_green @regression
  Scenario: La pieza se encuentra en el estado 7 de Oca
    When change wiremock scenario "ocaTrack" to status "status7"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    And an user who is on "TabBar.cardsButton"
    And user tap on "TabBar.cardsButton"
    And user tap on "CardListScreen.physicalCardSecondTab"
    And user tap on "CardListScreen.bntTracking"
    Then an user who is on "CardsTracking.txtTitle"
    And user see label "CardsTracking.txtTrackingStatus1"
    And user see label "CardsTracking.txtTrackingStatus1Desc"
    And user see label "CardsTracking.txtTrackingStatus2"
    And user see label "CardsTracking.txtTrackingStatus2Desc"
    And user cant see "CardsTracking.txtTrackingStatus4Desc"
    And user see label "CardsTracking.bntCardActive"
    And user cant see "CardsTracking.bntContactUs"

  @regression_green @regression
  Scenario: La pieza se encuentra en el estado 8 de Oca
    When change wiremock scenario "ocaTrack" to status "status8"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    And an user who is on "TabBar.cardsButton"
    And user tap on "TabBar.cardsButton"
    And user tap on "CardListScreen.physicalCardSecondTab"
    And user tap on "CardListScreen.bntTracking"
    Then an user who is on "CardsTracking.txtTitle"
    And user see label "CardsTracking.txtTrackingStatus1"
    And user see label "CardsTracking.txtTrackingStatus1Desc"
    And user see label "CardsTracking.txtTrackingStatus2"
    And user see label "CardsTracking.txtTrackingStatus2Desc"
    And user see label "CardsTracking.txtTrackingStatus3"
    And user see label "CardsTracking.txtTrackingStatus3Desc"
    And user cant see "CardsTracking.txtTrackingStatus4Desc"
    And user see label "CardsTracking.bntCardActive"
    And user cant see "CardsTracking.bntContactUs"

  @regression_green @regression
  Scenario: La pieza se encuentra en el estado 9 de Oca
    When change wiremock scenario "ocaTrack" to status "status9"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    And an user who is on "TabBar.cardsButton"
    And user tap on "TabBar.cardsButton"
    And user tap on "CardListScreen.physicalCardSecondTab"
    And user tap on "CardListScreen.bntTracking"
    Then an user who is on "CardsTracking.txtTitle"
    And user see label "CardsTracking.txtTrackingStatus1"
    And user see label "CardsTracking.txtTrackingStatus1Desc"
    And user see label "CardsTracking.txtTrackingStatus2"
    And user see label "CardsTracking.txtTrackingStatus2Desc"
    And user see label "CardsTracking.txtTrackingStatus4"
    And user see label "CardsTracking.txtTrackingStatus4Desc"
    And user see label "CardsTracking.bntCardActive"
    And user cant see "CardsTracking.bntContactUs"
  
  @regression_green @regression
  Scenario: La pieza se encuentra en el estado 10 de Oca
    When change wiremock scenario "ocaTrack" to status "status10"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    And an user who is on "TabBar.cardsButton"
    And user tap on "TabBar.cardsButton"
    And user tap on "CardListScreen.physicalCardSecondTab"
    And user tap on "CardListScreen.bntTracking"
    Then an user who is on "CardsTracking.txtTitle"
    And user see label "CardsTracking.txtTrackingStatus1"
    And user see label "CardsTracking.txtTrackingStatus1Desc"
    And user see label "CardsTracking.txtTrackingStatus2"
    And user see label "CardsTracking.txtTrackingStatus2Desc"
    And user see label "CardsTracking.txtTrackingStatus3"
    And user see label "CardsTracking.txtTrackingStatus3Desc"
    And user cant see "CardsTracking.txtTrackingStatus4Desc"
    And user see label "CardsTracking.bntCardActive"
    And user cant see "CardsTracking.bntContactUs"
    
  @regression_green @regression
  Scenario: La pieza se encuentra en el estado 11 de Oca
    When change wiremock scenario "ocaTrack" to status "status11"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    And an user who is on "TabBar.cardsButton"
    And user tap on "TabBar.cardsButton"
    And user tap on "CardListScreen.physicalCardSecondTab"
    And user tap on "CardListScreen.bntTracking"
    Then an user who is on "CardsTracking.txtTitle"
    And user see label "CardsTracking.txtTrackingStatus1"
    And user see label "CardsTracking.txtTrackingStatus1Desc"
    And user see label "CardsTracking.txtTrackingStatus2"
    And user see label "CardsTracking.txtTrackingStatus2Desc"
    And user see label "CardsTracking.txtTrackingStatus3"
    And user see label "CardsTracking.txtTrackingStatus3Desc"
    And user see label "CardsTracking.txtTrackingStatus6"
    And user see label "CardsTracking.txtTrackingStatus6Desc"
    And user cant see "CardsTracking.txtTrackingStatus4Desc"
    And user see label "CardsTracking.bntCardActive"
    And user cant see "CardsTracking.bntContactUs"
@regression_green @regression
Scenario: La pieza se encuentra en el estado 12 de Oca
    When change wiremock scenario "ocaTrack" to status "status12"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    And an user who is on "TabBar.cardsButton"
    And user tap on "TabBar.cardsButton"
    And user tap on "CardListScreen.physicalCardSecondTab"
    And user tap on "CardListScreen.bntTracking"
    Then an user who is on "CardsTracking.txtTitle"
    And user see label "CardsTracking.txtTrackingStatus1"
    And user see label "CardsTracking.txtTrackingStatus1Desc"
    And user see label "CardsTracking.txtTrackingStatus2"
    And user see label "CardsTracking.txtTrackingStatus2Desc"
    And user see label "CardsTracking.txtTrackingStatus3"
    And user see label "CardsTracking.txtTrackingStatus3Desc"
    And user see label "CardsTracking.txtTrackingStatus5"
    And user see label "CardsTracking.txtTrackingStatus5Desc"
    And user cant see "CardsTracking.txtTrackingStatus4"
    And user see label "CardsTracking.bntContactUs"
    And user cant see "CardsTracking.bntCardActive"

  @regression_green @regression
  Scenario: La pieza se encuentra en el estado 13 de Oca
    When change wiremock scenario "ocaTrack" to status "status13"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    And an user who is on "TabBar.cardsButton"
    And user tap on "TabBar.cardsButton"
    And user tap on "CardListScreen.physicalCardSecondTab"
    And user tap on "CardListScreen.bntTracking"
    Then an user who is on "CardsTracking.txtTitle"
    And user see label "CardsTracking.txtTrackingStatus1"
    And user see label "CardsTracking.txtTrackingStatus1Desc"
    And user see label "CardsTracking.txtTrackingStatus2"
    And user see label "CardsTracking.txtTrackingStatus2Desc"
    And user see label "CardsTracking.txtTrackingStatus3"
    And user see label "CardsTracking.txtTrackingStatus3Desc"
    And user cant see "CardsTracking.txtTrackingStatus4Desc"
    And user see label "CardsTracking.bntCardActive"
    And user cant see "CardsTracking.bntContactUs"

  @regression_green @regression
  Scenario: La pieza se encuentra en el estado 14 de Oca
    When change wiremock scenario "ocaTrack" to status "status14"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    And an user who is on "TabBar.cardsButton"
    And user tap on "TabBar.cardsButton"
    And user tap on "CardListScreen.physicalCardSecondTab"
    And user tap on "CardListScreen.bntTracking"
    Then an user who is on "CardsTracking.txtTitle"
    And user see label "CardsTracking.txtTrackingStatus1"
    And user see label "CardsTracking.txtTrackingStatus1Desc"
    And user see label "CardsTracking.txtTrackingStatus2"
    And user see label "CardsTracking.txtTrackingStatus2Desc"
    And user see label "CardsTracking.txtTrackingStatus3"
    And user see label "CardsTracking.txtTrackingStatus3Desc"
    And user see label "CardsTracking.txtTrackingStatus5"
    And user see label "CardsTracking.txtTrackingStatus5Desc"
    And user cant see "CardsTracking.txtTrackingStatus4"
    And user see label "CardsTracking.bntContactUs"
    And user cant see "CardsTracking.bntCardActive"