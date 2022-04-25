import axios from 'axios'

const { SERVICE_FLOW_ORCHESTRATOR_BASE_URL } = process.env
const stateControlPath = '/servicefloworchestrator/v1/statecontrol'
const restrictionsPath = '/restrictions'

const getOrchestratorState = async personId => {
  try {
    const { data } = await axios.get(`${SERVICE_FLOW_ORCHESTRATOR_BASE_URL}${stateControlPath}`, {
      params: { personId },
    })

    return data
  } catch (error) {
    console.log(error)

    return error
  }
}

const getRestrictions = async idPerson => {
  try {
    const { data } = await axios.get(`${SERVICE_FLOW_ORCHESTRATOR_BASE_URL}${restrictionsPath}`, {
      params: { idPerson },
    })

    return data
  } catch (error) {
    console.log(error)

    return error
  }
}

const restrictions = async (
  flowType = 'VERIFY_CUSTOMER',
  idOrchestrator,
  idPerson,
  informedBy = 'ONBOARDING',
  restrictionType,
  status
) => {
  try {
    await axios.post(`${SERVICE_FLOW_ORCHESTRATOR_BASE_URL}${restrictionsPath}`, {
      flowType,
      idOrchestrator,
      idPerson,
      informedBy,
      restrictionType,
      status,
    })
  } catch (error) {
    console.log(error)
  }
}

const unlockAllRestrictions = async idPerson => {
  const personRestrictions = await getRestrictions(idPerson)

  personRestrictions.forEach(
    async restriction =>
      // eslint-disable-next-line no-return-await
      await restrictions('VERIFY_CUSTOMER', 0, idPerson, 'ONBOARDING', restriction.restrictionType, 'UNLOCK')
  )
}

const addRestriction = async (idPerson, restriction) => {
  await restrictions('VERIFY_CUSTOMER', 0, idPerson, 'ONBOARDING', restriction, 'LOCK')
}

export { unlockAllRestrictions, restrictions, addRestriction }
