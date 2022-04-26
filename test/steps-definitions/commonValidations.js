import { Then } from "@cucumber/cucumber";
import { find } from 'lodash';
import { FindElement, ClassFactory } from '../../helpers/ClassFactory';
import { Gestures } from '../../helpers/Gestures';
import { getPlansByZipCode, getATMPlansByZipCode , getBolsoPlansByZipCode} from '../utils/services/insurance/InsuranceServices';
import { getPersonByEmail, getPersonById } from '../utils/services/PeopleHub/PeopleHub';
import { World } from './World';
import { addSeperator } from '../../helpers/utils';
import userDataSetByEnvironment from '../page-objects/dataSets'

const { TEST_ENV } = process.env
const base64 = require('base-64');

Then('user tap on menu android', async () =>  {
  await driver.pressKeyCode(3);
})

Then('user tap on {string} if see text {string}', async (tab, text) => {
  await browser.pause(3000)
  const element = await $(`//*[@text='${text}' or @name='${text}']`)
  if (await element.isDisplayed()) {
    const element = FindElement(tab)
    await(await element).click()
  }
})

Then('user is on {string}', async screen => {
  const element = FindElement(screen)
  expect(await(await element).waitForDisplayed())
})

Then('reset the app', async () => {
  await driver.reset()
})

Then('user wait to see {string}', async screen => {
  const element = await FindElement(screen)
  try {
   await (element).waitUntil(
    async () => {
     return await this.isDisplayed()
    },
    {
      timeout: 10000,
      timeoutMsg: 'expected text to be different after 10s',
    }
  )
  } catch (error){
    throw new Error('Revento el waitUntil esperando el elemento :' + screen + " Error : " + error)
  }
})


Then('User press on {string} after wait {int} seconds', { timeout: 140000 }, async (element, timeout) => {
  const object = FindElement(element)
  await(await object).waitForDisplayed({
    timeout: timeout * 1000,
    reverse: false,
  })
  await(await object).click()
})

Then('user {string} sign up request is reset', async registeredMail => {
  const persons = await browser.call(async() => await getPersonByEmail(registeredMail))
  const person = await find(persons, { type: 'LEAD' })

  expect(person.signUpRequest.onboardingState === 'MAGIC_LINK_SENT')
})

Then('user see partial text {string}', async text => {
  const element = await $(`//*[contains(@text, '${text}')]`)
  expect(await element.getText()).to.contain(text)
})

Then('user see text OCR {string}', async text => { 
  await driver.ocrWaitForTextDisplayed(text,{timeout: 30000})
  World.ocrText = await driver.ocrGetText()
})

Then('user see text on the same screen {string}', async text => {
  try {
    await expect(World.ocrText).to.contain(text)
    } catch (err) {
      await expect(World.ocrText).to.contains(text)
  }
  
})

Then('user verifies that the copied value is {string}', async text => {
  await browser.pause(3000)
  var clipboard = base64.decode(driver.getClipboard());
  expect(clipboard).to.contain(text)
})

Then('user do not see label {string}', async screen => {
  const [page, method] = ClassFactory(screen)
  expect(false, 'Elemento es mostrado cuando no debería').to.equal(await(await page[method]()).isDisplayed())
})

Then('user see the {int} plan into header screen from zipcode {string}', async (planId, zipcode) => {
  const plans = await browser.call(async() => await getPlansByZipCode(zipcode))
  var plan = "PLAN " + plans[planId-1].ModuleDescription;
  var value = "" + plans[planId-1].PremioMensual;
  
  if (driver.isAndroid === true) {
    var element = await $(`//*[@text = '${plan}']`)
    expect(await element.isDisplayed()).to.equal(true)
    element = await $(`//*[*[@text = '${plan}']]/*[2]`)
    var elementValue = await element.getText()
    expect(elementValue.replace(/[$.]/g,'')).to.contain(value)
  } else {
    switch (planId) {
      case 2:
        planId = 3
        break
      case 3:
        planId = 5
        break
    }
    var element = await $(`//*[*[*[@type = "XCUIElementTypeStaticText" and contains(@name, "Tu")]]]/*[2]/*/*/*[${planId}]`)
    expect(await element.getText()).to.contains(plan)
    expect(await element.getText()).to.contains(value)
  }
})

