/* eslint-disable */
const cucumberJson = require('wdio-cucumberjs-json-reporter').default;
const report = require('multiple-cucumber-html-reporter');
const moment = require('moment');

var cadena = '' 
var build: any = null
var project: any= null
var tags= null
const azure: string = process.env.AZURE || 'no'

const path = process.argv[3]

if (process.argv[5] == null) {
   build='NO BUILD'
   }else{
   build= process.argv[5]
   }

if (process.argv[6] == null) {
   project='NO PROJECT'
   }else{
   project = process.argv[6]
   }

if (process.argv[4] == null) {
    tags=''
    }else{
        tags= process.argv[4]
    }

  export const config: WebdriverIO.Config = {
  //@ts-ignore
  local: 'no',  //use to identified local or BS run environment.
  user: process.env.BROWSERSTACK_USERNAME || 'gabrieladriannic2',
  key: process.env.BROWSERSTACK_ACCESS_KEY || 'paoGDw7QAYnQ6rj3WqGM',
  specs: [`./test/features/${path}.feature`],
  exclude: ['./node_modules/**/**.feature'],
  bail: 0,
  connectionRetryTimeout: 90000,
  connectionRetryCount: 3,
  services: [
      ['browserstack', {
           browserstackLocal: false
       }],
       [
        'ocr',
        {
          // The OCR options
          ocrImagesPath: 'ocr-images/',
          lenguage: 'SPA',
        },
      ]
    ],

  framework: 'cucumber',
  maxInstances: 2,
  
reporters: ['spec',
         [
          'junit',
          {
            addFileAttribute: true,
            outputDir: `./reports/junit-report/${build}`,
            outputFileFormat: function() { // optional
              const time=moment().format('YYYYMMDD-HHmmss.SSS');
              const random = Math.random();
              return `junit-report-${time}-${random}.xml`
            }
          }
        ],
        [ 'cucumberjs-json', {
          jsonFolder: `reports/cucumber/${build}`,
          language: 'en',
         },
        ],
     //   [CustomReporter, {
     //     someOption: 'foobar'
     //   }]
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
    format: ['progress', 'pretty'],

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
  beforeSession: async (config, capabilities, specs) => {
    require('@babel/register')
    //@ts-ignore
    cadena = specs[0].split("/").pop().split(".")[0]
    //@ts-ignore
    capabilities.name = cadena
    //@ts-ignore
    capabilities.build = build
    //@ts-ignore
    capabilities.project = project
    //@ts-ignore
    capabilities.local = 'no'
  },

  before: async () => {
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

  },
  onPrepare: async () => {
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
    //exec('./test/utils/checkappopen/checkAPPopen.sh'); 
   },
  // beforeStep()

 // afterStep() {
  //  browser.takeScreenshot()
  //},

  afterStep: async () => {
   await cucumberJson.attach(await browser.takeScreenshot(), 'image/png')
  },

  afterScenario:async () => {  
   await driver.reset()
  },
// afterFeature: function (uri, feature, scenarios) { },
 after: async (result, capabilities, specs) => {
const getPublicUrlSessionReport = require('../test/utils/services/BrowserStack/BrowserstackGetPublicSessionReport')
 const sessionId = browser.sessionId
 const publicUrl = await getPublicUrlSessionReport(sessionId)
 console.log("BrowserStack link to public report : " + publicUrl)
 await cucumberJson.attach(publicUrl, 'text/plain')
},
// afterSession: function (sessionId, config, capabilities, specs) { },
onComplete: async () => {
  if(azure==='si'){
     await report.generate({
     jsonDir: `reports/cucumber/${build}`,
     reportPath: 'reports/cucumber/html',
     openReportInBrowser: true
   })
 }
}
// onReload: function(oldSessionId, newSessionId) { }
}
