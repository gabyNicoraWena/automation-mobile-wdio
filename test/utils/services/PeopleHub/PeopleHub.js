import axios from 'axios'

const { PEOPLE_HUB_BASE_URL } = process.env
const personsPath = '/persons'

const getPersonByEmail = async email => {
  try {
    const { data } = await axios.get(`${PEOPLE_HUB_BASE_URL}${personsPath}`, {
      params: {
        email,
      },
    })

    return data
  } catch (error) {
    return error
  }
}

const getPersonByDni = async dni => {
  try {
    const { data } = await axios.get(`${PEOPLE_HUB_BASE_URL}${personsPath}`, {
      params: {
        dni,
      },
    })

    return data
  } catch (error) {
    return error
  }
}

const getPersonById = async id => {
  try {
    const { data } = await axios.get(`${PEOPLE_HUB_BASE_URL}${personsPath}/${id}`)

    return data
  } catch (error) {
    return error
  }
}

const deletePersonById = async id => {
  try {
    await axios.delete(`${PEOPLE_HUB_BASE_URL}${personsPath}/${id}`)
  } catch (error) {
    if (error.response.status === 500) {
      await deletePersonById(id)
    }
  }
}

const getPersonDevices = async id => {
  try {
    const { data } = await axios.get(`${PEOPLE_HUB_BASE_URL}${personsPath}/${id}/devices`)

    return data
  } catch (error) {}
}

const patchMinimumRequiredData = async id => {
  await patchPerson(id, true, null, 'LOW')
}

const patchPerson = async (id, terroristChecked = undefined, terrorist = undefined, riskAssessment = undefined) => {
  if (!terroristChecked && !riskAssessment && !terrorist) {
    return
  }
  try {
    await axios.patch(`${PEOPLE_HUB_BASE_URL}${personsPath}/${id}`, {
      terroristChecked,
      terrorist,
      riskAssessment,
    })
  } catch (error) {}
}

const patchAccountStatus = async (id, status) => {
  try {
    await axios.patch(`${PEOPLE_HUB_BASE_URL}${personsPath}/${id}`, {
      accountClosed: status,
    })
  } catch (error) {}
}

const createAffidavitForPerson = async id => {
  try {
    await axios.post(`${PEOPLE_HUB_BASE_URL}${personsPath}/${id}/affidavit`, {
      fatca: false,
      type: 'UIF',
      uif: {
        checked: true,
      },
    })
  } catch (error) {}
}

const dumpCache = async id => {
  try {
    await axios.patch(`${PEOPLE_HUB_BASE_URL}${personsPath}/${id}`, {
      terroristChecked: true,
    })
    console.log(`DUMPED CACHE FOR PERSONID ${id}`)
  } catch (error) {
    console.log(error.response)
  }
}

export {
  getPersonByEmail,
  getPersonById,
  getPersonByDni,
  getPersonDevices,
  deletePersonById,
  patchMinimumRequiredData,
  createAffidavitForPerson,
  patchAccountStatus,
}
