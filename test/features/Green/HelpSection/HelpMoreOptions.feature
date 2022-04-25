Feature: HelpMoreOptions 

    @regression_green @regression
    Scenario: El usuario selecciona Contactanos y es redireccionado a la vista de canales de contacto
    Given an user who is on "Welcome.registerButton"
    And get login token with user email "hmateikabdsolqe@gmail.com"
    And an user who is on "Login.homeScreen"
    And enter passcode "192837"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    When user tap on "HelpSection.help"
    And user tap on "HelpSection.contactUs"
    And user see text "Chateá con nosotros"
    And user see text "Contactanos por Whatsapp"
    And user see text "Dejanos tu sugerencia"
    And user see text "Sucursales"
    And user see text "Teléfono"
    And user see text "Email"

    @warap @failedinBS
    Scenario: El usuario selecciona WhatsApp y es redireccionado a una conversación de WhatsApp con el Banco del Sol desde su dispositivo
    Given an user who is on "Welcome.registerButton"
    And get login token with user email "hmateikabdsolqe@gmail.com"
    And an user who is on "Login.homeScreen"
    When enter passcode "192837"
    Given skip biometry if it is activated
    And user close toolTip tapping on Understood
    And user tap on "HelpSection.help"
    And user tap on "HelpSection.contactUs"
    And user tap on text "Contactanos por Whatsapp"
    And Whatsapp is in foreground

    @regression_green @regression
    Scenario: Acceso a Chateá con nosotros en "Contactanos" logueado
    Given an user who is on "Welcome.registerButton"
    And get login token with user email "hmateikabdsolqe@gmail.com"
    And an user who is on "Login.homeScreen"
    When enter passcode "192837"
    Given skip biometry if it is activated
    And user close toolTip tapping on Understood
    And user tap on "HelpSection.help"
    And user see label "HelpSection.contactUs"
    And user tap on "HelpSection.chatWithUs"
    And user see text "Chat"
