// The main suite of Protractor tests.
require('coffee-script')
exports.config = {

  seleniumAddress: 'http://localhost:4444/wd/hub',

  seleniumServerJar: null,

  chromeDriver: null,

  specs: [
    'libs/customMatchers.coffee',
    'scripts/e2e/smoke01.coffee',

  ],

  capabilities: {
    'browserName': 'chrome'
  },

  onPrepare: function() {
    require('jasmine-reporters');
    require('./libs/jasmine-testlink.js');
    HtmlReporter = require('protractor-html-screenshot-reporter');
    jasmine.getEnv().addReporter(new jasmine.ConsoleReporter());
    jasmine.getEnv().addReporter(new HtmlReporter({
      baseDirectory: 'test/reports/screenshots',
      takeScreenShotsOnlyForFailedSpecs: true
    }));
    jasmine.getEnv().addReporter(new jasmine.testLinkReporter("test/export.json"));

    homeURL = 'https://adfs.hill30.com/dev/servicetracker/'
  },
  
  baseUrl: 'https://adfs.hill30.com/public/contactcenterworkflow/#/home',

  jasmineNodeOpts: {
    // onComplete will be called before the driver quits.
    onComplete: null,
    isVerbose: false,
    showColors: true,
    includeStackTrace: true,
    //defaultTimeoutInterval: 90000000
  }
};
