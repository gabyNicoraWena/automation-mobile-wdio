/* eslint-disable */
const SELECTORS = {
  ANDROID: {
    TEXT: "*//android.widget.TextView",
    TEXT_FIELD: "*//android.widget.EditText"
  },
  IOS: {
    GENERIC_TEXT: null,
    TEXT_ELEMENT: "-ios predicate string:type == 'XCUIElementTypeStaticText'"
  }
};

/**
 * Get the text of an element (including all child elements)
 *
 * @param {element} element
 * @param {boolean} isXpath
 *
 * @return {string}
 */
export function getTextOfElement(element, isXpath = false) {
  let visualText;

  try {
    if (driver.isAndroid) {
      visualText = element
        .$$(SELECTORS.ANDROID.TEXT)
        .reduce((currentValue, el) => `${currentValue} ${el.getText()}`, "");
    } else {
      const iosElement = isXpath
        ? element.$$(SELECTORS.IOS.TEXT_ELEMENT)
        : element;

      if (isXpath) {
        visualText = element
          .$$(SELECTORS.IOS.TEXT_ELEMENT)
          .reduce((currentValue, el) => `${currentValue} ${el.getText()}`, "");
      } else {
        visualText = iosElement.getText();
      }
    }
  } catch (e) {
    visualText = element.getText();
  }

  return visualText.trim();
}

/**
 * Get the time difference in seconds
 *
 * @param {number} start    the time in milliseconds
 * @param {number} end      the time in milliseconds
 */
export function timeDifference(start, end) {
  const elapsed = (end - start) / 1000;
  console.log("elapsed = ", elapsed, " seconds");
}

 const keyPress = async (number) => {
         var keyCode = 0;
         for (const num of number.split('')) {
           switch (num) {
            case '0': await driver.pressKeyCode(7); break;
            case '1': await driver.pressKeyCode(8); break;
            case '2': await driver.pressKeyCode(9); break;
            case '3': await driver.pressKeyCode(10); break;
            case '4': await driver.pressKeyCode(11); break;   
            case '5': await driver.pressKeyCode(12); break;  
            case '6': await driver.pressKeyCode(13); break;    
            case '7': await driver.pressKeyCode(14); break;    
            case '8': await driver.pressKeyCode(15); break; 
            case '9': await driver.pressKeyCode(16); break;             
           }
         }
}

/**
 * tap element on finding by position.
 *
 * @param {string} text 
 */

const tapElementByPositionOCR = async (text) => {
  var position = await driver.ocrGetElementPositionByText(text)
  await driver.touchAction({
    action: 'tap',
    x: position.originalPosition.left,
    y: position.originalPosition.top
  })
}

/**
 * Order arrays
 *
 * @param {array} to return in correct order
 */

async function asyncForEach(array, callback) {
  for (let index = 0; index < array.length; index++) {
    await callback(array[index], index, array);
  }
}

function addSeperator(nStr){
  
  nStr += '';
  var x = nStr.split('.');
  var x1 = x[0];
  var x2 = x.length > 1 ? ',' + x[1] : '';
  var rgx = /(\d+)(\d{3})/;
  while (rgx.test(x1)) {
    x1 = x1.replace(rgx, '$1' + '.' + '$2');
  }
  return x1 + x2;
}

export {keyPress, tapElementByPositionOCR, asyncForEach,addSeperator}