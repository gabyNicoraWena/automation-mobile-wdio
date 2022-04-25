@regression @regression_green
Feature: Suggestions

As user i want to send suggestions to improve the app

  Scenario: Un usuario logueado envia una sugerencia con casilla de "quiero ser contactado" marcada y vuelve a la tab inicio
    Given an user who is on "Welcome.registerButton"
    And get login token with user email "hmateikabdsolqe@gmail.com"
    Given an user who is on "Login.homeScreen"
    When enter passcode "192837"
    And user close toolTip tapping on Understood
    And user see text on screen "HomeScreen.screenTitle"
    When user tap on "HelpSection.help"
    When user tap on "HelpSection.contactUs"
    When user tap on "HelpSection.leaveYourSuggestions"
    And user see text on screen "Suggestions.textImInterestedBeingContactedToTellMyExperience"
    When user types "Sugerencias" on field "Suggestions.textField"
    When user tap on "Suggestions.textImInterestedBeingContactedToTellMyExperience"
    When user tap on "Suggestions.btnSend"
    Then user is on "Suggestions.btnFinish"
    And user see text on screen "Suggestions.textSuggestionGrettings"
    And user see text on screen "Suggestions.textYourIdeasHelpsUs"
    And user tap on "Suggestions.btnFinish"
    And user see text on screen "HomeScreen.screenTitle"

    Scenario: Un usuario logueado envia una sugerencia con casilla de "quiero ser contactado" desmarcada y vuelve a la tab inicio
    Given an user who is on "Welcome.registerButton"
    And get login token with user email "hmateikabdsolqe@gmail.com"
    And an user who is on "Login.homeScreen"
    And enter passcode "192837"
    And user close toolTip tapping on Understood
    And user see text on screen "HomeScreen.screenTitle"
    When user tap on "HelpSection.help"
    And user tap on "HelpSection.contactUs"
    And user tap on "HelpSection.leaveYourSuggestions"
    And user see text on screen "Suggestions.textImInterestedBeingContactedToTellMyExperience"
    And user types "Sugerencias" on field "Suggestions.textField"
    And user tap on "Suggestions.btnSend"
    Then user is on "Suggestions.btnFinish"
    And user see text on screen "Suggestions.textSuggestionGrettings"
    And user see text on screen "Suggestions.textYourIdeasHelpsUs"
    And user tap on "Suggestions.btnFinish"
    And user see text on screen "HomeScreen.screenTitle"
    
  Scenario: Un usuario deslogueado envia una sugerencia con casilla de "quiero ser contactado" marcada y vuelve a la tab inicio
    Given an user who is on "Welcome.registerButton"
    When user tap on "TopBar.helpButton"
    And user tap on "HelpSection.contactUs"
    And user tap on "HelpSection.leaveYourSuggestions"
    And user see text on screen "Suggestions.textImInterestedBeingContactedToTellMyExperience"
    And user types "Sugerencias" on field "Suggestions.textField"
    And user tap on "Suggestions.textImInterestedBeingContactedToTellMyExperience"
    And user tap on "Suggestions.btnSend"
    And user is on "Suggestions.btnFinish"
    And user see text on screen "Suggestions.textSuggestionGrettings"
    And user see text on screen "Suggestions.textYourIdeasHelpsUs"
    Then user tap on "Suggestions.btnFinish"
    And an user who is on "Welcome.registerButton"

    Scenario: Un usuario deslogueado envia una sugerencia con casilla de "quiero ser contactado" desmarcada y vuelve a la tab inicio
    Given an user who is on "Welcome.registerButton"
    When user tap on "TopBar.helpButton"
    And user tap on "HelpSection.contactUs"
    And user tap on "HelpSection.leaveYourSuggestions"
    And user see text on screen "Suggestions.textImInterestedBeingContactedToTellMyExperience"
    And user types "Sugerencias" on field "Suggestions.textField"
    And user tap on "Suggestions.btnSend"
    Then user is on "Suggestions.btnFinish"
    And user see text on screen "Suggestions.textSuggestionGrettings"
    And user see text on screen "Suggestions.textYourIdeasHelpsUs"
    And user tap on "Suggestions.btnFinish"
    And an user who is on "Welcome.registerButton"