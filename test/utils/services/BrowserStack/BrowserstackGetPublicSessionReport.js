const axios = require('axios')
const { URL_APP_AUTOMATE_SESSION_BS, BS_BAE64_CREDENTIAL} = process.env

const getPublicUrlSessionReport = async (sessionId) =>{
  const url = URL_APP_AUTOMATE_SESSION_BS + sessionId + '.json'
  const headers = {
    Authorization: BS_BAE64_CREDENTIAL 
    }
  try {
    const { data } = await axios.get(url, { headers })
    console.log("Get session Public URL from broweserStack: " + data.automation_session.public_url)
    return data.automation_session.public_url
  } catch (error) {
    console.log(error)
  }
}

module.exports = (getPublicUrlSessionReport)
