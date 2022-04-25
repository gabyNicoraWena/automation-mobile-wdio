@skip()
Feature: Rate app modal

  Background:
    Given an user who is on "Welcome.registerButton"
    And get login token with user email "hmateikabdsolqe@gmail.com"
    Given an user who is on "Login.homeScreen"
    When enter passcode "192837"
    Given skip biometry if it is activated
    Given an user who is on "TabBar.transferButton"
    When user tap on "TabBar.transferButton"
    And user tap on "ToolTip.dismissButton"
    And user tap on "ModalOwnership.buttonMore"
    And user tap on "ModalOwnership.modaltransferButton"
    And set "0170099220000067527898" on "TransferHome.inputCbuOrAlias"
    And user tap on "TransferHome.buttonCbuNext"
    And user see text "BBVA FRANCES"
    And user tap on "TransferHome.transfersAccountInfoModalNext"
    Then user set "1" on field "TransferHome.amountTransfer"
    Then user tap on "TransferHome.buttonAmountRequestNext"
    And user see text "0170099220000067527898"
    And user tap on "TransferHome.confirmationTransfers"
    And user tap on "TransferHome.buttonTransfersSuccess"
    And user tap on "ModalOwnership.buttonMore"
    And user tap on "ModalOwnership.modaltransferButton"
    And set "0170099220000067527898" on "TransferHome.inputCbuOrAlias"
    And user tap on "TransferHome.buttonCbuNext"
    And user see text "BBVA FRANCES"
    And user tap on "TransferHome.transfersAccountInfoModalNext"
    Then user set "1" on field "TransferHome.amountTransfer"
    Then user tap on "TransferHome.buttonAmountRequestNext"
    And user see text "0170099220000067527898"
    And user tap on "TransferHome.confirmationTransfers"
    And user tap on "TransferHome.buttonTransfersSuccess"
    And user tap on "ModalOwnership.buttonMore"
    And user tap on "ModalOwnership.modaltransferButton"
    And set "0170099220000067527898" on "TransferHome.inputCbuOrAlias"
    And user tap on "TransferHome.buttonCbuNext"
    And user see text "BBVA FRANCES"
    And user tap on "TransferHome.transfersAccountInfoModalNext"
    Then user set "1" on field "TransferHome.amountTransfer"
    Then user tap on "TransferHome.buttonAmountRequestNext"
    And user see text "0170099220000067527898"
    And user tap on "TransferHome.confirmationTransfers"
    And user tap on "TransferHome.buttonTransfersSuccess"
    Then an user who is on "rateAppModal.btnIgnore"

@regression_green @regression
  Scenario: Se muestra modal de valoracion de store y se realiza dismiss en "como fue tu experiencia"
  Given an user who is on "rateAppModal.btnExcellent"
  When user see text "¿Cómo fue tu experiencia con Banco del Sol?"
  And user tap on "rateAppModal.btnIgnore"
  Then user is on "TransferHome.tabAgenda"
  
  @regression_green @regression
  Scenario: Se muestra modal y se realiza dismiss en modal "Muchas gracias, nos recomendarias?"
  Given an user who is on "rateAppModal.btnExcellent"
  When user see text "¿Cómo fue tu experiencia con Banco del Sol?"
  And user tap on "rateAppModal.btnExcellent"
  Then user is on "rateAppModal.sendReview"
  When user see text "¡Muchas gracias! ¿Nos recomendarías?"
  And user see text "Dejanos tu reseña para que otros puedan disfrutar de Banco del Sol."
  And user tap on "rateAppModal.btnCancelReview"
  Then user is on "TransferHome.tabAgenda"

@regression_green @regression
 Scenario: Se muestra modal y se realiza dismiss en modal "¿Nos ayudarias a mejorar?"
  Given an user who is on "rateAppModal.btnExcellent"
  When user see text "¿Cómo fue tu experiencia con Banco del Sol?"
  And user tap on "rateAppModal.btnGood"
  Then user is on "rateAppModal.leaveSuggestion"
  And user see text "¿Nos ayudarías a mejorar?"
  And user see text "Dejanos tu sugerencia para saber cómo podemos mejorar tu experiencia."
  And user tap on "rateAppModal.btnCancelSuggestion"
  Then user is on "TransferHome.tabAgenda"

