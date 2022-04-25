import axios from 'axios'

const { PEOPLE_WHITELIST_BASE_URL } = process.env
const whitelistPath = '/whitelist'

const addIdentityToWhitelist = async identity => {
  try {
    await axios.post(`${PEOPLE_WHITELIST_BASE_URL}${whitelistPath}`, {
      identity,
    })
  } catch (error) {}
}

const removeIdentityFromWhitelist = async identity => {
  try {
    await axios.delete(`${PEOPLE_WHITELIST_BASE_URL}${whitelistPath}/${identity}`)
  } catch (error) {}
}

export { addIdentityToWhitelist, removeIdentityFromWhitelist }
