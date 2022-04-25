const axios = require('axios')
const { URL_UPDATE_WIFI_MODE_BS, BS_BAE64_CREDENTIAL, URL_APP_AUTOMATE_SESSION_BS } = process.env

const updateBsAirplaneMode = async (networkCondition) => {
  const url = URL_UPDATE_WIFI_MODE_BS + browser.sessionId + '/update_network.json'
  const body = { networkProfile: `${networkCondition}` }
  const headers = {
    Authorization: BS_BAE64_CREDENTIAL,
    'Content-Type': 'application/json',
  }
  try {
    const { data } = await axios.put(url, body, { headers })
    return data
  } catch (error) {
    console.log(error)
  }
}

module.exports = (updateBsAirplaneMode)
