import { config } from './wdio.shared';

config.capabilities = [
  {
    waitforTimeout: 30000,
    commandTimeout: 30000,
    browserName: "Android",
    platformName: "Android",
    unicodeKeyboard: true,
    newCommandTimeout: 60,
    resetKeyboard: true,
    adbExecTimeout: 120000,
    skipDeviceInitialization: false,
    skipServerInstallation: false,
    noReset: false,
    deviceReadyTimeout:20,
    androidDeviceReadyTimeout:900,
    androidInstallTimeout:90000,
    automationName: "UiAutomator2",
    autoGrantPermissions: true,
    deviceName: "Google Pixel",
    app: process.env.ANDROID_APP_DIR,
  }
]
config.maxInstances = 1
config.logLevel = 'debug' //trace | debug | info | warn | error | silent

exports.config = config