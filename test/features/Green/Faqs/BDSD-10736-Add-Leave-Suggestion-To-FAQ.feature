Feature: Add Leave Suggestion To FAQ

@skip()
  Scenario: Valorar positivo una FAQs desde help_home dejar sugerencia y finalizar
    Given an user who is on "Welcome.registerButton"
    And get login token with user email "bdsolqe54f4466@gmail.com"
    Given an user who is on "Login.homeScreen"
    When enter passcode "192837"
    Given skip biometry if it is activated
    And user close toolTip tapping on Understood
    And user see text on screen "HomeScreen.screenTitle"
    When user tap on "HelpSection.help"
    And user tap on "HelpSection.openQuestion"
    Then user scrolls up 20 percent until see "FaqScreen.helpfullInformation"
    When user tap on "HelpSection.ratePositive"
    And user see text on screen "HelpFaqExpand.thanksForComment"
    Then user scrolls up 20 percent until see "HelpSection.leaveSuggestion"
    When user tap on "HelpSection.leaveSuggestion"
    Then user is on "Suggestions.textField"
    When user types "Sugerencias" on field "Suggestions.textField"
    When user tap on "Suggestions.btnSend"
    When user see label "Suggestions.msgSuccess"
    When user tap on "Suggestions.btnFinish"
    And user see text "Banco del Sol"
    
@regression_green @regression @skip(platformName='iOS')
  Scenario: Valorar negativo una FAQs desde help_home dejar sugerencia y finalizar
    Given an user who is on "Welcome.registerButton"
    And get login token with user email "bdsolqe54f4466@gmail.com"
    Given an user who is on "Login.homeScreen"
    When enter passcode "192837"
    And user skip update biometrics screen
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    And user see text on screen "HomeScreen.screenTitle"
    When user tap on "HelpSection.help"
    And user tap on "HelpSection.openQuestion"
    And user scrolls up 20 percent until see "FaqScreen.helpfullInformation"
    When user tap on "HelpSection.rateNegative"
    And user see text on screen "HelpFaqExpand.thanksForComment"
    And user scrolls up 20 percent until see "HelpSection.leaveSuggestion"
    And user tap on "HelpSection.leaveSuggestion"
    Then user is on "Suggestions.textField"
    When user types "Sugerencias" on field "Suggestions.textField"
    When user tap on "Suggestions.btnSend"
    When user see label "Suggestions.msgSuccess"
    When user tap on "Suggestions.btnFinish"
    Then user see text on screen "HomeScreen.screenTitle"

  @regression_green @regression @skip(platformName='iOS') @s
  Scenario: Valorar positivo una FAQs desde help_faq_expand dejar sugerencia y finalizar
    Given an user who is on "Welcome.registerButton"
    And get login token with user email "bdsolqe54f4466@gmail.com"
    And an user who is on "Login.homeScreen"
    And enter passcode "192837"
    And user skip update biometrics screen
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    And user see text on screen "HomeScreen.screenTitle"
    When user tap on "HelpSection.help"
    And user tap on "HelpSection.seeAll"
    And user tap on "FaqScreen.accountCollapse"
    And user tap on "FaqScreen.transferExpand"
    And user tap on "FaqScreen.howDoATransfer"
    And user scrolls up 23 percent until see "FaqScreen.helpfullInformation"
    And user tap on "HelpFaqExpand.ratePositive"
    And user see text on screen "HelpFaqExpand.thanksForComment"
    And user tap on "HelpFaqExpand.leaveSuggestion"
    And user is on "Suggestions.textField"
    And user types "Sugerencias" on field "Suggestions.textField"
    And user tap on "Suggestions.btnSend"
    And user see label "Suggestions.msgSuccess"
    And user tap on "Suggestions.btnFinish"
    Then user see text on screen "HomeScreen.screenTitle"

@regression_green @regression @skip(platformName='iOS')
  Scenario: Valorar negativo una FAQs desde help_faq_expand dejar sugerencia y finalizar
    Given an user who is on "Welcome.registerButton"
    And get login token with user email "bdsolqe54f4466@gmail.com"
    And an user who is on "Login.homeScreen"
    And enter passcode "192837"
    And user skip update biometrics screen
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    And user see text on screen "HomeScreen.screenTitle"
    When user tap on "HelpSection.help"
    And user tap on "HelpSection.seeAll"
    And user tap on "FaqScreen.accountCollapse"
    And user tap on "FaqScreen.transferExpand"
    And user tap on "FaqScreen.howDoATransfer"
    And user scrolls up 20 percent until see "FaqScreen.helpfullInformation"
    And user scrolls up 20 percent until see "HelpFaqExpand.rateNegative"
    And user tap on "HelpFaqExpand.rateNegative"
    And user see text on screen "HelpFaqExpand.thanksForComment"
    And user tap on "HelpFaqExpand.leaveSuggestion"
    And user is on "Suggestions.textField"
    And user types "Sugerencias" on field "Suggestions.textField"
    And user tap on "Suggestions.btnSend"
    Then user see label "Suggestions.msgSuccess"
    And user tap on "Suggestions.btnFinish"
    And user see text on screen "HomeScreen.screenTitle"

