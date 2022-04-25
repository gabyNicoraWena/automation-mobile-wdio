const axios = require('axios')
const querystring = require('querystring')
const {
  INSURANCE_BASE_URL
} = process.env
const insuranceQuotePath = '/insurance-quote-manager/v1/quote/'
const insuranceATMQuotePath = '/insurance-quote-manager/v2/theft/quote/atm/'
const insuranceBolsoQuotePath = '/insurance-quote-manager/v2/theft/quote/protectedBag/'
const insurancePostalCodePath = '/insurance-postal-code/v1/locations?postalCode='

const getPlansByZipCode = async (zipCode) => {
 
  const {
      data: { Plans },
    } = await axios.post(`${INSURANCE_BASE_URL}${insuranceQuotePath}${zipCode}`)

  return Plans
}

const getCityByPostalCode = async (zipCode) => {
 
  const { data } = await axios.get(`${INSURANCE_BASE_URL}${insurancePostalCodePath}${zipCode}`)

  return data
}

const getPolicies = async (personId) => {
 
  const { data } = await axios.get(`${INSURANCE_BASE_URL}` + '/persons/' + personId + '/policies')

  return data
}

const getATMPlansByZipCode = async (zipCode) => {
 
  const { data } = await axios.post(`${INSURANCE_BASE_URL}${insuranceATMQuotePath}${zipCode}`)

  return data
}

const getBolsoPlansByZipCode = async (zipCode) => {
 
  const { data } = await axios.post(`${INSURANCE_BASE_URL}${insuranceBolsoQuotePath}${zipCode}`)

  return data
}

export { getPlansByZipCode, getCityByPostalCode, getPolicies, getATMPlansByZipCode, getBolsoPlansByZipCode }
