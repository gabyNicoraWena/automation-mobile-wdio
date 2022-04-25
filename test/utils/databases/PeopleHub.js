import axios from 'axios'
import { createConnection } from 'mysql'
import { v4 as uuid } from 'uuid'

const { PEOPLE_HUB_BASE_URL } = process.env
const personsPath = '/persons'

const {
  PEOPLE_HUB_SQL_HOST: host,
  PEOPLE_HUB_SQL_USER: user,
  PEOPLE_HUB_SQL_PASSWORD: password,
  TEST_ENV,
} = process.env

const dumpCache = async id => {
  // TODO: VER WORKAROUND MAS PROLIJO
  try {
    await axios.patch(`${PEOPLE_HUB_BASE_URL}${personsPath}/${id}`, {
      terroristChecked: true,
    })
    console.log(`DUMPED CACHE FOR PERSONID ${id}`)
  } catch (error) {
    console.log(error)
  }
}

const buildConnection = () =>
  createConnection({
    host,
    user,
    password,
    database: `people_hub_${TEST_ENV}`,
    ssl: {
      rejectUnauthorized: false,
    },
  })

const setMaritalStatusToNull = async id => {
  const connection = buildConnection()

  console.log('UPDATING MARITAL STATUS FOR PERSONID ', id)

  await connection.query('UPDATE person SET marital_status=NULL where id=? ', [id], error => {
    if (error) {
      console.log(error)
    }
  })

  await dumpCache(id)
  connection.end()
}

const setMaritalStatus = async id => {
  const connection = buildConnection()

  console.log('UPDATING MARITAL STATUS FOR PERSONID ', id)

  await connection.query('UPDATE person SET marital_status=? where id=? ', ['SINGLE', id], error => {
    if (error) {
      console.log(error)
    }
  })

  await dumpCache(id)
  connection.end()
}

const setAccountClosed = async (profileId, closed) => {
  const connection = buildConnection()

  const account_closed = closed ? 1 : 0

  await connection.query('UPDATE profile SET account_closed = ? WHERE id=?', [account_closed, profileId], error => {
    if (error) console.log(error)
  })

  await dumpCache(profileId)
  connection.end()
}

const updateSignUpRequestDeviceId = async (id, signUpRequestId) => {
  const connection = buildConnection()

  await connection.query('UPDATE sign_up_request set device_id=? where id=?', [uuid(), signUpRequestId], error => {
    if (error) {
      console.log(error)
    }
  })

  await dumpCache(id)
  connection.end()
}

const deleteAffidavits = async id => {
  const connection = buildConnection()

  await connection.query('DELETE FROM affidavit where profile_id=? ', [id], error => {
    if (error) {
      console.log(error)
    }
  })

  connection.end()
}

const setHasLoggedInFlag = async mail => {
  const connection = buildConnection()

  console.log('UPDATING HAS LOGGED IN TO 0 FOR USERNAME ', mail)

  await connection.query('UPDATE profile SET has_logged_in=0 where username=? ', [mail], error => {
    if (error) {
      console.log(error)
    }
  })

  connection.end()
}

export {
  setMaritalStatus,
  setMaritalStatusToNull,
  deleteAffidavits,
  updateSignUpRequestDeviceId,
  setAccountClosed,
  setHasLoggedInFlag,
}
