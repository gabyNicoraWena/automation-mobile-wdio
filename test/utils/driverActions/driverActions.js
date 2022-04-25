const dismissAlert = () => {
  const warning = $("//*[@text='OK']")
  if (warning.isDisplayed()) warning.click()
}

export { dismissAlert }
