@skip(platformName='iOS')
Feature: Faqs 

    @regression_green @regression
    Scenario: Usuario ingresa a “Preguntas Frecuentes” desde seccion Tarjetas y ve las preguntas contextualizadas
    Given an user who is on "Welcome.registerButton"
    And get login token with user email "hmateikabdsolqe@gmail.com"
    And an user who is on "Login.homeScreen"
    When enter passcode "192837"
    Given skip biometry if it is activated
    And user close toolTip tapping on Understood
    When user tap on "TabBar.cardsButton"
    And user tap on "HelpSection.help"
    Then user is on "HelpSection.seeAll"
    And getPageSource ""
    And user see text "¿Cómo solicito mi Tarjeta de Débito?"
    And user see text "¿Para qué puedo usar mi tarjeta virtual?"
    And user see text "¿En cuánto tiempo expira mi tarjeta virtual?"
    And user see text "¿Al descartarla me ofrecen otra tarjeta?"

    @regression_green @regression
    Scenario: El usuario consulta una pregunta frecuente, lee la respuesta, visualiza el recurso para calificar la respuesta y califica la respuesta con no
    Given an user who is on "Welcome.registerButton"
    When user tap on "TopBar.helpButton"
    And user tap on text "¿Cuál es el costo de abrir mi cuenta?"
    Then user see text "Ninguno, abrir tu cuenta es 100% gratuito."
    And user scrolls to text "¿Te sirvió esta información?"
    When user tap on "HelpSection.rateNegative"
    And user see text "¡Gracias! Dejanos tu sugerencia para seguir mejorando"

    @regression_green @regression
    Scenario: El usuario consulta una pregunta frecuente, lee la respuesta, visualiza el recurso para calificar la respuesta y califica la respuesta con si
    Given an user who is on "Welcome.registerButton"
    When user tap on "TopBar.helpButton"
    And user tap on text "¿Cuál es el costo de abrir mi cuenta?"
    Then user see text "Ninguno, abrir tu cuenta es 100% gratuito."
    And user scrolls to text "¿Te sirvió esta información?"
    When user tap on "HelpSection.ratePositive"
    And user see text "¡Gracias! Dejanos tu sugerencia para seguir mejorando"

    @regression_green @regression
    Scenario: El usuario selecciona Ver todas y es redireccionado a una pantalla con todas las secciones
    Given an user who is on "Welcome.registerButton"
    And get login token with user email "hmateikabdsolqe@gmail.com"
    And an user who is on "Login.homeScreen"
    And enter passcode "192837"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood 
    And user see text on screen "HomeScreen.screenTitle"
    When user tap on "HelpSection.help"
    And user is on "HelpSection.seeAll"
    And user tap on "HelpSection.seeAll"
    And user tap on text "CUENTA"
    Then user scrolls to text "CUENTA"
    And user scrolls to text "COMO ABRIR MI CUENTA"
    And user scrolls to text "INICIO DE SESIÓN"
    And user scrolls to text "CAJA DE AHORRO REMUNERADA"
    And user scrolls to text "TRANSFERENCIAS"
    And user scrolls to text "PAGOS DE SERVICIOS"
    And user scrolls to text "TARJETAS"
    And user scrolls to text "PLAZO FIJO"

    @regression_green @regression
    Scenario: Usuario ingresa a “Preguntas Frecuentes” y ve las preguntas relacionadas a “Como abrir mi cuenta"
    Given an user who is on "Welcome.registerButton"
    When user tap on "TopBar.helpButton"
    And user see text "¿Cuál es el costo de abrir mi cuenta?"
    And user see text "¿Qué necesito para registrarme?"
    And user see text "¿Cualquier persona puede abrir una cuenta?"
    And user see text "¿Cuándo puedo comenzar a operar en Banco del Sol?"

    @regression_green @regression
    Scenario: Usuario ingresa a “Preguntas Frecuentes” y ve las preguntas relacionadas a “Inicio de Sesión”
    Given an user who is on "Welcome.registerButton"
    And get login token with user email "hmateikabdsolqe@gmail.com"
    And an user who is on "Login.homeScreen"
    When enter passcode "192837"
    Given skip biometry if it is activated
    And user close toolTip tapping on Understood 
    And user tap on "TopBar.profileButton"
    And user scrolls and click on button or text "ProfileScreen.signOff" 
    And user tap on "HelpSection.help"
    And user see text "¿Cómo puedo ingresar a mi cuenta?"
    And user see text "¿Cómo activo el ingreso a mi cuenta por biometría?"
    And user see text "¿Qué pasa si olvido mi clave de acceso a la App?"
    And user see text "¿Cómo recupero mi clave en caso de bloquearla?"