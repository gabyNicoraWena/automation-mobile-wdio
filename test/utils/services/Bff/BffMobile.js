import axios from 'axios'

const { BFF_MOBILE_BASE_URL } = process.env
const mePath = '/api/me'

const setMaritalStatus = async accessToken => {
  await axios.patch(
    `${BFF_MOBILE_BASE_URL}${mePath}`,
    {
      maritalStatus: 'SINGLE',
    },
    { headers: { Authorization: `Bearer ${accessToken}` } }
  )
}

export { setMaritalStatus }
