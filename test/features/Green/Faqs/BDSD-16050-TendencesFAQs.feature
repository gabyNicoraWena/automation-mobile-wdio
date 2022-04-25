Feature: Comprobar la actualizaciones de los textos en las FAQs de Tendencias 

  Scenario: BDSD-16345 - Comprobar que el primer mensaje en las FAQs de Tendencias fue actualizado
    Given an user who is on "Welcome.registerButton"
    And get login token with user email "bdsgreenqe@gmail.com"
    And an user who is on "Login.homeScreen"
    And enter passcode "192837"
    And skip biometry if it is activated
    When user tap on "TopBar.profileButton"
    Then user see text "Ver tenencias al 31/12"
    When user tap on text "Ver tenencias al 31/12"
    And user tap on "HelpSection.help"
    Then user see text "¿Dónde puedo encontrar mi resumen de tenencias?"
    When user tap on element contains the text "¿Dónde puedo encontrar mi resumen de tenencias?"
    Then user see text "Ingresá en la sección “Perfil” y presioná “Ver tenencias al 31/12” para consultar y descargar tu resumen; en caso de no poder visualizarlo, comunicate con nosotros por el chat de la app para que podamos reenviártelo por mail."

  Scenario: BDSD-16346 - Comprobar que el segundo mensaje en las FAQs de Tendencias fue actualizado
    Given an user who is on "Welcome.registerButton"
    And get login token with user email "bdsgreenqe@gmail.com"
    And an user who is on "Login.homeScreen"
    And enter passcode "192837"
    And skip biometry if it is activated
    And user see label "HomeScreenModal.buttonViewActivities"
    When user tap on "TopBar.profileButton"
    Then user see text "Ver tenencias al 31/12"
    When user tap on element contains the text "Ver tenencias al 31/12"
    And user tap on "HelpSection.help"
    Then user see text "¿Qué información contiene mi resumen de tenencias?"
    When user tap on element contains the text "¿Qué información contiene mi resumen de tenencias?"
    Then user see text "Tu resumen de tenencias contiene información al 31 de diciembre del último año. En él, vas a encontrar las operaciones realizadas en tu caja de ahorro, intereses ganados e inversiones. Además, te sirve para reunir información bancaria y presentarla en tus declaraciones de impuestos"
    