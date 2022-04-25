import { config } from './wdio.bs.shared';

const { IOS_APP_BS, IOS_OSVERSION_BS, IOS_DEVICE_BS } = process.env

config.capabilities = [
  {
    commandTimeout: 30000,
    browserName: 'iOS',
    platformName: 'iOS',
    os_version: IOS_OSVERSION_BS || '14',
    device: IOS_DEVICE_BS || 'iPhone 11 Pro Max',
    //unicodeKeyboard: true,
    newCommandTimeout: 90,
    noReset: false,
    fullReset: true,
    autoGrantPermissions: true,
    autoAcceptAlerts: true,
    nativeInstrumentsLib: true,
    platformVersion: IOS_OSVERSION_BS || '14',
    automationName: 'XCUITest',
    deviceName: IOS_DEVICE_BS || 'iPhone 11 Pro Max',
    app: IOS_APP_BS,
    real_mobile: true,
     "browserstack.timezone" : "Buenos_Aires",
     "browserstack.appium_version": "1.22.0",
  },
]
config.maxInstances = 2
config.logLevel = 'debug' // trace | debug | info | warn | error | silent

exports.config = config