import { When, Then } from "@cucumber/cucumber";
import { find } from 'lodash'
import { v4 as uuid } from 'uuid'

import { ClassFactory, FindElement } from '../../helpers/ClassFactory'
import { Gestures } from '../../helpers/Gestures'
import { keyPress, tapElementByPositionOCR, asyncForEach} from '../../helpers/utils'
import listSelectors from '../page-objects/listSelectors'
import { updateSignUpRequestDeviceId } from '../utils/databases/PeopleHub'
import { linkAccount, signIn, unlockPasscodeToken } from '../utils/services/Auth/ClientsAuth'
import { logOutAllSessions } from '../utils/services/Auth/Keycloak'
import {
  createAffidavitForPerson,
  getPersonByEmail,
  patchMinimumRequiredData,
} from '../utils/services/PeopleHub/PeopleHub'
/*import {
  getVerifyEmailToken,
  increaseFacephiWrongFaceMatch,
  increaseRenaperWrongFaceMatch,
  patchIdentityVerified,
  patchImagesUrls,
  validateCustomerVeracity,
} from '../utils/services/PeoplePreSignup/PeoplePreSignup'
*/
import { unlockAllRestrictions } from '../utils/services/ServiceFlowOrchestrator/ServiceFlowOrchestrator'
import { World } from './World'
import axios from 'axios'
import updateBsAirplaneMode from '../utils/services/BrowserStack/Browserstack'
import userDataSetByEnvironment from '../page-objects/dataSets'
import { changeScenarioStatus } from '../utils/services/Wiremock/Wiremock'
import { getPolicies } from '../utils/services/insurance/InsuranceServices'

const { MOCKSERVICE_URL,TEST_ENV } = process.env

When('enter passcode {string}', async passcode => {
 const mail = World.email.split('@')[0]
 World.passcode = passcode
 var arr = []

if(userDataSetByEnvironment[`${mail}`] != undefined){
  if(userDataSetByEnvironment[`${mail}`][`${TEST_ENV}`] != undefined){
    arr = userDataSetByEnvironment[`${mail}`][`${TEST_ENV}`].pass.split('')
    } else {
    arr = passcode.split('')
  }
} else {
    arr = passcode.split('')
}
  
  await asyncForEach(arr, async (num) => {
  if (driver.isAndroid == true) {
    await(await $(`//*[@text='${num}']`)).click()
  } else {
    await(await $(`~Teclado Clave Tecla ${num}`)).click()
  }
  })
})

When('enter random passcode', async () => {
  const passcode = Math.floor(100000 + Math.random() * 900000);
  World.passcode = passcode.toString()
  
  passcode.toString().split('').forEach(async key => {
 //   $(`~Teclado Clave Tecla ${key}`).click()
 var element = ''
  if (driver.isAndroid === true) {
    element = await $(`//*[@text='${key}']`)
  } else {
    element = await $(`~Teclado Clave Tecla ${key}`)
  }
  await element.click()
  })
})

When('enter saved passcode', async () => {
  const arr = World.passcode.split('')
  await asyncForEach(arr, async (num) => {
    if (driver.isAndroid == true) {
      await(await $(`//*[@text='${num}']`)).click()
    } else {
      await(await $(`~Teclado Clave Tecla ${num}`)).click()
    }
    })
})

When('user see {string}', async screen => {
  if (driver.isAndroid) {
    const [page, method] = ClassFactory(screen)
    await(await page[method]()).waitForDisplayed()
  } else {
    const selector =
      '**/XCUIElementTypeOther[`label == "Vertical scroll bar, 1 page Horizontal scroll bar, 1 page"`][4]/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeOther[2]'
    const Button =await(await $(`-ios class chain:${selector}`)).isDisplayed()
  }
})

When('user does not see the text {string}', async text => {
  const element = await $(`//*[@text='${text}']`)
  if (await element.isDisplayed()) {
    throw new Error('Elemento no esperado encontrado')
  }
})

When('user does not see the element {string}', async elem => {
  const [page, method] = ClassFactory(elem)
  if (await(await page[method]()).isDisplayed()) {
    throw new Error('Elemento no esperado encontrado')
  }
})

When(/^Reset wiremock$/, async function () {
  await axios.post(`${MOCKSERVICE_URL}` + '/__admin/mappings/reset').then(async resp => {
    console.log(resp.data)
  })
  await driver.reset()
})

