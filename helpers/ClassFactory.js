import AppScreen from '../test/page-objects/App.screen'
import listSelectors from '../test/page-objects/listSelectors'

const pickSelectorsByClassName = name => listSelectors[name]

export const ClassFactory =  name => {
  
  var [classname, method] = name.split('.')

  var pageSelectors = pickSelectorsByClassName(classname)

  if (pageSelectors[method] == null) {

    if (driver.isAndroid == true) {
      method += "_Android"
    } else {
      method += "_iOS"
    }
  }

  return [new AppScreen(pageSelectors), method]
}

export const FindElement = async name => {
  
  var [page, element] = name.split('.')

  var pageSelectorsJson = pickSelectorsByClassName(page)

  if (pageSelectorsJson[element] == null) {

    if (driver.isAndroid == true) {
      element += "_Android"
    } else {
      element += "_iOS"
    }
  }

  return await AppScreen.createObject(pageSelectorsJson[element])
}