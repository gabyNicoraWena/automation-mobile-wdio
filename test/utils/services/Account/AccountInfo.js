import axios from 'axios'

import { World } from '../../../steps-definitions/World'

const {
  ACCOUNT_BASE_URL,
} = process.env
const accountInfoPath = '/accounts/me'

const getAccountData = async () => {
  const { data } = await axios.get(`${ACCOUNT_BASE_URL}${accountInfoPath}`, {
    headers: { Authorization: `Bearer ${World.actionToken}` }})

  return data
}

export {
  getAccountData
}
