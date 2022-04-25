import { Given } from "@cucumber/cucumber";
import { find } from 'lodash'
import { v4 as uuid } from 'uuid'
import { FindElement } from '../../helpers/ClassFactory';
import {
  setAccountClosed,
  setMaritalStatus,
  setMaritalStatusToNull,
  setHasLoggedInFlag,
} from '../utils/databases/PeopleHub'
import { linkAccount, linkAccountToken, unlinkAllDevices } from '../utils/services/Auth/ClientsAuth'
import {
  deleteConsent,
  logOutAllSessions,
  restoreUserPasscode,
  setKeycloakUserState,
} from '../utils/services/Auth/Keycloak'
import { deletePersonById, getPersonByDni, getPersonByEmail,patchAccountStatus } from '../utils/services/PeopleHub/PeopleHub'
import {
  addRestriction,
  unlockAllRestrictions,
} from '../utils/services/ServiceFlowOrchestrator/ServiceFlowOrchestrator'
import { World } from './World'

Given('an user who is on {string}', async screen => {

  const element = FindElement(screen)
    await(await element).waitForDisplayed()
})

Given('there is a registered user with email {string}', async email => {
  const persons = await browser.call(async() => await getPersonByEmail(email))
  const person = await find(persons, { type: 'CUSTOMER' })
  const { id: personId, maritalStatus, profile } = person
  World.personId = personId

  await browser.call(async () => await unlockAllRestrictions(personId))
  await browser.call(async () => await setKeycloakUserState(personId, true))
  try {
    await browser.call(async() => await restoreUserPasscode(personId, 192837))
  } catch (error) {
    console.log('Acá va el error', error)
  }
  // browser.call(() => restoreUserPasscode(personId, 192837))
  await browser.call(async() => await logOutAllSessions(personId))
  await browser.call(async() => await unlinkAllDevices(personId))
  await browser.call(async() => await deleteConsent(personId))

  if (!maritalStatus) {
    await browser.call(async() => await setMaritalStatus(personId))
  }

  if (profile.accountClosed) {
   await patchAccountStatus(personId, false)
  }
  const appBundleId = await driver.getCurrentPackage() // Esto saca el valor de appbundleId
  const { deviceId, magicLinkBaseUrl } = World
  const actionToken = await browser.call(async() => await linkAccountToken(email, deviceId, appBundleId))

  await browser.url(`${magicLinkBaseUrl}/link-account?token=${actionToken}`)
})