@regression_green @regression @skip(platformName='iOS')
  Scenario: Valorar positivo una FAQs desde help_faq_expand tap en dejar sugerencia y volver hacia atras
    Given an user who is on "Welcome.registerButton"
    And get login token with user email "bdsolqe54f4466@gmail.com"
    Given an user who is on "Login.homeScreen"
    When enter passcode "192837"
    And user skip update biometrics screen
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    And user see text on screen "HomeScreen.screenTitle"
    When user tap on "HelpSection.help"
    And user tap on "HelpSection.seeAll"
    And user tap on "FaqScreen.accountCollapse"
    And user tap on "FaqScreen.transferExpand"
    And user tap on "FaqScreen.howDoATransfer"
    Then user scrolls up 23 percent until see "FaqScreen.helpfullInformation"
    When user tap on "HelpFaqExpand.rateNegative"
    And user see text on screen "HelpFaqExpand.thanksForComment"
    When user tap on "HelpFaqExpand.leaveSuggestion"
    Then user is on "Suggestions.textField"
    When user tap on "TopBar.backButton"
    Then user see text on screen "HomeScreen.screenTitle"

@regression_green @regression @skip(platformName='iOS')
  Scenario: Valorar negativa una FAQs desde help_home tap en dejar sugerencia y volver hacia atras
    Given an user who is on "Welcome.registerButton"
    And get login token with user email "bdsolqe54f4466@gmail.com"
    Given an user who is on "Login.homeScreen"
    When enter passcode "192837"
    And user skip update biometrics screen
    And skip biometry if it is activated
    And user close toolTip tapping on Understood
    And user see text on screen "HomeScreen.screenTitle"
    When user tap on "HelpSection.help"
    And user tap on "HelpSection.openQuestion"
    Then user scrolls up 20 percent until see "FaqScreen.helpfullInformation"
    When user tap on "HelpSection.ratePositive"
    And user see text on screen "HelpFaqExpand.thanksForComment"
    Then user scrolls up 20 percent until see "HelpSection.leaveSuggestion"
    When user tap on "HelpSection.leaveSuggestion"
    Then user is on "Suggestions.textField"
    When user tap on "TopBar.backButton"
    Then user see text on screen "HomeScreen.screenTitle"

@regression_green @regression @skip(platformName='iOS')
  Scenario: Valorar positivo una FAQs desde carrousel dejar sugerencia y finalizar
    Given an user who is on "Welcome.registerButton"
    When user tap on "Welcome.registerButton"
    When user tap on "TopBar.helpButton"
    When user scrolls to left and tap on button "HelpSection.carrTakeFaceScreenShot"
    Then user scrolls up 25 percent until see "FaqScreen.helpfullInformation"
    Then user scrolls up 25 percent until see "HelpSection.ratePositive"
    When user tap on "HelpSection.ratePositive"
    And user see text on screen "HelpFaqExpand.thanksForComment"
    When user tap on "HelpSection.leaveSuggestion"
    Then user is on "Suggestions.textField"
    When user types "Sugerencias" on field "Suggestions.textField"
    When user tap on "Suggestions.btnSend"
    When user see label "Suggestions.msgSuccess"
    When user tap on "Suggestions.btnFinish"
    And user see text on screen "HelpFaqExpand.thanksForComment"

@regression_green @regression @skip(platformName='iOS')
  Scenario: Valorar positivo una FAQs desde carrousel tap en dejar sugerencia y volver hacia atras
    Given an user who is on "Welcome.registerButton"
    When user tap on "Welcome.registerButton"
    When user tap on "TopBar.helpButton"
    When user scrolls to left and tap on button "HelpSection.carrCreatePassword"
    And user scrolls down to see "HelpSection.rateNegative"
    When user tap on "HelpSection.rateNegative"
    And user see text on screen "HelpFaqExpand.thanksForComment"
    When user tap on "HelpSection.leaveSuggestion"
    Then user is on "Suggestions.textField"
    When user tap on "TopBar.backButton"
    And user see text on screen "HelpFaqExpand.thanksForComment"