When('Get to wiremock {string}',async url => {
  await axios.get(`${MOCKSERVICE_URL}` + url).then(async resp => {
    console.log(resp.data)
  })
})

When('user {string} has an active session on another device', async mail => {
  const randomDeviceId = uuid()
  var appBundleId = ''
  if(driver.isAndroid){
   appBundleId = await driver.getCurrentPackage()
  }
  const { offlineToken } = await browser.call(async () => await linkAccount(mail, '111111', '192837', 'model', 'name', appBundleId))
  await browser.call(async() => await signIn(mail, '111111', '192837', offlineToken))
})

When('user clear field {string}', async (field) => {
  const [page, method] = ClassFactory(field)
  await(await page[method]()).clearValue()
})

When('user types {string} on field {string}', async (string, screen) => {
  const [page, method] = ClassFactory(screen)
  await(await page[method]()).click()
  await(await page[method]()).addValue(string)
})

When('user types {string} on Chat input', async string => {
  const [page, method] = ClassFactory('Chat.textField')
  const [page1, method1] = ClassFactory('Chat.textFieldOutOfTime')
  const [page2, method2] = ClassFactory('Chat.textFieldAfterExtention')

  var textfiel

  /* Falla en algunos steps de chat el hidekeyboard.
  if (driver.isKeyboardShown()) {
    driver.hideKeyboard()
  }
*/
for (let i = 0; i < 10; i++) {
    if ((await(await page[method]()).isDisplayed())) {
      textfiel = await page[method]()
    } else if (await(await page1[method1]()).isDisplayed()) {
      textfiel = await page1[method1]()
    } else if (await (await page2[method2]()).isDisplayed()) {
      textfiel = await page2[method2]()
    }
}
try{  
await textfiel.click()  
await textfiel.addValue(string)
} catch(error){
  throw new Error('Campo de texto para ingresar Chat no encontrado') 
}
})

When('user attempts to unlock passcode using mail {string}',async email => {
  const { deviceId, magicLinkBaseUrl } = World

  const resetPasscodeToken = await browser.call(async() => await unlockPasscodeToken(email, deviceId))

  await browser.url(`${magicLinkBaseUrl}/reset-passcode?token=${resetPasscodeToken}`)
})

When('user {string} logs out on all devices', async mail => {
  const persons = await browser.call(async () => await getPersonByEmail(mail))
  const person = await find(persons, { type: 'CUSTOMER' })

  await browser.call(async() => await logOutAllSessions(person.id))
})

When('user selects one device', async () => {
  let [page, method] = ClassFactory('LinkedDevicesLimitReached.devicePos1')
  await(await page[method]()).click()
})

When('biometric data is filled for user {string}', async mail => {
  const persons = await browser.call(async() => await getPersonByEmail(mail))
  const person = await find(persons, { type: 'LEAD' })

  await browser.call(async() => await patchImagesUrls(person.id))
  await browser.call(async() => await validateCustomerVeracity(person.id))
  await browser.call(async() => await patchIdentityVerified(person.id))
})

When('user {string} with DNI {string} continues onboarding', async (mail, dni) => {
  const { deviceId, magicLinkBaseUrl } = World
  const token = await browser.call(async() => await getVerifyEmailToken(deviceId, dni, mail))

  await browser.url(`${magicLinkBaseUrl}/verify-email?token=${token}`)
})

When('user declares marital status {string}', async maritalStatus => {
  await(await $(listSelectors.ProfileScreen.maritalStatus + maritalStatus)).click()
})


When('user scrolls and click on button or text {string}', async element => {
  const [page, method] = ClassFactory(element)
  await Gestures.checkIfDisplayedWithScrollDown(await page[method](), 10)
  await(await page[method]()).click()
})

When('user scrolls down to see {string}', async element => {
  const [page, method] = ClassFactory(element)
  await Gestures.checkIfDisplayedWithScrollDown(await page[method](), 10)
})

When('user scrolls up to see {string}', async element => {
  const [page, method] = ClassFactory(element)
  await Gestures.checkIfDisplayedWithScrollUp(await page[method](), 10)
})


When('user scrolls to left and tap on button {string}', async element => {
  const [page, method] = ClassFactory(element)
  await Gestures.checkIfDisplayedWithScrollLeft(page[method](), 10)
  await(await page[method]()).click()
})

