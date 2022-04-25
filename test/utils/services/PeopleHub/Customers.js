import axios from 'axios'
import { find } from 'lodash'

const { TEST_ENV } = process.env
const CUSTOMERS_BASE_URL  = `https://customers-${TEST_ENV}.bdsdigital.com.ar`
const restrictionsPath = '/restrictions?idPerson='


const getCustomerRestrictions = async (personId, restriction) => {
  try {
  const { data } = await axios.get(`${CUSTOMERS_BASE_URL}${restrictionsPath}${personId}`)
  const restrictions = find(data, { restrictionType: restriction })
  return restrictions.restrictionType
  } catch (error) {
    console.log(error)

    return error
  }
}

export { getCustomerRestrictions }