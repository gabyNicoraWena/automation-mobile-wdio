import axios from 'axios'

const { CUSTOMERS_BASE_URL, TERMS_AND_CONDITIONS_DOCUMENT_URL } = process.env
const latestPath = '/terms/latest'

const addNewTermsAndConditions = async () => {
  const payload = {
    url: TERMS_AND_CONDITIONS_DOCUMENT_URL,
  }

  await axios.post(`${CUSTOMERS_BASE_URL}${latestPath}`, payload)
}

const getLatestTermsAndConditions = async () => {
  const { data } = await axios.get(`${CUSTOMERS_BASE_URL}${latestPath}`)
  return data._id
}

export { addNewTermsAndConditions, getLatestTermsAndConditions }