When('user scrolls to rigth and tap on button {string}', async element => {
  const [page, method] = ClassFactory(element)
  await Gestures.checkIfDisplayedWithScrollRight(await page[method](), 10)
  await(await page[method]()).click()
})

When('user swipe rigth', async () => {
  await Gestures.swipeRight()
})

When('user swipe left', async () => {
  await Gestures.swipeLeft()
})

When('user swipe down', async () => {
  await Gestures.swipeDown()
})

When('user swipe up', async () => {
  await Gestures.swipeUp()
})

When('swipe up {int} percentage', async (percentage) => {
  var p = percentage / 100
  await Gestures.swipeUp(p)
})

When('user swipes {string} to the left', async elemento => {
  const [page, method] = ClassFactory(elemento)
  const locX = await(await page[method]()).getLocation('x') + 100
  const locY = await(await page[method]()).getLocation('y') + 100

  await driver.touchPerform([
    { action: 'press', options: { x: locX, y: locY } },
    {
      action: 'wait',
      options: { ms: 1000 },
    },
    { action: 'moveTo', options: { x: locX - 100, y: locY } },
    { action: 'release' },
  ])
})

When('user scrolls up to text {string}', async text => {
  const element = await $(`//*[@text='${text}']`)
  await Gestures.checkIfDisplayedWithScrollUp(await element, 30)
})

When('loading dissappears', async () => {
  await browser.pause(10000)
})

When('minimum required data is added to user {string}', async registeredMail => {
  const persons = await browser.call(async() => await getPersonByEmail(registeredMail))
  const person = await find(persons, { type: 'CUSTOMER' })

  await browser.call(async() => await patchMinimumRequiredData(person.id))
  await browser.call(async() => await createAffidavitForPerson(person.id))
})

When('all restrictions are lifted for used {string}', async registeredMail => {
  const persons = await browser.call(async() => await getPersonByEmail(registeredMail))
  const person = await find(persons, { type: 'CUSTOMER' })

  await browser.call(async() => await unlockAllRestrictions(person.id))
})

When('user kills the app', async () => {
  await browser.reset()
})

When('{string} device is changed', async registeredMail => {
  await browser.pause(1000)
  const persons = await browser.call(async() => await getPersonByEmail(registeredMail))
  const person = await find(persons, { type: 'LEAD' })

  await updateSignUpRequestDeviceId(person.id, person.signUpRequest.id)
})

When('user {string} has reached RENAPER wrong face match', async mail => {
  const persons = await browser.call(async() => await getPersonByEmail(mail))
  const person = await find(persons, { type: 'LEAD' })

  await browser.call(async() => await increaseRenaperWrongFaceMatch(person.id))
  await browser.call(async() => await increaseRenaperWrongFaceMatch(person.id))
})

When('user {string} has reached Facephi wrong face match', async mail => {
  const persons = await browser.call(async() => await getPersonByEmail(mail))
  const person = await find(persons, { type: 'LEAD' })

  for (let i = 0; i <= 5; i++) {
    await browser.call(async() => await increaseFacephiWrongFaceMatch(person.id))
  }
})

When('{string} is displayed after {int} seconds', { timeout: 140000 }, async (screen, time) => {
  const [page, method] = ClassFactory(screen)
  await(await page[method]()).waitForDisplayed({timeout: time * 1000})
})

//use this step when getelements return more than one for IOS.
When('user tap on element {string} on position of arrangement {int}', async (screen, pos) => {
  if (driver.isAndroid === true) {
    const [page, method] = ClassFactory(screen)
    await(await page[method]()).click()
  } else {
    const element = await $$('~' + `${screen}`)
    await element[pos].click()
  }
})

When('user types {string} on field {string} on position of arrangement {int}', async (string, screen, pos) => {
  if (driver.isAndroid === true) {
    const element = await $('~' + `${screen}`)
    await element.click()
    await element.sendKeys(await string.split(''))
  } else {
    const element = await $$('~' + `${screen}`)
    await element[pos].click()
    await element[pos].sendKeys(await string.split(''))
  }
})