Given('get login token with user email {string}', { timeout: 130000 }, async email => {
  const persons = await getPersonByEmail(email)
  const person = await find(persons, { type: 'CUSTOMER' })
  const { id: personId, maritalStatus, profile } = person
  World.personId = personId
  World.email = email

  await unlockAllRestrictions(personId)
  await setKeycloakUserState(personId, true)
  await logOutAllSessions(personId) //uncomment this block and run with VPN to unlock user from keylock
  //browser.call(() => unlinkAllDevices(personId))

  if (driver.isAndroid === true) {
    const appBundleId = await driver.getCurrentPackage() // Esto saca el valor de appbundleId
    const { deviceId, magicLinkBaseUrl } = World
    const actionToken = await linkAccountToken(email, deviceId, appBundleId)
    World.actionToken = actionToken
    await browser.url(`${magicLinkBaseUrl}/link-account?token=${actionToken}`)
  } else {
    const appBundleId = 'ar.com.bdsol.bds.squads.multicolor' // Esto saca el valor de appbundleId
    const { deviceId, magicLinkBaseUrl } = World
    const actionToken = await linkAccountToken(email, deviceId, appBundleId)
    World.actionToken = actionToken

    //driver.execute('mobile: launchApp', {bundleId: 'com.apple.mobilesafari'});
    await driver.execute('mobile: launchApp', { bundleId: 'com.google.chrome.ios' })

    const newTab = await $('~New Tab')
    const nuevoTab = await $('~Crear nueva pestaña.')
    const backButton = await $('//*[@name="Volver" or @name="Back"]')
    const urlButton2 = await $('//*[@name="Busca o escribe una URL" or @name="Search or type URL"]')


    for (let i = 0; i < 2; i++) {
      try {
        if (await newTab.isDisplayed()) {
          await newTab.click()
          break;
        } else if (await nuevoTab.isDisplayed()){
          await nuevoTab.click()
          break;
        } else if (await backButton.isEnabled()){
        await backButton.click()
        } else if (await urlButton2.isDisplayed()){
          break;
        } else {
       await browser.pause(2000) 
        }
      } catch(error){
        console.log('No se pudo ejecutar el magiclink en chrome')
      }
    } 

    const urlButton = await $('//*[@name="Busca o escribe una URL" or @name="Search or type URL"]')
    const address = await $('~Address')
    
    for (let i = 0; i < 2; i++) {
      try {
        if (await urlButton.isDisplayed() || await urlButton.isEnabled()) {
          await urlButton.click() 
          await urlButton.setValue(`${magicLinkBaseUrl}/link-account?token=${actionToken}\uE007`) 
          break;
        } else if (await address.isDisplayed()){
          await address.click() 
          await address.setValue(`${magicLinkBaseUrl}/link-account?token=${actionToken}\uE007`) 
          break;
        }
      } catch(error){
        throw new Error(
          ' No se pudo ejecutar el magiclink en chrome'
         );
      }
    } 

    const openBds = await $('~Abrir Banco del Sol')
    await openBds.click()

    const openSelector =
      "type == 'XCUIElementTypeButton' && name CONTAINS 'Abrir' || type == 'XCUIElementTypeButton' && name CONTAINS 'Open'"
    const openButton = await $(`-ios predicate string:${openSelector}`)
    if (await openButton.isDisplayed()) {
      await openButton.click()
    }
  }
})

Given('user {string} already has {int} devices linked', async (email, amountOfDevices) => {
  const persons = await browser.call(async() =>await getPersonByEmail(email))
  const person = await find(persons, { type: 'CUSTOMER' })
  const appBundleId = await driver.getCurrentPackage() 

  for (let i = 0; i < amountOfDevices; i++) {
    await browser.call(async() => await logOutAllSessions(person.id))
    await browser.call(async() => await linkAccount(email, uuid(), '192837', `modelo ${i}`, `nombre ${i}`, appBundleId))
  }
})

Given('there is no user registered with DNI {string}', async dni => {
  const persons = await browser.call(async() => await getPersonByDni(dni))

  if (persons.length > 0) {
    persons.forEach(async person => await browser.call(async() => await deletePersonById(person.id)))
  }
})

Given('there is no user registered with mail {string}', async mail => {
  const persons = await browser.call(async() => await getPersonByEmail(mail))

  if (persons.length > 0) {
    persons.forEach(async person => await browser.call(async() => await deletePersonById(person.id)))
  }
})

Given('user {string} has not declare marital status', async mail => {
  const persons = await browser.call(async() => await getPersonByEmail(mail))
  const person = await find(persons, { type: 'CUSTOMER' })

  await setMaritalStatusToNull(person.id)
})

Given('user {string} has closed his account', async mail => {
  const persons = await browser.call(async() => await getPersonByEmail(mail))
  const person = await find(persons, { type: 'CUSTOMER' })

  await browser.call(async() => await setAccountClosed(person.profile.id, true))
})

Given('user {string} has {string} restriction', async (mail, restriction) => {
  const persons = await browser.call(async() =>await getPersonByEmail(mail))
  const person = await find(persons, { type: 'CUSTOMER' })

  await browser.call(async() => await addRestriction(person.id, restriction))
})

Given('an user who never login {string}', async mail => {
  await browser.call(async() => await setHasLoggedInFlag(mail))
})

When('user wait to loading image to disappear', async () => {

  const elem = await $(`//*[@class="android.widget.ProgressBar"]`)
  try {
    await elem.waitUntil(async () => {
        return !await this.isExisting(), {
        timeout: 15000,
        timeoutMsg: 'The loading image with not disappear'
    }});
  } catch (error) {}
})