const axios = require('axios')
const querystring = require('querystring')
const {
  WIREMOCK_BASE_URL
} = process.env

const changeScenarioStatus = async (scenario, status) => {
 
  var response = await axios.get(`${WIREMOCK_BASE_URL}/scenario/${scenario}/${status}`)
  response = await axios.get(`${WIREMOCK_BASE_URL}/scenario/${scenario}/${status}`)
  browser.pause(200)
  response = await axios.get(`${WIREMOCK_BASE_URL}/scenario/${scenario}/${status}`)
  response = await axios.get(`${WIREMOCK_BASE_URL}/scenario/${scenario}/${status}`)
  console.log("Change scenario status: \n URL: " + `${WIREMOCK_BASE_URL}/scenario/${scenario}/${status}` + "\n Scenario Name: " + scenario + "\n New status: " + status + "\n Status code: " + response.status)
  return response.status
}

export { changeScenarioStatus}