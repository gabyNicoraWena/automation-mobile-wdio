@factory
Feature: Login BIS
  Scenario: User LoginScreen bis22
    Given user tap on "login.ingresaTuMail"
    And user types "ios_apple2@wenance.com" on field "login.ingresaTuMail"
    And user tap on "login.ingresaTuPass"
    And user types "Test1234" on field "login.ingresaTuPass"
    And user tap on "login.btnIngresar"
    And user tap on "login.labelPassError"
    And user wait to see "login.labelPassError"
    Then user see text on screen "login.labelPassError"