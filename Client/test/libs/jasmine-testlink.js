(function() {

    var fs                  =   require('fs'),
        moment              =   require('moment'),
        now                 =   '';

    if (typeof jasmine == 'undefined') {
        throw new Error("jasmine library does not exist in global namespace!");
    }

    /**
     * Generates TestLink JSON for import from API for the given spec run.
     * @param {string} savePath where to save the files
    */

    var testLinkReporter = function(savePath) {
        now = moment().format("DD-MM-YYYY")
        this.baseSavePath = savePath;
        this.savePath = this.baseSavePath;
        fs.writeFile(this.savePath, '')
    };

    testLinkReporter.prototype = {

        reportSpecResults: function(spec) {
            var results = spec.results();
            var notes = "";
            var resultItems = results.getItems();

            var params = { 
                user: "protractor",
                devkey: "762262ddf45359fb124c6cf3619c98cc",
                url: "http://adfs.hill30.com:8082/testlink/lib/api/xmlrpc/v1/xmlrpc.php",
                buildname: "jenkins",
                platformid: 4,
                testcaseid: spec.description,
                testplanid: spec.suite.description
            }

            if(!results.passed()) {
              params.status = 'f';
            } else {
              params.status = 'p';
            }

            for (var i = 0; i < resultItems.length; i++) {
                var result = resultItems[i];
                if (result.message !== 'Passed.') {
                    notes += '\n' + result.message
                }
            }
            if (notes) {
                params.notes = notes;
            }
            spec.output = params;
        },

        reportSuiteResults: function(suite) {
            var results = suite.results();
            var specs = suite.specs();
            var specOutput = [];
            suite.output = "";
            for (var i = 0; i < specs.length; i++) {
                specOutput.push(specs[i].output);
            }
            suite.output = specOutput;
        },

        reportRunnerResults: function(runner) {
            var suites = runner.suites();
            var self = this
            runner.output = []
            suites.forEach(function(suite) {
                suite.output.forEach(function(testcase) {
                    runner.output.push(testcase);
                }) 
            }) 
            this.writeFile(this.savePath, JSON.stringify(runner.output));
        },

        writeFile: function(filePath, text) {
            var fd = fs.openSync(filePath, "a");
            fs.writeSync(fd, text, 0);
            fs.closeSync(fd);
        }

    };

    // export public
    jasmine.testLinkReporter = testLinkReporter;

})();
