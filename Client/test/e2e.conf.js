// The main suite of Protractor tests.
require('coffee-script')
exports.config = {

  seleniumAddress: 'http://localhost:4444/wd/hub',

  seleniumServerJar: null,

  chromeDriver: null,

  specs: [
    'libs/customMatchers.coffee',
    //'scripts/e2e/smoke.coffee',
    // 'scripts/e2e/smoke01.coffee',
    //'scripts/e2e/smoke02.coffee',
   // 'scripts/e2e/EndProcess.coffee',
    'scripts/e2e/CancelPr.coffee',
   // 'scripts/e2e/Calendar.coffee',

  ],

  capabilities: {
    'browserName': 'chrome',
  'chromeOptions': {
   // 'args': ['show-fps-counter=true', 'enable-precise-memory-info=true', 'js-flags="--expose-gc"'],
    //'args': ['enable-precise-memory-info=true'],
   // 'args': ['--js-flags="--expose-gc"']
    //'args': [ '--js-flags="--expose-gc --harmony"' ]
      'args': ['--enable-precise-memory-info=true', '--js-flags="--expose-gc"']


    //args: ['--test-type']
  }

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
    //jasmine.getEnv().addReporter(new jasmine.testLinkReporter());

    homeURL = 'https://adfs.hill30.com/dev/servicetracker/'
  },
  
  baseUrl: 'https://adfs.hill30.com/public/contactcenterworkflow/#/home',

  jasmineNodeOpts: {
    // onComplete will be called before the driver quits.
    onComplete: null,
    isVerbose: false,
    showColors: true,
    includeStackTrace: true,
    defaultTimeoutInterval: 90000
  }
};
