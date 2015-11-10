Contact Center Workflow
==============
Reference implementation web application implementation (client side)

To run:

* install [Git](http://git-scm.com/)
* install [node.js (v0.10.20)](https://nodejs.org/dist/v0.10.20/) with npm (Node Package Manager)
* install [Grunt](https://github.com/gruntjs/grunt) package globally.  `npm install -g grunt-cli`
* install [Karma](http://karma-runner.github.io/0.10/index.html) package globally, version = 0.10.0  `npm install -g karma@0.10.0`
* install [Bower] (https://github.com/bower/bower) ` npm install -g bower `
* clone the ContactCenterWorkflow repository `git clone git@github.com:Addus/ContactCenterWorkflow.git`
* `cd ContactCenterWorkflow/Client`
* install nodejs dependencies `npm install`
* remove directives depend on bower `grunt clean:bower`
* install bower dependencies `bower install`
* to open the app in the browser run `grunt server`
* to run the tests run `grunt test`


