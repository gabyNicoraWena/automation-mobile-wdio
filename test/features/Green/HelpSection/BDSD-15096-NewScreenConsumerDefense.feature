Feature: Se creo una nueva pantalla para visualizar el link a Defensa del consumidor

  @regression
  Scenario: BDSD-16419 - Comprobar que la sección 'Defensa del consumidor' ahora es un botón y no un desplegable
    Given an user who is on "Welcome.registerButton"
    And get login token with user email "bdsgreenqe@gmail.com"
    And an user who is on "Login.homeScreen"
    And enter passcode "192837"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    When user tap on "HelpSection.help"
    Then user see label "HelpSection.btnConsumerDefense"
    When user tap on "HelpSection.btnConsumerDefense"
    Then user is on "ConsumerDefense.title"

  @regression
  Scenario: BDSD-16420 - Existe una nueva pantalla de 'Defensa del consumidor' con un texto y un link
    Given an user who is on "Welcome.registerButton"
    And get login token with user email "bdsgreenqe@gmail.com"
    And an user who is on "Login.homeScreen"
    And enter passcode "192837"
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    When user tap on "HelpSection.help"
    And user see label "HelpSection.btnConsumerDefense"
    And user tap on "HelpSection.btnConsumerDefense"
    Then user see text "Si necesitás comunicarte con la defensa de las y los consumidores, podés entrar en el siguiente link: "
    And user see label "ConsumerDefense.linkConsumerDefense"