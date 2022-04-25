let SCREEN_SIZE = "";

const SWIPE_DIRECTION = {
  down: {
    start: { x: 50, y: 15 },
    end: { x: 50, y: 85 }
  },
  left: {
    start: { x: 95, y: 50 },
    end: { x: 5, y: 50 }
  },
  right: {
    start: { x: 5, y: 50 },
    end: { x: 95, y: 50 }
  },
  up: {
    start: { x: 50, y: 85 },
    end: { x: 50, y: 15 }
  }
};

class Gestures {
  /**
   * Check if an element is visible and if not scroll down a portion of the screen to
   * check if it visible after a x amount of scrolls
   *
   * @param {element} element
   * @param {number} maxScrolls
   * @param {number} amount
   */
  static async checkIfDisplayedWithScrollDown(element, maxScrolls, amount = 0) {
    try {
    if (
      (!await(await element).isExisting() || !await (await element).isDisplayed()) &&
      amount <= maxScrolls
    ) {
      await this.swipeUp(0.70);
      await this.checkIfDisplayedWithScrollDown(element, maxScrolls, amount + 1);
    } else if (amount > maxScrolls) {
     throw new Error(
       `The element '${await element}' could not be found or is not visible.`
      );
    }
  } catch (error){
    console.error();
  }
  }
  
 static async checkIfDisplayedWithScrollUp(element, maxScrolls, amount = 0) {
  try {    
  if (
        (!await(await element).isExisting() || !await (await element).isDisplayed()) &&
        amount <= maxScrolls
      ) {
        await this.swipeDown(0.80);
        await this.checkIfDisplayedWithScrollUp(element, maxScrolls, amount + 1);
      } else if (amount > maxScrolls) {
       throw new Error(
         `The element '${element}' could not be found or is not visible.`
        );
      }
    } catch (error){
      console.error();
    }
  }

static async checkIfDisplayedWithScrollLeft(element, maxScrolls, amount = 0) {
  try {
    if (
      (!await(await element).isExisting() || !await (await element).isDisplayed()) &&
      amount <= maxScrolls
    ) {
      await this.swipeLeft(0.65);
      await this.checkIfDisplayedWithScrollLeft(element, maxScrolls, amount + 1);
    } else if (amount > maxScrolls) {
     throw new Error(
       `The element '${element}' could not be found or is not visible.`
      );
    }
  } catch (error) {
console.error(); 
  }
  }
  
static async checkIfDisplayedWithScrollRight(element, maxScrolls, amount = 0) {
  try {
      if (
        (!await(await element).isExisting() || !await (await element).isDisplayed()) &&
        amount <= maxScrolls
      ) {
       await this.swipeRight(1);
       await this.checkIfDisplayedWithScrollLeft(element, maxScrolls, amount + 1);
      } else if (amount > maxScrolls) {
       throw new Error(
         `The element '${element}' could not be found or is not visible.`
        );
      }
    } catch(error){
    console.error();    
    }
  }
  
  /**
   * Swipe down based on a percentage
   *
   * @param {number} percentage from 0 - 1
   */
  static async swipeDown(percentage = 1) {
    await this.swipeOnPercentage(
      this.calculateXY(SWIPE_DIRECTION.down.start, percentage),
      this.calculateXY(SWIPE_DIRECTION.down.end, percentage)
    );
  }

  /**
   * Swipe Up based on a percentage
   *
   * @param {number} percentage from 0 - 1
   */
  static async swipeUp(percentage = 1) {
    await this.swipeOnPercentage(
      this.calculateXY(SWIPE_DIRECTION.up.start, percentage),
      this.calculateXY(SWIPE_DIRECTION.up.end, percentage)
    );
  }

  /**
   * Swipe left based on a percentage
   *
   * @param {number} percentage from 0 - 1
   */
  static async swipeLeft(percentage = 1) {
    await this.swipeOnPercentage(
      this.calculateXY(SWIPE_DIRECTION.left.start, percentage),
      this.calculateXY(SWIPE_DIRECTION.left.end, percentage)
    );
  }

  /**
   * Swipe right based on a percentage
   *
   * @param {number} percentage from 0 - 1
   */
  static async swipeRight(percentage = 1) {
   await this.swipeOnPercentage(
      this.calculateXY(SWIPE_DIRECTION.right.start, percentage),
      this.calculateXY(SWIPE_DIRECTION.right.end, percentage)
    )
  }

  /**
   * Swipe from coordinates (from) to the new coordinates (to). The given coordinates are
   * percentages of the screen.
   *
   * @param {object} from { x: 50, y: 50 }
   * @param {object} to { x: 25, y: 25 }
   *
   * @example
   * <pre>
   *   // This is a swipe to the left
   *   const from = { x: 50, y:50 }
   *   const to = { x: 25, y:50 }
   * </pre>
   */
  static async swipeOnPercentage(from, to) {
    SCREEN_SIZE = SCREEN_SIZE || await driver.getWindowRect();
    const pressOptions = this.getDeviceScreenCoordinates(SCREEN_SIZE, from);
    const moveToScreenCoordinates = this.getDeviceScreenCoordinates(
      SCREEN_SIZE,
      to
    );
    await this.swipe(pressOptions, moveToScreenCoordinates);
  }

  /**
   * Swipe from coordinates (from) to the new coordinates (to). The given coordinates are in pixels.
   *
   * @param {object} from { x: 50, y: 50 }
   * @param {object} to { x: 25, y: 25 }
   *
   * @example
   * <pre>
   *   // This is a swipe to the left
   *   const from = { x: 10, y:50 }
   *   const to = { x: 80, y:50 }
   * </pre>
   */
  static async swipe(from, to) {
    await driver.touchPerform([
      {
        action: "press",
        options: from
      },
      {
        action: "wait",
        options: { ms: 1000 }
      },
      {
        action: "moveTo",
        options: to
      },
      {
        action: "release"
      }
    ]);
    await driver.pause(1000);
  }

  static async swipeUpPassingPercentageUntilSeeElement([page, method], percentage, amount = 0) {
    const maxScrolls = 10
    try {
    if (
      (!await( await page[method]()).isExisting() || !await(await page[method]()).isExisting()) &&
      amount <= maxScrolls
    ) {
      await this.swipeUp(percentage);
      await this.swipeUpPassingPercentageUntilSeeElement([page, method], percentage, amount + 1);
    } else if (amount > maxScrolls) {
     throw new Error(
       `The element '${await page[method]()}' could not be found or is not visible.`
      );
    }
  } catch(error){
    throw new Error(
      'Catch error :' + error
     );
  }
  }

  /**
   * Get the screen coordinates based on a device his screensize
   *
   * @param {number} screenSize the size of the screen
   * @param {object} coordinates like { x: 50, y: 50 }
   *
   * @return {{x: number, y: number}}
   *
   * @private
   */
  static getDeviceScreenCoordinates(screenSize, coordinates) {
     return {
      x: Math.round(screenSize.width * (coordinates.x / 100)),
      y: Math.round(screenSize.height * (coordinates.y / 100))
    };
  }

  /**
   * Calculate the x y coordinates based on a percentage
   *
   * @param {object} coordinates
   * @param {number} percentage
   *
   * @return {{x: number, y: number}}
   *
   * @private
   */
  static calculateXY({ x, y }, percentage) {
    return {
      x: x * percentage,
      y: y * percentage
    };
  }
}

export { Gestures };
