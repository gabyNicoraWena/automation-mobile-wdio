import listSelectors from '../test/page-objects/listSelectors'

const pickSelectorsByClassName = name => listSelectors[name]

const createObject = async selector => {
  var elementos = await $$(selector)
  if(elementos.length > 1) {
    return elementos     
  } else {
    return elementos[0]
  }
}

export const FindElement = async name => {
  
  var [page, element] = name.split('.')

  var elementSelectors = pickSelectorsByClassName(page)

  if (elementSelectors[element] == null) {

    if (driver.isAndroid == true) {
      element += "_Android"
    } else {
      element += "_iOS"
    }
  }

  return createObject(elementSelectors[element])
}

