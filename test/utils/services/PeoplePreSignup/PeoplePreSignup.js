import axios from 'axios'
import { facephiImageTokens } from '../../../constants/Onboarding/OnboardingTokens'
import { getLatestTermsAndConditions } from '../TermsAndConditions/TermsAndConditions'

const { PEOPLE_PRE_SIGNUP_BASE_URL, TEST_ENV } = process.env
const signUpRequestPath = '/sign-up-requests'
const onboardingPath = '/onboarding/v1/signup-requests'
const increaseRenaperWrongFaceMatchPath = '/increase-renaper-wrong-face-match-count'
const increaseFacephiWrongFaceMatchPath = '/increase-facephi-wrong-face-match-count'

const patchImagesUrls = async personId => {
  try {
    await axios.patch(`${PEOPLE_PRE_SIGNUP_BASE_URL}${signUpRequestPath}/${personId}`, {
      faceUrl:
        'https://firebasestorage.googleapis.com/v0/b/bds-7de15.appspot.com/o/development%2Fonboarding%2Fimages%2Ffaces%2F74?alt=media&token=036e7537-4fa2-415c-b56a-c16c8c84062f',
      idFrontUrl:
        'https://firebasestorage.googleapis.com/v0/b/bds-7de15.appspot.com/o/development%2Fonboarding%2Fimages%2Fids%2Ffront%2F74?alt=media&token=5b9d7c0c-7340-4c8e-8fc1-0368916f62ef',
      idBackUrl:
        'https://firebasestorage.googleapis.com/v0/b/bds-7de15.appspot.com/o/development%2Fonboarding%2Fimages%2Fids%2Fback%2F74?alt=media&token=83665b6f-e62b-4423-9d3b-16a7ccbe1c80',
    })
  } catch (error) {}
}

const validateCustomerVeracity = async personId => {
  try {
    const { data } = await axios.post(
      `${PEOPLE_PRE_SIGNUP_BASE_URL}/onboarding/v1/signup-requests/${personId}/validate-biometry-manually`,
      {
        idNumber: '30197992',
        gender: 'M',
        order: '00338405708',
        manualOnboardingByUser: 'testUser',
        nationality: 'ARG',
      }
    )

    return data
  } catch (error) {
    return error
  }
}

const patchIdentityVerified = async personId => {
  await patchOnboardingState(personId, 'IDENTITY_VERIFIED')
}

const patchOnboardingState = async (personId, onboardingState) => {
  try {
    await axios.patch(`${PEOPLE_PRE_SIGNUP_BASE_URL}${onboardingPath}/${personId}`, { onboardingState })
  } catch (error) {}
}

const getVerifyEmailToken = async (deviceId, documentNumber, email) => {
  try {
    const { data } = await axios.post(`${PEOPLE_PRE_SIGNUP_BASE_URL}${onboardingPath}`, {
      fromLinkAccount: false,
      appBundleId: TEST_ENV === 'int' ? 'ar.com.bdsol.bds.squads.integration' : `ar.com.bdsol.bds.squads.${TEST_ENV}`,
      deviceId,
      documentNumber,
      email,
    })

    return data.token
  } catch (error) {}
}

const acceptLatestTermsAndConditions = async personId => {
  const termsVersion = await getLatestTermsAndConditions()

  try {
    await axios.patch(`${PEOPLE_PRE_SIGNUP_BASE_URL}${signUpRequestPath}/${personId}`, {
      termsAccepted: {
        termsVersion,
      },
    })
  } catch (error) {}
}

const increaseRenaperWrongFaceMatch = async personId => {
  try {
    await axios.post(
      `${PEOPLE_PRE_SIGNUP_BASE_URL}${signUpRequestPath}/${personId}${increaseRenaperWrongFaceMatchPath}`
    )
  } catch (error) {}
}

const increaseFacephiWrongFaceMatch = async personId => {
  try {
    await axios.post(
      `${PEOPLE_PRE_SIGNUP_BASE_URL}${signUpRequestPath}/${personId}${increaseFacephiWrongFaceMatchPath}`
    )
  } catch (error) {}
}

export {
  patchImagesUrls,
  validateCustomerVeracity,
  patchIdentityVerified,
  getVerifyEmailToken,
  acceptLatestTermsAndConditions,
  increaseRenaperWrongFaceMatch,
  increaseFacephiWrongFaceMatch,
}
