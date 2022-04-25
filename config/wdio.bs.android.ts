import { config } from './wdio.bs.shared';

config.capabilities = [
      {
        waitforTimeout: 30000,
        commandTimeout: 30000,
        browserName: "Android",
        platformName: "Android",
        unicodeKeyboard: true,
        newCommandTimeout: 90,
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
        os_version: process.env.ANDROID_OSVERSION_BS || '11.0',
        device: process.env.ANDROID_DEVICE_BS || 'Samsung Galaxy S21 Plus',
        app: process.env.ANDROID_APP_BS,
        "browserstack.appium_version" : '1.21.0',
       }
]

config.maxInstances = 2
config.logLevel = 'debug' //trace | debug | info | warn | error | silent

exports.config = config