import { After, Status } from '@wdio/cucumber-framework';

After(function (scenarioResult) {
  if (scenarioResult.status === Status.FAILED) {
    // Attach the original state
    const screenshot = browser.saveScreenshot();
    world.attach(screenshot, 'image/png');
  }

  return Promise.resolve(scenarioResult.status);
});