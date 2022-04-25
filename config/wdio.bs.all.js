const { config } = require('./wdio.bs.shared')

const waitforTimeout = 30 * 60000;
const commandTimeout = 30 * 60000;

config.capabilities = [
  {
    waitforTimeout,
            commandTimeout,
            browserName: "Android",
            platformName: "Android",
            //unicodeKeyboard: true,
            newCommandTimeout: 30 * 60000,
            //resetKeyboard: true,
            adbExecTimeout: 120000,
            skipDeviceInitialization: false,
            skipServerInstallation: false,
            noReset: false,
            deviceReadyTimeout:20,
            androidDeviceReadyTimeout:900,
            androidInstallTimeout:90000,
            automationName: "UiAutomator2",
            autoGrantPermissions: true,
            os_version: process.env.ANDROID_OSVERSION_BS || '10.0',
            device: process.env.ANDROID_DEVICE_BS || 'Samsung Galaxy A51',
            app: process.env.ANDROID_APP_BS
  },
  {
    waitforTimeout,
        commandTimeout,
        browserName: 'iOS',
        platformName: 'iOS',
        osVersion: process.env.IOS_OSVERSION_BS || '14',
        device: process.env.IOS_DEVICE_BS || 'iPhone 12 Pro Max',
        unicodeKeyboard: true,
        newCommandTimeout: 30 * 60000,
        noReset: false,
        fullReset: true,
        autoGrantPermissions: true,
        autoAcceptAlerts: true,
        nativeInstrumentsLib: true,
        platformVersion: process.env.IOS_VERSION,
        automationName: 'XCUITest',
        deviceName: process.env.IOS_DEVICE_NAME,
        app: process.env.IOS_APP_BS,
        "browserstack.timezone" : "Buenos_Aires"
  }
];

config.maxInstances = 2
config.logLevel = 'silent' 

exports.config = config;