When('user set {string} on field {string}', async (amount, element) => {
  const [page, method] = ClassFactory(element)
  if (driver.isAndroid === true) {
    await(await page[method]()).click()
    for (const number of amount.split('')) {
    await keyPress(number)    
    World.amount = amount
    }
  } else {
    try{
      for (const number of amount.split('')) {
       await(await $(`~${number}`)).click()
       World.amount = amount
      }
    } catch(error) {
      await(await page[method]()).click()
      for (const number of amount.split('')) {
        await(await $(`~${number}`)).click()
        World.amount = amount
    }
  }
  }
})

When('user dismisses several attemps warning', async () => {
  const [page, method] = ClassFactory('OnboardingSeveralAttemptsWarning.ignoreButton')

  if (await(await page[method]()).isDisplayed()) await(await page[method]()).click()
})

When('user tap on checkbox {string}', async screen => {
  const [page, method] = ClassFactory(screen)
  await(await page[method]()).click()
})

When('user tap the backspace {int} times', async cant => {
  for (var i = 0; i < cant; i++) {
    await driver.pressKeyCode(67)
    timeout: 500
  }
})

When('user press backButton to return to screen {string}', async element => {
  if (driver.isAndroid === true) {
    const [page, method] = ClassFactory('TopBar.indentBackButton')
    await(await page[method]()).click()
  } else {
    switch (element) {
      case 'Ayuda en registro':
        const [page, method] = ClassFactory('TopBar.backButtonToHelpRegister')
        await(await page[method]()).click()
        break
      case '':
        //Declaraciones ejecutadas cuando el resultado de expresión coincide con el valor2
        break
    }
  }
})

When('getPageSource {string}', async (time) => { 
  if (time == null){
  await browser.pause(3000)}
  else {
  await browser.pause(time)}
  console.log(await driver.getPageSource())
})

When('user set alias on {string}', async (screen) => {
  const [page, method] = ClassFactory(screen)
  var alias = "BDS.NORBERTO."
  var random = "ABCDEFGHIJKLMNOPQRSYUVWXYZ"

  for (var i = 0; i < 5; i++)
    alias += random.charAt(Math.floor(Math.random() * random.length))
  await(await page[method]()).setValue(alias)
})


When('user toggle airplane mode', async () => {
  await driver.toggleData()
  await driver.toggleWiFi()
})

When('Whatsapp is in foreground', async () => {
  const state = await driver.queryAppState('com.whatsapp')
  if (state == 4) {
    console.log('Whatsapp is on Foreground')
  } else {
    throw new Error('Whatsapp is not running in foreground')
  }
})

When('Store is in foreground', async () => {
  const state = await driver.queryAppState('com.android.vending')
  if (state == 4) {
    console.log('Store is on Foreground')
  } else {
    throw new Error('Store is not running in foreground')
  }
})

When('return Banco del Sol App', async () => {
  await driver.background(-1)
  console.log('Current APP was closed')
  await driver.activateApp('ar.com.bdsol.bds.integration')
  console.log('return to BDS APP')
})

When('terminateApp and activateApp', async () => {
  //Reopen APP maintaining user link
  await driver.terminateApp('ar.com.bdsol.bds.integration')
  console.log('Current APP was closed')
  await driver.activateApp('ar.com.bdsol.bds.integration')
  console.log('return to BDS APP')
})

When('user set BS or local network conditions to {string}', async networkCondition => {
  const isLocal = browser.config.local
  if (isLocal == 'no') {
    //pass to browserstack predefine especific netorkprofile, see BS docs.
    if (driver.isIOS == true && networkCondition == 'airplane-mode')  {
      await updateBsAirplaneMode('no-network')
    } else {
      await updateBsAirplaneMode(networkCondition)
    } 
  } else {
    await driver.toggleData()
    await driver.toggleWiFi()
    //pause set to wait until wifi is online again
    await browser.pause(10000)
  }
  if (networkCondition == '4g-lte-good')  {
    console.log("Waiting return signal.")
    await browser.pause(20000)
  }
  
})

When('browser is in foreground', async () => {
    const state = await driver.queryAppState('com.android.chrome')
  if (state == 4) {
    console.log('Browser is on Foreground')
  } else {
    throw new Error('Browser is not running in foreground')
  }
})

/*  REFACTOR STEP PARA SOPORTA listSelectors

*/

