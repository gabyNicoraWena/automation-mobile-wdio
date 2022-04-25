export default class AppScreen {
  
  static async createObject(selector) {
    var elementos = await $$(selector)
    if(elementos.length > 1) {
      return elementos     
    } else {
      return elementos[0]
    }
  }

  constructor(selectors) {
    this.createObjects(selectors)
  }

  async createObjects(selectors) {
    Object.keys(selectors).forEach(async object => {
      await this.createObject(object, selectors[object])
    })
  }

  async createObject(key, selector) {
    this[key] = async () => await $$(selector)
  }
}
