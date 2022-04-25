require('dotenv').config()
import { bffSignIn } from '../Auth/ClientsAuth'
const axios = require('axios')
const { find } = require('lodash')
const { BFF_MOBILE_BASE_URL, BFF_GET_DEBIT_CARDS } = process.env
const TEST_ENV = 'int'
// TEMPORARILY BLOCKDED

const getLastNumbersFromTemporarilyBlocked = async (email, deviceId, appBundleId) => {
  try {
    const accessToken = await bffSignIn(email, deviceId, appBundleId)

    const { data } = await axios.get(`${BFF_MOBILE_BASE_URL}${BFF_GET_DEBIT_CARDS}`, {
      headers: { Authorization: `Bearer ${accessToken}` },
    })

    const { cardNumber } = find(data, { providerStatus: 'TEMPORARILY BLOCKED', cardType:"PHYSICAL" })
    const lastdigits = cardNumber.substring(cardNumber.length - 4)
    return lastdigits
  } catch (e) {
    console.log(e.response.data)
    return
  }
}

export { getLastNumbersFromTemporarilyBlocked }
