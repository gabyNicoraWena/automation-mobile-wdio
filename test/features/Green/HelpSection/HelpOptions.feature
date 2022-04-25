@regression @regression_green
Feature: HelpOptions

As user i want to have help section with all contact channels and help Information
 
 @11111
  Scenario: Usuario ingresa en helpSection deslogueado y va a opcion contactanos visualizando canales de contacto
    Given an user who is on "Welcome.registerButton"
    Given get login token with user email "hmateikabdsolqe@gmail.com"
    Given an user who is on "Login.homeScreen"
    When user tap on "HelpSection.help"
    When user tap on "HelpSection.contactUs"
    When user see label "HelpSection.chatWithUs"
    When user see label "HelpSection.whatsappContact"
    When user see label "HelpSection.leaveYourSuggestions"
    When user tap on "HelpSection.email"
    When user tap on "HelpSection.phones"
    When user tap on "HelpSection.branchOffices"
    
  @bdsd-8714-PantallasSugerenciasOnboarding
  Scenario: Test AYUDA - Pantalla No recibí el email de registro durante onboarding
    Given an user who is on "Welcome.registerButton"
    When user tap on "Welcome.registerButton"
    When user tap on "TopBar.helpButton"
    When user tap on "HelpSection.dontReceiveRegistrationEmail"
    When user scrolls and click on button or text "HelpSection.contactUs"
    When user see label "HelpSection.leaveYourSuggestions"
    Then user tap on "HelpSection.btnBack"
    And user tap on "TopBar.backButton"
    And user see label "LinkInfo.acceptButton"
    
  @bdsd-8714-PantallasSugerenciasOnboarding
  Scenario: Test AYUDA - Pantalla Consejos para sacar tu foto durante onboarding
    Given an user who is on "Welcome.registerButton"
    When user tap on "Welcome.registerButton"
    When user tap on "TopBar.helpButton"
    When user tap on "HelpSection.tipsForTakeSelphiePhoto"
    When user scrolls and click on button or text "HelpSection.contactUs"
    When user see label "HelpSection.leaveYourSuggestions"

  @bdsd-8714-PantallasSugerenciasOnboarding
  Scenario: Test AYUDA - Pantalla Cómo tomar la foto de mi DNI durante onboarding
    Given an user who is on "Welcome.registerButton"
    When user tap on "Welcome.registerButton"
    When user tap on "TopBar.helpButton"
    When user tap on "HelpSection.howTakeDniPhoto"
    When user scrolls and click on button or text "HelpSection.contactUs"
    Then user see label "HelpSection.leaveYourSuggestions"

  @bdsd-8714-PantallasSugerenciasOnboarding 
  Scenario: Test AYUDA - Boton chatea con nosotros desde pantalla Consejos para sacar tu foto
    Given an user who is on "Welcome.registerButton"
    When user tap on "Welcome.registerButton"
    When user tap on "TopBar.helpButton"
    When user tap on "HelpSection.tipsForTakeSelphiePhoto"
    Then user tap on "HelpSection.chatWithUs"
  
  @bdsd-8714-PantallasSugerenciasOnboarding
  Scenario: Test AYUDA - Boton chatea con nosotros desde pantalla No recibi el mail de regristo
    Given an user who is on "Welcome.registerButton"
    When user tap on "Welcome.registerButton"
    When user tap on "TopBar.helpButton"
    When user tap on "HelpSection.tipsForTakeSelphiePhoto"
    Then user tap on "HelpSection.chatWithUs"
    
  @bdsd-8714-PantallasSugerenciasOnboarding
  Scenario: Test AYUDA - Boton chatea con nosotros desde pantalla Cómo tomar la foto de mi DNI
   Given an user who is on "Welcome.registerButton"
   When user tap on "Welcome.registerButton"
   When user tap on "TopBar.helpButton"
   When user tap on "HelpSection.tipsForTakeSelphiePhoto"
   Then user tap on "HelpSection.chatWithUs"

    @regression_green @regression
    Scenario: Usuario ingresar en helpsection desde loginview, tapea el botón back en top bar y es redireccionado a login view
    Given an user who is on "Welcome.registerButton"
    And get login token with user email "hmateikabdsolqe@gmail.com"
    And user is on "Login.homeScreen"
    When user tap on "TopBar.helpButton"
    Then user is on "HelpSection.seeAll"
    And user tap on "TopBar.backButton"
    And user is on "Login.homeScreen"

    @regression_green @regression
    Scenario: Back button en topBar HelpSection app vinculada
    Given an user who is on "Welcome.registerButton"
    And get login token with user email "hmateikabdsolqe@gmail.com"
    And an user who is on "Login.homeScreen"
    And user tap on "TopBar.helpButton"
    And user see text "Ayuda"
    And user tap on "TopBar.closeModalButton"
    And an user who is on "Login.homeScreen"