Then('user view the plan details for zipcode {string}', async (zipcode) => {
  
  const plans = await browser.call(async() => await getPlansByZipCode(zipcode))
  var planItemDescription = "";
  var planItemValue = "";
  var planValue = await $$(`//*[*[@text="PAGO MENSUAL"]]/*[1]`)
  var elementText = await (await planValue[0]).getText()
  expect(elementText.replace(/[$.]/g,''), `The plan value incorrect.`).to.contains(plans[0].PremioMensual)
  var scrollCount = 0;
  for (let i = 0; i < plans[0].FinallyCalculationResult.length; i++) { 
    if(plans[0].FinallyCalculationResult[i].DetalleInt != 11 &&
      plans[0].FinallyCalculationResult[i].DetalleInt != 12 &&
      plans[0].FinallyCalculationResult[i].DetalleInt != 13 &&
      plans[0].FinallyCalculationResult[i].DetalleInt != 16 &&
      plans[0].FinallyCalculationResult[i].DetalleInt != 22 &&
      plans[0].FinallyCalculationResult[i].TipoDetalle == "Cobertura") {
      planItemDescription = plans[0].FinallyCalculationResult[i].Descripcion
      planItemValue = "" + plans[0].FinallyCalculationResult[i].Capital
      if(scrollCount == 5) {
        await Gestures.swipeUp(0.50)
        scrollCount = 0
      } else {
        scrollCount++
      }
      var title = await $$(`~${planItemDescription}`)
      var titleElement = await title[0]
      var value = await $(`~Monto a cubrir de ${planItemDescription}`)
      expect(true, `Can not see details for item "${planItemDescription}"`).to.equal(await titleElement.isDisplayed())
      if(plans[0].FinallyCalculationResult[i].Capital > 1) {
        var coverageValue = await value.getText()
        expect((await coverageValue).replace(/[$.]/g,''), `Error in the value for item "${planItemDescription}"`).to.contains(planItemValue)
      }
    }
  }
})


/*STEPS CORREGIDOS / NUEVOS*/
//1

Then('user views the detail of the {int} plan for zip code {string}', async (planId, zipcode) => {

  var planIndex = planId - 1
  const plans = await browser.call(async() => await getPlansByZipCode(zipcode))
  var plan = plans[planIndex].ModuleDescription
  if (driver.isAndroid === true) {
    expect(await(await $(`//*[@text='PLAN ${plan}']`)).isDisplayed()).to.equal(true)
    var value = "" + plans[planIndex].PremioMensual;
    var element = await $(`//*[*[@text='${plan}']]//*[@index="3"]`)
    var elementValue = await element.getText()
    expect(elementValue.replace(/[$.]/g,'')).to.contains(value)
    value = "" + plans[planIndex].FinallyCalculationResult[0].Capital;
    elementValue = await $(`//*[*[@text='${plan}']]//*[@index="4"]//*[contains(@text, "$")]`).getText()
    var pageValue = elementValue.replace("$",'').replace(/[$.]/g,'')
    expect(pageValue.trim()).to.equal(value)
    value = "" + plans[planIndex].FinallyCalculationResult[8].Capital;
    elementValue = await $(`//*[*[@text='${plan}']]//*[@index="5"]//*[contains(@text, "$")]`).getText()
    pageValue = elementValue.replace("$",'').replace(/[$.]/g,'')
    expect(pageValue.trim()).to.equal(value)
  } else {
    expect(await(await $(`//*[@value='${plan}']`).isDisplayed())).to.equal(true)
    var value = "" + plans[planIndex].PremioMensual;
    var elemet = await $(`//*[*[*[@value = '${plan}']]]/*[2]/*[2]`)
    expect(await elemet.getText()).to.contains(value)
    value = "" + plans[planIndex].FinallyCalculationResult[0].Capital;
    var pageValue = await(await $(`//*[*[*[*[@value = '${plan}']]]]/*[2]/*[1]`).getText()).replace("$",'').replace(/[$.]/g,'')
    expect(pageValue.trim()).to.contains(value)
    value = "" + plans[planIndex].FinallyCalculationResult[8].Capital;
    pageValue = await(await $(`//*[*[*[*[@value = '${plan}']]]]/*[2]/*[2]`).getText()).replace("$",'').replace(/[$.]/g,'')
    expect(pageValue.trim()).to.contains(value)
  }

})

