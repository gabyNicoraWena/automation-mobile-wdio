/* eslint-disable consistent-return */
/* eslint-disable camelcase */
import querystring from 'querystring'

import axios from 'axios'
import { encode } from 'base-64'
import { find } from 'lodash'

const { CLIENTS_AUTH_SECRET_KEY, TEST_ENV, KEYCLOAK_BASE_URL } = process.env
const authTokenPath = `/auth/realms/bds-${TEST_ENV}/protocol/openid-connect/token`
const changePasscodePath = `/auth/realms/bds-${TEST_ENV}/change-password`
const adminPath = `/auth/admin/realms/bds-${TEST_ENV}/users`
const consentsPath = '/consents/clients-auth-signup'

const restoreUserPasscode = async (username, passcode) => {
  try {
    await changeUserPasscode(username, passcode)
  } catch (error) {
    await changeUserPasscode(username, 908070 + Math.round(Math.random() * 100))
    await changeUserPasscode(username, 807060 + Math.round(Math.random() * 100))
    await changeUserPasscode(username, 706050 + Math.round(Math.random() * 100))
    await changeUserPasscode(username, passcode)
  }
}

const changeUserPasscode = async (username, password) => {
  try {
    const headers = await getHeaderConfig()

    const payload = {
      username,
      password,
    }

    return await axios.post(`${KEYCLOAK_BASE_URL}${changePasscodePath}`, payload, { headers })
  } catch (error) {
    throw new Error(error.response.data)
  }
}

const setKeycloakUserState = async (username, enabled) => {
  try {
    const headers = await getHeaderConfig()

    const { id } = await getKeycloakUserInfo(username)

    const body = { enabled }

    await axios.put(`${KEYCLOAK_BASE_URL}${adminPath}/${id}`, body, {
      headers,
    })
  } catch (error) {
    throw new Error('enableKeycloakUser: ', error.response.data)
  }
}

const deleteConsent = async username => {
  try {
    const headers = await getHeaderConfig()

    const { id } = await getKeycloakUserInfo(username)

    await axios.delete(`${KEYCLOAK_BASE_URL}${adminPath}/${id}${consentsPath}`, { headers })
  } catch (error) {}
}

const logOutAllSessions = async username => {
  try {
    const headers = await getHeaderConfig()

    const { id } = await getKeycloakUserInfo(username)

    await axios.post(`${KEYCLOAK_BASE_URL}${adminPath}/${id}/logout`, null, {
      headers,
    })
  } catch (error) {
    throw new Error('logOutAllSessions: ', error.response.data)
  }
}

const getKeycloakUserInfo = async username => {
  try {
    const headers = await getHeaderConfig()

    const { data } = await axios.get(`${KEYCLOAK_BASE_URL}${adminPath}?username=${username}`, { headers })

    return find(data, { username: username.toString() })
  } catch (error) {
    throw new Error('getKeycloakUserInfo: ', error.response.data)
  }
}

const getHeaderConfig = async () => {
  try {
    const { access_token } = await getKeycloakAuthToken()

    const headers = {
      Authorization: `Bearer ${access_token}`,
      'Content-Type': 'application/json',
    }

    return headers
  } catch (error) {}
}

const getKeycloakAuthToken = async () => {
  const token = encode(`clients-auth-signup:${CLIENTS_AUTH_SECRET_KEY}`)

  const headers = {
    Authorization: `Basic ${token}`,
    'content-type': 'application/x-www-form-urlencoded',
  }

  const body = {
    grant_type: 'client_credentials',
    client_id: 'clients-auth-signup',
  }

  const { data } = await axios.post(`${KEYCLOAK_BASE_URL}${authTokenPath}`, querystring.stringify(body), { headers })

  return data
}

export { changeUserPasscode, restoreUserPasscode, setKeycloakUserState, logOutAllSessions, deleteConsent }
