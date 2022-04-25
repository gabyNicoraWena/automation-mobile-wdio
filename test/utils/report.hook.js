import Cucumber, { defineSupportCode } from '@wdio/cucumber-framework';
import { ensureDirSync, writeJsonSync } from 'fs-extra';
import { join } from 'path';

const jsonFormatter = new Cucumber.JsonFormatter();
const projectRoot = process.cwd();

/**
 * This hook is needed to generate a json-file for the reporting
 */
defineSupportCode(({ registerListener }) => {
  registerListener(jsonFormatter);

  return generateAndSaveJsonFile();

  /**
   * Generate and save the report json files
   */
  function generateAndSaveJsonFile() {
    jsonFormatter.log = (report) => {
      adjustAndSaveJsonFile(device.desiredCapabilities, report);
    };
  }

  /**
   * Adjust and save the json files
   */
  function adjustAndSaveJsonFile(capabilities, report) {
    const jsonReport = JSON.parse(report);
    if (jsonReport.length > 0) {
      const featureName = jsonReport[0].name.replace(/\s+/g, '_').replace(/\W/g, '').toLowerCase() || 'noName';
      const snapshotPath = join(projectRoot, '.tmp/json-output');
      const filePath = join(snapshotPath, `${featureName}.${capabilities.browserName}.${(new Date).getTime()}.json`); // eslint-disable-line

      // The report is enriched with data of the running instance, this is needed to show the name/version of the browser/platform in the report
      jsonReport[0].metadata = {
        browser: {
          name: capabilities.browserName,
          version: '60' // Add your version or dynamically add your version here
        },
        device: "local development machine",
        platform: {
          name: 'osx',          // Add your platform name here
          version: '10.12.6'    // Add your platform version here
        }
      };

      ensureDirSync(snapshotPath);

      writeJsonSync(filePath, jsonReport, { spaces: 2 });
    }
  }
});