@regression_green @regression
  Scenario: Se muestra modal de valoracion y se vota Mala - Dejar sugerencia SI
  Given an user who is on "rateAppModal.btnExcellent"
  When user see text "¿Cómo fue tu experiencia con Banco del Sol?"
  And user tap on "rateAppModal.btnBad"
  Then user is on "rateAppModal.leaveSuggestion"
  When user tap on "rateAppModal.leaveSuggestion"
  And user types "Sugerencias" on field "Suggestions.textField"
  And user tap on "Suggestions.btnSend"
  When user see label "Suggestions.msgSuccess"
  And user tap on "Suggestions.btnFinish"
  Then user is on "TransferHome.tabAgenda"

@regression_green @regression
  Scenario: Se muestra modal de valoracion de store y se vota Mala - Dejar sugerencia SI y vuelvo hacia atras
  Given an user who is on "rateAppModal.btnExcellent"
  When user see text "¿Cómo fue tu experiencia con Banco del Sol?"
  And user tap on "rateAppModal.btnBad"
  Then user is on "rateAppModal.leaveSuggestion"
  When user tap on "rateAppModal.leaveSuggestion"
  And user tap on "TopBar.btnNavigateUp"
  Then user is on "TransferHome.tabAgenda"

@regression_green @regression
  Scenario: Se muestra modal de valoracion y se vota Mala - Dejar sugerencia NO
  Given an user who is on "rateAppModal.btnExcellent"
  When user see text "¿Cómo fue tu experiencia con Banco del Sol?"
  And user tap on "rateAppModal.btnBad"
  And user see text "¿Nos ayudarías a mejorar?"
  And user see text "Dejanos tu sugerencia para saber cómo podemos mejorar tu experiencia."
  Then user is on "rateAppModal.leaveSuggestion"
  When user tap on "rateAppModal.btnCancelSuggestion"
  Then user is on "TransferHome.tabAgenda"

@regression_green @regression
  Scenario: Se muestra modal de valoracion de store y se vota Normal - Dejar sugerencia SI
  Given an user who is on "rateAppModal.btnExcellent"
  When user see text "¿Cómo fue tu experiencia con Banco del Sol?"
  And user tap on "rateAppModal.btnGood"
  Then user is on "rateAppModal.leaveSuggestion"
  When user see text "¿Nos ayudarías a mejorar?"
  And user see text "Dejanos tu sugerencia para saber cómo podemos mejorar tu experiencia."
  And user tap on "rateAppModal.leaveSuggestion"
  And user types "Sugerencias" on field "Suggestions.textField"
  And user tap on "Suggestions.btnSend"
  And user see label "Suggestions.msgSuccess"
  And user tap on "Suggestions.btnFinish"
  Then user is on "TransferHome.tabAgenda"

@regression_green @regression
  Scenario: Se muestra modal de valoracion de store y se vota Normal - Dejar sugerencia NO
  Given an user who is on "rateAppModal.btnExcellent"
  When user see text "¿Cómo fue tu experiencia con Banco del Sol?"
  And user tap on "rateAppModal.btnGood"
  Then user is on "rateAppModal.leaveSuggestion"
  When user tap on "rateAppModal.btnCancelSuggestion"
  Then user is on "TransferHome.tabAgenda"
    

  @testeo @faliedBS
  Scenario: Se muestra modal de valoracion de store y se vota Muy buena - dejar reseña SI
  Given an user who is on "rateAppModal.btnExcellent"
  When user see text "¿Cómo fue tu experiencia con Banco del Sol?"
  And user tap on "rateAppModal.btnExcellent"
  Then user is on "rateAppModal.sendReview"
  When user see text "¡Muchas gracias! ¿Nos recomendarías?"
  And user see text "Dejanos tu reseña para que otros puedan disfrutar de Banco del Sol."
  And user tap on "rateAppModal.sendReview"
#  --VALIDAR QUE ESTOY EN EL PLAYSTORE
  And Store is in foreground
  When user see text "Banco del Sol: El banco digital de Sancor Seguros"
#  --VOLVER HACIA LA APLICACION ANTERIOR 
  And return Banco del Sol App
  And user see text "AGENDA"
#  Then user is on "rateAppModal.leaveSuggestion"