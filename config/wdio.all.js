const { config } = require("./wdio.shared");

const waitforTimeout = 30 * 60000;
const commandTimeout = 30 * 60000;

config.capabilities = [
  {
    waitforTimeout,
    commandTimeout,
    browserName: "Android",
    platformName: "Android",
  //  unicodeKeyboard: true,
    newCommandTimeout: 30 * 60000,
  //  resetKeyboard: true,
    noReset: false,
    automationName: "UiAutomator2",
    deviceName: "Google Pixel",
    app: process.env.ANDROID_APP_DIR
  },
  {
    waitforTimeout,
    commandTimeout,
    browserName: "iOS",
    platformName: "iOS",
    unicodeKeyboard: true,
    newCommandTimeout: 30 * 60000,
    resetKeyboard: true,
    noReset: true,
    nativeInstrumentsLib: true,
    platformVersion: "13.3",
    automationName: "XCUITest",
    deviceName: "iPhone 11",
    app: process.env.IOS_APP_DIR
  }
];
config.logLevel = "silent";

exports.config = config;
