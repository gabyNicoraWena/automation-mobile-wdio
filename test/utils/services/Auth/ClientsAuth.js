import axios from 'axios'

import { getPersonDevices } from '../PeopleHub/PeopleHub'
import { World } from '../../../steps-definitions/World'


const {
  AUTH_BASE_URL,
  TEST_ENV,
  BFF_LINK_ACCOUNT_TOKEN_PATH,
  BFF_MOBILE_BASE_URL,
  BFF_LINK_ACCOUNT_PATH,
  BFF_SIGNIN_PATH,
} = process.env
const linkAccountTokenPath = '/auth/v1/link-account-token'
const resetPasscodeTokenPath = '/auth/v1/reset-passcode-token'
const linkAccountPath = '/auth/v1/link-account'
const unlinkAccountPath = '/auth/v1/unlink-account'
const signInPath = '/auth/v1/sign-in'
const signOutPath = '/auth/v1/sign-out'

const bffSignIn = async (email, deviceId, appBundleId) => {
  try {
    const passcode = World.passcode
    const offlineToken = await bffLinkAccount(email, deviceId, appBundleId)
    const {
      data: { accessToken },
    } = await axios.post(`${BFF_MOBILE_BASE_URL}${BFF_SIGNIN_PATH}`, {
      email,
      offlineToken,
      passcode,
      deviceId,
    })
    return accessToken
  } catch (error) {
    console.log('Error al obtener AccessToken' + error.response?.data)
  }
}

const bffLinkAccount = async (email, deviceId, appBundleId) => {
  try {
    const passcode = '192837'
    const model = 'model'
    const name = 'name'
    const actionToken = await linkAccountToken(email, deviceId, appBundleId)

    const body = {
      passcode,
      actionToken,
      device: {
        uid: deviceId,
        model,
        name,
        ipAddress: '10.0.0.0',
      },
    }

    const {
      data: { offlineToken },
    } = await axios.post(`${BFF_MOBILE_BASE_URL}${BFF_LINK_ACCOUNT_PATH}`, body)

    return offlineToken
  } catch (error) {
    console.log('Error al obtener offlineToken' + error.response?.data)
  }
}

const linkAccountToken = async (email, deviceId, appBundleId) => {
  try {
    const {
      data: { actionToken },
    } = await axios.post(`${BFF_MOBILE_BASE_URL}${BFF_LINK_ACCOUNT_TOKEN_PATH}`, {
      // A través de la variable AUTH_BASE_URL se pasa el BFF requerido
      deviceId,
      email,
      appBundleId: appBundleId || `ar.com.bdsol.bds.squads.${TEST_ENV}`,
      // appBundleId: TEST_ENV === 'int' ? 'ar.com.bdsol.bds.squads.integration' : `ar.com.bdsol.bds.squads.${TEST_ENV}`,
    })
    return actionToken
  } catch (e) {
    console.log('Error al obtener ActionToken' + e.response?.data)
  }
}

const linkAccount = async (email, deviceId, passcode, model = 'model', name = 'name', appBundleId) => {

  let headers = {
    'bds-device': '8d3f7863-bb9a-4c00-b685-fc8cc01b6251',
    'bds-device-name': `${name}`,
    'bds-device-os': 'testOs',
    'bds-ip': '189.768.23.2',
    'bds-device-model': `${model}`,
    'Content-Type': 'application/json',
}
    const actionToken = await linkAccountToken(email, deviceId, appBundleId)
    const body = {
      actionToken,
      passcode,
      device: {
        uid: deviceId,
        model,
        name,
        ipAddress: '10.0.0.0',
      },
    }

    try {

    const { data } = await axios.post(`${AUTH_BASE_URL}${linkAccountPath}`, body, { headers: headers })

    return data
  } catch (error) {
    console.log(error.response?.data)
  }
}

const signIn = async (email, deviceId, passcode, offlineToken) => {
  try {
    const { data } = await axios.post(`${AUTH_BASE_URL}${signInPath}`, {
      email,
      deviceId,
      passcode,
      offlineToken,
    })
    return data
  } catch (error) {
    console.log(error.response?.data)
  }
}

const signOut = async refreshToken => {
  try {
    await axios.post(`${AUTH_BASE_URL}${signOutPath}`, { refreshToken })
  } catch (error) {
    console.log(error.response?.data)
  }
}

const updatePasscodeToken = async (email, deviceId) => {
  return resetPasscodeToken(email, deviceId, 'UPDATE_PASSCODE')
}

const unlockPasscodeToken = async (email, deviceId) => {
  return resetPasscodeToken(email, deviceId, 'UNLOCK_PASSCODE')
}

const resetPasscodeToken = async (email, deviceId, operationType) => {
  try {
    const {
      data: { resetPasscodeToken },
    } = await axios.post(`${AUTH_BASE_URL}${resetPasscodeTokenPath}`, {
      email,
      deviceId,
      appBundleId: TEST_ENV === 'int' ? 'ar.com.bdsol.bds.squads.integration' : `ar.com.bdsol.bds.squads.${TEST_ENV}`,
      operationType,
    })

    return resetPasscodeToken
  } catch (e) {
    console.log(e.response?.data)
  }
}

const unlinkAllDevices = async personId => {
  try {
    const devices = await getPersonDevices(personId)
    if (devices.length > 0) {
      devices.forEach(async device => {
        const { uid, offlineToken } = device
        await unlinkAccount(uid, offlineToken)
      })
    }
  } catch (error) {
    if (error.response.status > 400) unlinkAllDevices(personId)
  }
}

const unlinkAccount = async (deviceId, offlineToken) => {
  try {
    await axios.post(`${AUTH_BASE_URL}${unlinkAccountPath}`, {
      deviceId,
      offlineToken,
    })
  } catch (error) {}
}

export {
  linkAccountToken,
  resetPasscodeToken,
  unlockPasscodeToken,
  updatePasscodeToken,
  linkAccount,
  signIn,
  signOut,
  unlinkAllDevices,
  bffSignIn,
}