Then('user see text on screen {string}', async object => {
  const element =  FindElement(object)
  await wdioExpect(await (await element)).toExist({ wait: 30000, message: 'No se encontro el elemento o texto : ' + element + ' en la vista' })
})

Then('user capture balance {string}', async screen=> {
  const element = await FindElement(screen)
  if (driver.isAndroid) {
  World.balance = await(await element).getText()
  World.balance = World.balance.replace(/[Saldo: $ ]/g,'').trim()  
  World.balance = World.balance.replace(".","");
  World.balance = World.balance.replace(",","."); 
  } else {
    var balance = await(await element).getText()
    balance = balance.replace(/[Caja de Ahorro en Pesos Saldo: $ ]/g,'').trim()  
    balance = balance.replace(".","");
    World.balance = balance.replace(",",".");
  }
})

Then('user check balance', async ()=> {  
  var saldoActual = ''
  if (World.txInProcess){
    saldoActual = World.balance
  } else {
    saldoActual = World.balance - parseFloat(World.amount)
  }
  saldoActual = addSeperator(saldoActual)
  var element = ''
  if (driver.isAndroid){
  var element = await $(`//*[contains(@text, '${saldoActual}')]`)
  } else {
  var element = await $(`//*[contains(@name, '${saldoActual}') and (not(contains(@name, 'ingresar o extraer dinero')))]/XCUIElementTypeOther`)
  }
  expect(await element.isDisplayed()).to.equal(true)
})

Then('user tap push notifications on screen {string}', async element => {  
  try{
  const element = FindElement(element)
  await wdioExpect(await(await element)).toExist({ wait: 30000, message: 'No se encontro el elemento o texto : ' + element + ' en la vista' })
  }  catch (error)
  {await driver.back();}
})


Then('user cant see {string}', async screen => {
  const element = FindElement(screen)
  expect(false, 'Elemento es mostrado cuando no debería').to.equal(await( await element).isDisplayed())
})


Then('Samsung phone app is in foreground', () => {
  const state = driver.queryAppState('com.samsung.android.dialer')
  console.log(state)
  if (state == 4) {
    console.log('Phone App is on Foreground')
  } else {
    throw new Error('Phone App is not running in foreground')
  }
})

Then('the screen contains the policy number', async () => {
  expect(await $('//*[contains(@text, "Número de Póliza")]').getText(), "El numero de la poliza es incorrecto").to.contains(World.policySelected)
})

Then('check user data into atm confirm screen by zipcode {string}', async (zipcode) => {

  const plans = await getATMPlansByZipCode(zipcode)
  const mail = World.email.split('@')[0]
  var cbu = userDataSetByEnvironment[`${mail}`][`${TEST_ENV}`].cbu
  var planValueElement = await (await FindElement("InsuranceATMConfirmPolicy.txtPlanValue")).getText()
  var planValue = await planValueElement.replace("$",'').replace(/[$.]/g,'')
  expect(await planValue).to.contain(("" + plans.Plans[0].PremioMensual))
  var coverageValueElement = await (await FindElement("InsuranceATMConfirmPolicy.txtCoverageAmountValue")).getText()
  var coverageValue = await coverageValueElement.replace("$",'').replace(/[$.]/g,'')
  expect(await coverageValue).to.contain(("" + plans.Plans[0].FinallyCalculationResult[0].Capital))
  await Gestures.swipeUp(0.50)
  var wayToPayValueValue = await (await FindElement("InsuranceATMConfirmPolicy.txtWayToPay")).getText()
  expect(await wayToPayValueValue).to.contain(cbu)
  var mailValue = await (await FindElement("InsuranceATMConfirmPolicy.txtEmailValue")).getText()
  expect(await mailValue).to.contain(World.email)
})