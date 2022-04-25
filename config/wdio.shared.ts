/* eslint-disable */
const pathHtmlReport = require('path');
const moment = require('moment');
const report = require('multiple-cucumber-html-reporter');
const cucumberJson = require('wdio-cucumberjs-json-reporter').default;
const path = process.argv[3]

var tags = ''
if (process.argv[4] == null) {
   tags=''
   }else{
       tags= process.argv[4]
   }
export const config: WebdriverIO.Config = {
  port: 4723,
  specs: [`./test/features/${path}.feature`],
  exclude: ['./node_modules/**/**.feature'],
   //@ts-ignore
  bail: 0,
  connectionRetryTimeout: 90000,
  connectionRetryCount: 1,
  
services: [
    'appium',
    [
      'ocr',
      {
        // The OCR options
        ocrImagesPath: 'ocr-images/',
        lenguage: 'SPA',
      },
    ]
],
//@ts-ignore
appium: {
   command: 'appium',
   waitStartTime: 60000,
   args: {
     port: 4723,
     address: '127.0.0.1',
     sessionOverride: true,
     debugLogSpacing: false,
   },
  },

  framework: 'cucumber',
  maxInstances: 2,
    reporters: 
      [
          'spec',
          [
            'junit',
            {
              addFileAttribute: true,
              outputDir: './reports/junit-report',
              outputFileFormat: function() { // optional
                const time=moment().format('YYYYMMDD-HHmmss.SSS');
                return `junit-report-${time}.xml`
              }
            }
          ],
          [ 'cucumberjs-json', {
            jsonFolder: `reports/cucumber`,
            language: 'en',
           },
          ],
    ],  
  cucumberOpts: {
    require: ['./test/steps-definitions/*.js'],

    // <boolean> show full backtrace for errors
    backtrace: true,

    requireModule: [],

    // <boolean> invoke formatters without executing steps
    dryRun: false,

    // <boolean> abort the run on first failure
    failFast: false,

    // <string[]> (type[:path]) specify the output format, optionally supply PATH to redirect formatter output (repeatable)
    format: ['pretty', 'progress'],

    // <boolean> disable colors in formatter output
    colors: true,

    // <boolean> hide step definition snippets for pending steps
    snippets: true,

    // <boolean> hide source uris
    source: true,
    
    // <string[]> (name) specify the profile to use
    profile: [],

    // <boolean> fail if there are any undefined or pending steps
    strict: false,

    tagExpression: `${tags}`,

    // <number> timeout for step definitions
    timeout: 60000,

    // <boolean> Enable this config to treat undefined definitions as warnings.
    ignoreUndefinedDefinitions: false
  },
  //
  // =====
  // Hooks
  // =====
  beforeSession: async () => {
    require('@babel/register')
  },
  before: async () => {
            //@ts-ignore
    const chai = require('chai')    
    require('expect-webdriverio').setOptions({ wait: 5000 })
                //@ts-ignore
    global.wdioExpect = global.expect
                //@ts-ignore
    global.expect = chai.expect
                //@ts-ignore
    global.assert = chai.assert
                //@ts-ignore
    global.should = chai.should()
    //Comando para cambiar la calidad de screenshots para OCR
    //await driver.updateSettings({ screenshotQuality: 0})
  },
    onPrepare: async () => {
    //fs.rmSync('./reports', {recursive: true, force: true});
    const ocrPath = './ocr-images';
    const reportsPath = './reports';

    const fs = require("fs").promises;
    const path = require("path");
    const delete_r = async function (input:any) {
      let files = await fs.readdir(input);
      for (const file of files) {
        var curPath = path.join(input, file);
        let stats = await fs.lstat(curPath);
        if (stats.isDirectory())
          await delete_r(curPath);
        else
          await fs.unlink(curPath);
      }
      await fs.rmdir(input);
    };
    await delete_r(ocrPath);
    await delete_r(reportsPath);
},
  // beforeCommand() {
  // },
  // beforeFeature: function (uri, feature, scenarios) { },
  beforeScenario: async () => {
    //@ts-ignore            
    function exec(cmd, handler = function(error, stdout, stderr){console.log(stdout);if(error !== null){console.log(stderr)}})
    {
        const childfork = require('child_process');
        return childfork.exec(cmd, handler);
    }
   },
  // beforeStep()
  afterStep: async() => {
    await cucumberJson.attach(await browser.takeScreenshot(), 'image/png')
  },
   afterScenario: async () => {   
   await driver.reset()
  },
  // afterFeature: function (uri, feature, scenarios) { }
  // after: function (result, capabilities, specs) { }
  // afterSession: function (config, capabilities, specs) {  },
  onComplete: async () => {
    await report.generate({
      jsonDir: 'reports/cucumber/',
      reportPath: 'reports/cucumber/html',
      openReportInBrowser: true
    });
  }
  // onReload: function(oldSessionId, newSessionId) { }
}