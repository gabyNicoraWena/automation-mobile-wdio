export default class AppScreen {
  
    constructor(selector) {
      this.createObject(selector)
    }
  
    async createObject(selector) {
       async () => await $(selector)
    }
  
  }