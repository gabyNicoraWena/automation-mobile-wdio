const { config } = require('./wdio.shared')

const { IOS_VERSION, IOS_DEVICE_NAME, IOS_APP_DIR } = process.env

config.capabilities = [
  {
    commandTimeout: 30000,
    browserName: 'iOS',
    platformName: 'iOS',
    resetOnSessionStartOnly: true,
    unicodeKeyboard: true,
    newCommandTimeout: 90,
    noReset: false,
    fullReset: true,
    autoGrantPermissions: true,
    autoAcceptAlerts: true,
    platformVersion: IOS_VERSION,
    automationName: "XCUITest",
    deviceName: IOS_DEVICE_NAME,
    udid: IOS_DEVICE_NAME,
    app: IOS_APP_DIR,
    usePrebuiltWDA: true,
  },
]
config.maxInstances = 1
config.logLevel = 'silent' // trace | debug | info | warn | error | silent

exports.config = config