/*STEPS STANDAR NUEVOS */
//NEW STEP
When('user scrolls up {int} percent until see {string}', async (percentage, element) => {
  const [page, method] = ClassFactory(element)
  await Gestures.swipeUpPassingPercentageUntilSeeElement([page, method], percentage / 100)
})

//1
When('user scrolls to see element {string}', async element => {
  const [page, method] = ClassFactory(element)
  await Gestures.checkIfDisplayedWithScrollDown(await page[method](), 10)
})

//2
When('user tap on {string}', async text => {
  const [page, method] = ClassFactory(text)
  await(await page[method]()).click()
})

//NO FUNCIONA EN IOS
When('user open push notifications', async () => {
await driver.openNotifications();
})

When('user tap on text {string} by OCR', async (text) =>{
 await driver.ocrWaitForTextDisplayed(text)
 await tapElementByPositionOCR(text)
})

/*Se hace doble click en el elemento ya que la lista quedaba por detras y no se veía*/
When('user double tap on {string}', async screen => {
  const element = FindElement(screen)

  await( await element).click()
  await(await element).click()
})

When('user scrolls to text {string}', async text => {
  if (driver.isAndroid === true) {
    const element = await $(`//*[@text='${text}']`)
    Gestures.checkIfDisplayedWithScrollDown(await element, 10)
  } else {
    const element = await $(`//*[@value='${text}' and @visible='true' or @name='${text}' and @visible='true' ]`)
    Gestures.checkIfDisplayedWithScrollDown(await element, 10)
  }
})

When('user tap on text {string}', async text => {
  if (driver.isAndroid === true) {
    const element = await $(`//*[@text='${text}']`)
    await element.click()
  } else {
    const element = await $(`//*[@value='${text}' and @visible='true' 
                      or @name='${text}' and @visible='true']`)
    await element.click()
  }
})

When('change wiremock scenario {string} to status {string}', async (scenario, status) => {
  
  const statusCode =  await changeScenarioStatus(scenario, status)
  expect(statusCode, 'Ocurrio un error al intentar cambiar del scenario ' + scenario + ' al estado ' + status).to.equal(200)
})


Then('user activate physical card', async () => {
  const { email, deviceId } = World
  if (driver.isAndroid) {
    const appBundleId = await driver.getCurrentPackage()
    const cardToActivate = await browser.call(async() => await getLastNumbersFromTemporarilyBlocked(email, deviceId, appBundleId))
    const [page, method] = ClassFactory('CardListScreen.cardActivateNumberTxtPosOne')
    await(await page[method]()).setValue(cardToActivate.charAt(0))
    const [page1, method1] = ClassFactory('CardListScreen.cardActivateNumberTxtPosTwo')
    await(await page1[method1]()).setValue(cardToActivate.charAt(1))
    const [page2, method2] = ClassFactory('CardListScreen.cardActivateNumberTxtPosThree')
    await(await page2[method2]()).setValue(cardToActivate.charAt(2))
    const [page3, method3] = ClassFactory('CardListScreen.cardActivateNumberTxtPosFour')
    await(await page3[method3]()).setValue(cardToActivate.charAt(3))
  } else {
    const appBundleId = 'ar.com.bdsol.bds.squads.multicolor'
    const cardToActivate = await browser.call(async() => await getLastNumbersFromTemporarilyBlocked(email, deviceId, appBundleId))
    const element2 = await $$(`//*[@label='' and @visible='true']`)
    await element2[0].setValue(cardToActivate.charAt(0))
    await element2[1].setValue(cardToActivate.charAt(1))
    await element2[2].setValue(cardToActivate.charAt(2))
    await element2[3].setValue(cardToActivate.charAt(3))
  }
})

//EXEMPLO PARAMETRIA DATOS POR AMBIENTE SOLO ES UN STEP DE EJEMPLO
When('usuario ingresa password', async () => {
  const mail = World.email.split('@')
  await userDataSetByEnvironment[`${mail[0]}`][`${TEST_ENV}`].pass.split('').forEach(async key => {
 var element = ''
  if (driver.isAndroid == true) {
    element = await $(`//*[@text='${key}']`)
  } else {
    element = await $(`~Teclado Clave Tecla ${key}`)
  }
  await element.click()
  })
})

Then('set {string} on {string}', async (value, screen) => {
  const element = FindElement(screen)
  await(await element).setValue(value)
})