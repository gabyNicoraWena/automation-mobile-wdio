@factory
Feature: Login
  Scenario: User LoginScreen

    Given user wait to see "login.olvideMiPass"
    And user tap on "login.ingresaTuMail"
    And user types "ios_apple@wenance.com" on field "login.ingresaTuMail"
    And user tap on "login.ingresaTuPass"
    And user types "Test1234" on field "login.ingresaTuPass"
    And user tap on "login.btnIngresar"
    Then user see text on screen "login.labelPassError"
