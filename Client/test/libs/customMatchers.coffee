#////////////////////////
# Some Custom Matchers //
#////////////////////////

# Usage:
# Add `require('./customMatchers.js');` in your onPrepare block or file

# Config
# 10 secs

# Helpers
_refreshPage = ->
    
    # Swallow useless refresh page webdriver errors
    browser.navigate().refresh().then null, ->

    return

###*
Custom Jasmine matcher that waits for an element to be present and visible
@param  {Boolean} expectation Is always true since a falsy value doesn't make sense
@return {Boolean} Returns the expectation result

Uses the following object properties:
{ElementFinder} this.actual The element to find
Creates the following object properties:
{String} this.message The error message to show
{Error}  this.spec.lastStackTrace A better stack trace of user's interest
###
toBeReadyFnBuilder = (builderTypeStr) ->
    toBeReady = (exp) ->
        
        # This will be picked up by elgalu/jasminewd#jasmine_retry
        _isPresentError = (err) ->
            lastWebdriverError = (if (err?) then err.toString() else err)
            false
        exp = ((if not exp? then true else false))
        throw new Error("This custom matcher doesn't support false expectation.")   unless exp
        customMatcherFnThis = this
        elmFinderOrWebElm = customMatcherFnThis.actual
        throw new Error("<actual> can not be undefined.")   unless elmFinderOrWebElm
        throw new Error("This custom matcher only works on an actual ElementFinder.")   unless elmFinderOrWebElm.element
        driverWaitIterations = 0
        lastWebdriverError = undefined
        customMatcherFnThis.message = ->
            msg = undefined
            if elmFinderOrWebElm.locator
                msg = elmFinderOrWebElm.locator().toString()
            else
                msg = elmFinderOrWebElm.toString()
            "Expected '" + msg + "' to be present and visible. " + "After " + driverWaitIterations + " driverWaitIterations. " + "Last webdriver error: " + lastWebdriverError

        customMatcherFnThis.spec.lastStackTrace = new Error("Custom Matcher")
        
        # Refresh page after more that some retries
        browser.driver.wait(->
            driverWaitIterations++
            _refreshPage()  if driverWaitIterations > 7 if builderTypeStr is "withRefresh"
            elmFinderOrWebElm.isPresent().then (isPresent = (present) ->
                if present
                    elmFinderOrWebElm.isDisplayed().then (isDisplayed = (visible) ->
                        lastWebdriverError = "visible:" + visible
                        visible
                    ), _isPresentError
                else
                    lastWebdriverError = "present:" + present
                    false
            ), _isPresentError
        , specTimeoutMs * 0.3).then ((waitResult) ->
            waitResult
        ), (err) ->
            _isPresentError err


###*
Custom Jasmine matcher builder that waits for an element to be enabled or disabled
@param  {Boolean} expectation Is always true since a falsy value doesn't make sense
@return {Boolean} Returns the expectation result

Uses the following object properties:
{ElementFinder} this.actual The element to find
Creates the following object properties:
{String} this.message The error message to show
{Error}  this.spec.lastStackTrace A better stack trace of user's interest
###
toBeEnabledOrDisabledFnBuilder = (builderTypeStr) ->
    toBeEnabledOrDisabled = (exp) ->
        
        # This will be picked up by elgalu/jasminewd#jasmine_retry
        _isEnabledOrDisabledError = (err) ->
            lastWebdriverError = (if (err?) then err.toString() else err)
            false
        exp = ((if not exp? then true else false))
        throw new Error("This custom matcher doesn't support false expectation.")   unless exp
        customMatcherFnThis = this
        elmFinderOrWebElm = customMatcherFnThis.actual
        throw new Error("<actual> can not be undefined.")   unless elmFinderOrWebElm
        throw new Error("This custom matcher only works on an actual ElementFinder.")   unless elmFinderOrWebElm.element
        driverWaitIterations = 0
        lastWebdriverError = undefined
        customMatcherFnThis.message = ->
            msg = undefined
            if elmFinderOrWebElm.locator
                msg = elmFinderOrWebElm.locator().toString()
            else
                msg = elmFinderOrWebElm.toString()
            "Expected '" + msg + "' to be " + builderTypeStr + ". " + "After " + driverWaitIterations + " driverWaitIterations. " + "Last webdriver error: " + lastWebdriverError

        customMatcherFnThis.spec.lastStackTrace = new Error("Custom Matcher")
        browser.driver.wait(->
            driverWaitIterations++
            elmFinderOrWebElm.isEnabled().then (isEnabled = (enabled) ->
                if builderTypeStr is "enabled"
                    lastWebdriverError = "enabled:" + enabled
                    enabled
                else
                    lastWebdriverError = "disabled:" + not enabled
                    not enabled
            ), _isEnabledOrDisabledError
        , specTimeoutMs * 0.3).then ((waitResult) ->
            waitResult
        ), (err) ->
            _isEnabledOrDisabledError err


###*
Custom Jasmine matcher builder that waits for an element to have
or not have an html class.
@param  {String} expectation The html class name
@return {Boolean} Returns the expectation result

Uses the following object properties:
{ElementFinder} this.actual The element to find
Creates the following object properties:
{String} this.message The error message to show
{Error}  this.spec.lastStackTrace A better stack trace of user's interest
###
toHaveClassFnBuilder = (builderTypeBool) ->
    toHaveClass = (clsName) ->
        
        # if (!elmFinderOrWebElm.element) throw new Error(
        #     "This custom matcher only works on an actual ElementFinder.");
        
        # This will be picked up by elgalu/jasminewd#jasmine_retry
        _haveClassOrNotError = (err) ->
            lastWebdriverError = (if (err?) then err.toString() else err)
            false
        throw new Error("Custom matcher toHaveClass needs a class name")    unless clsName?
        customMatcherFnThis = this
        elmFinderOrWebElm = customMatcherFnThis.actual
        throw new Error("<actual> can not be undefined.")   unless elmFinderOrWebElm
        driverWaitIterations = 0
        lastWebdriverError = undefined
        thisIsNot = customMatcherFnThis.isNot
        testHaveClass = not thisIsNot
        testHaveClass = not testHaveClass   unless builderTypeBool
        haveOrNot = (if testHaveClass then "have" else "not to have")
        customMatcherFnThis.message = ->
            msg = undefined
            if elmFinderOrWebElm.locator
                msg = elmFinderOrWebElm.locator().toString()
            else
                msg = elmFinderOrWebElm.toString()
            "Expected '" + msg + "' to " + haveOrNot + " class " + clsName + ". " + "After " + driverWaitIterations + " driverWaitIterations. " + "Last webdriver error: " + lastWebdriverError

        customMatcherFnThis.spec.lastStackTrace = new Error("Custom Matcher")
        browser.driver.wait(->
            driverWaitIterations++
            elmFinderOrWebElm.getAttribute("class").then (getAttributeClass = (classes) ->
                hasClass = classes.split(" ").indexOf(clsName) isnt -1
                if testHaveClass
                    lastWebdriverError = "class present:" + hasClass
                    hasClass
                else
                    lastWebdriverError = "class absent:" + not hasClass
                    not hasClass
            ), _haveClassOrNotError
        , specTimeoutMs * 0.3).then ((waitResult) ->
            if thisIsNot
                
                # Jasmine 1.3.1 expects to fail on negation
                not waitResult
            else
                waitResult
        ), (err) ->
            
            # Jasmine 1.3.1 expects to fail on negation
            thisIsNot


###*
Custom Jasmine matcher builder that waits for an element to have or not
have an html attribute with optionally specifying its value
@param  {String} attribute The attribute to check for presence
@param  {String} opt_value The optional attribute value to also validate
@return {Boolean} Returns the expectation result

Uses the following object properties:
{ElementFinder} this.actual The element to find
Creates the following object properties:
{String} this.message The error message to show
{Error}  this.spec.lastStackTrace A better stack trace of user's interest
###
toHaveAttributeFnBuilder = (builderTypeBool) ->
    toHaveAttribute = (attribute, opt_attrValue) ->
        
        # if (!elmFinderOrWebElm.element) throw new Error(
        #     "This custom matcher only works on an actual ElementFinder.");
        
        # This will be picked up by elgalu/jasminewd#jasmine_retry
        _haveAttributeOrNotErr = (err) ->
            lastWebdriverError = (if (err?) then err.toString() else err)
            false
        throw new Error("Custom matcher toHaveAttribute needs an attribute name")   unless attribute?
        customMatcherFnThis = this
        elmFinderOrWebElm = customMatcherFnThis.actual
        throw new Error("<actual> can not be undefined.")   unless elmFinderOrWebElm
        driverWaitIterations = 0
        lastWebdriverError = undefined
        thisIsNot = customMatcherFnThis.isNot
        testHaveAttr = not thisIsNot
        testHaveAttr = not testHaveAttr unless builderTypeBool
        haveOrNot = (if testHaveAttr then "have" else "not to have")
        customMatcherFnThis.message = ->
            msg = undefined
            if elmFinderOrWebElm.locator
                msg = elmFinderOrWebElm.locator().toString()
            else
                msg = elmFinderOrWebElm.toString()
            "Expected '" + msg + "' to " + haveOrNot + " attribute: '" + attribute + "'. " + ((if opt_attrValue then "With value: '" + opt_attrValue + "'. " else "")) + "After " + driverWaitIterations + " driverWaitIterations. " + "Last webdriver error: " + lastWebdriverError

        customMatcherFnThis.spec.lastStackTrace = new Error("Custom Matcher")
        browser.driver.wait(->
            driverWaitIterations++
            elmFinderOrWebElm.getAttribute(attribute).then (getAttribute = (value) ->
                if testHaveAttr
                    unless opt_attrValue?
                        value isnt null
                    else
                        lastWebdriverError = "attribute value: '" + value + "'"
                        value is opt_attrValue
                else
                    unless opt_attrValue?
                        value is null
                    else
                        lastWebdriverError = "attribute value: '" + value + "'"
                        value isnt opt_attrValue
            ), _haveAttributeOrNotErr
        , specTimeoutMs * 0.3).then ((waitResult) ->
            if thisIsNot
                
                # Jasmine 1.3.1 expects to fail on negation
                not waitResult
            else
                waitResult
        ), (err) ->
            
            # Jasmine 1.3.1 expects to fail on negation
            thisIsNot


###*
Custom Jasmine matcher that waits for an element not to be present or at
least to not to be visible.
@param  {Boolean} expectation Is always true since a falsy value doesn't make sense
@return {Boolean} Returns the expectation result

Uses the following object properties:
{ElementFinder} this.actual The element to check for existence or invisibility
Creates the following object properties:
{String} this.message The error message to show
{Error}  this.spec.lastStackTrace A better stack trace of user's interest
###
toBeAbsent = (exp) ->
    
    # This will be picked up by elgalu/jasminewd#jasmine_retry
    _isPresentError = (err) ->
        ret = false
        lastWebdriverError = (if (err?) then err.toString() else err)
        try
            lastErr0 = lastWebdriverError.split(":")[0].trim()
            lastErr1 = lastWebdriverError.split(":")[1].trim()
            ret = (lastErr0 is "NoSuchElementError" or lastErr1 is "No element found using locator")
        ret
    exp = ((if not exp? then true else false))
    throw new Error("This custom matcher doesn't support false expectation.")   unless exp
    customMatcherFnThis = this
    elmFinderOrWebElm = customMatcherFnThis.actual
    throw new Error("<actual> can not be undefined.")   unless elmFinderOrWebElm
    throw new Error("This custom matcher only works on an actual ElementFinder.")   unless elmFinderOrWebElm.element
    driverWaitIterations = 0
    lastWebdriverError = undefined
    customMatcherFnThis.message = ->
        msg = undefined
        if elmFinderOrWebElm.locator
            msg = elmFinderOrWebElm.locator().toString()
        else
            msg = elmFinderOrWebElm.toString()
        "Expected '" + msg + "' to be absent or at least not visible. " + "After " + driverWaitIterations + " driverWaitIterations. " + "Last webdriver error: " + lastWebdriverError

    customMatcherFnThis.spec.lastStackTrace = new Error("Custom Matcher")
    browser.driver.wait(->
        driverWaitIterations++
        elmFinderOrWebElm.isPresent().then (isPresent = (present) ->
            if present
                elmFinderOrWebElm.isDisplayed().then (isDisplayed = (visible) ->
                    lastWebdriverError = "visible:" + visible
                    not visible
                ), _isPresentError
            else
                lastWebdriverError = "present:" + present
                true
        ), _isPresentError
    , specTimeoutMs * 0.4).then ((waitResult) ->
        waitResult
    ), (err) ->
        _isPresentError err


###*
Custom Jasmine matcher that validates JS data type loosely.
@param  {Type} expType The expected type, e.g. Object, Array, String
@return {Boolean} Returns the expectation result

Uses the following object properties:
{ElementFinder} this.actual The actual value to check typing
Creates the following object properties:
{String} this.message The error message to show
{Error}  this.spec.lastStackTrace A better stack trace of user's interest
###
toBeAn = (expType) ->
    throw new Error("This custom matcher needs an expected type.")  unless expType?
    customMatcherFnThis = this
    actualValue = customMatcherFnThis.actual
    throw new Error("<actual> can not be undefined.")   unless actualValue?
    
    # This will be picked up by elgalu/jasminewd#jasmine_retry
    customMatcherFnThis.spec.lastStackTrace = new Error("Custom Matcher")
    thisIsNot = customMatcherFnThis.isNot
    toBeOrNot = (if thisIsNot then "not to be" else "to be")
    customMatcherFnThis.message = ->
        typeName = (expType.name or expType.toString())
        "Expected <" + actualValue.toString() + "> " + toBeOrNot + " a kind of " + typeName

    (actualValue instanceof expType) or (expType.name and expType.name.toLowerCase() is typeof actualValue)

###*
Custom Jasmine matcher that waits for a dropdown to have an specific
option selected
@param  {String} exp The expected inner html with the value option
@return {Boolean} Returns the expectation result

Uses the following object properties:
{ElementFinder} this.actual The element to check selected option
Creates the following object properties:
{String} this.message The error message to show
{Error}  this.spec.lastStackTrace A better stack trace of user's interest
###
toHaveSelectedOption = (exp) ->
    
    # This will be picked up by elgalu/jasminewd#jasmine_retry
    _innerHtmlError = (err) ->
        lastWebdriverError = (if (err?) then err.toString() else err)
        browser.sleep 500
        false
    throw new Error("Argument error: expectation string needed but got: " + exp)    unless exp?
    customMatcherFnThis = this
    elmFinderOrWebElm = customMatcherFnThis.actual
    throw new Error("<actual> can not be undefined.")   unless elmFinderOrWebElm
    throw new Error("This custom matcher only works on an actual ElementFinder.")   unless elmFinderOrWebElm.element
    driverWaitIterations = 0
    lastWebdriverError = undefined
    customMatcherFnThis.message = ->
        msg = undefined
        if elmFinderOrWebElm.locator
            msg = elmFinderOrWebElm.locator().toString()
        else
            msg = elmFinderOrWebElm.toString()
        "Expected '" + msg + "' to have selected option: '" + exp + "'. " + "After " + driverWaitIterations + " driverWaitIterations. " + "Last webdriver error: " + lastWebdriverError + "."

    customMatcherFnThis.spec.lastStackTrace = new Error("Custom Matcher")
    browser.driver.wait(->
        driverWaitIterations++
        elmFinderOrWebElm.getInnerHtml().then (getInnerHtml = (actual) ->
            if actual is exp
                true
            else
                _innerHtmlError "getInnerHtml actual value: '" + actual + "'"
        ), _innerHtmlError
    , specTimeoutMs * 0.4).then ((waitResult) ->
        waitResult
    ), (err) ->
        _innerHtmlError err


###*
Custom Jasmine matcher that waits for a url to be or become the expected
@param  {String} exp The expected url string property name
@return {Boolean} Returns the expectation result

Uses the following object properties:
{String} this.actual The url string promise.
Creates the following object properties:
{String} this.message The error message to show
{Error}  this.spec.lastStackTrace A better stack trace of user's interest

Example
expect(browser.getUrl()).toMatchRoute('privacyPolicy');
###
toMatchRoute = (expRouteKey) ->
    
    # This will be picked up by elgalu/jasminewd#jasmine_retry
    _retryOnErr = (err) ->
        lastWebdriverError = (if (err?) then err.toString() else err)
        false
    customMatcherFnThis = this
    throw new Error("Needed: browser.params.routes for this matcher")   unless browser.params.routes?
    throw new Error("Argument error: expectation string needed but got: " + expRouteKey)    if not expRouteKey? or typeof expRouteKey isnt "string"
    actualUrl = customMatcherFnThis.actual
    throw new Error("<actual> can not be undefined or null")    unless actualUrl?
    throw new Error("<actual> should have been resolved to a string but was: " + actualUrl) if typeof actualUrl isnt "string"
    urlMatcher = browser.params.routes.buildMatcher(expRouteKey)
    driverWaitIterations = 0
    lastUrlFound = undefined
    lastWebdriverError = undefined
    customMatcherFnThis.message = ->
        msg = undefined
        "Expected url to match: " + urlMatcher.toString() + ". " + "After " + driverWaitIterations + " driverWaitIterations. " + "Last url found: '" + lastUrlFound + "'. " + "Last webdriver error: " + lastWebdriverError + "."

    customMatcherFnThis.spec.lastStackTrace = new Error("Custom Matcher")
    return true if urlMatcher.test(actualUrl) # all done
    browser.driver.wait(->
        driverWaitIterations++
        browser.getUrl().then ((url) ->
            if urlMatcher.test(url)
                true
            else
                lastUrlFound = url
                _retryOnErr()
        ), _retryOnErr
    , specTimeoutMs * 0.4).then ((waitRetValue) ->
        waitRetValue
    ), (err) ->
        _retryOnErr err

"use strict"
specTimeoutMs = 10000

# Add the custom matchers to jasmine
beforeEach ->
    @addMatchers
        toBePresentAndDisplayed: toBeReadyFnBuilder()
        toBeReady: toBeReadyFnBuilder()
        toBeReadyWithRefresh: toBeReadyFnBuilder("withRefresh")
        toBeEnabled: toBeEnabledOrDisabledFnBuilder("enabled")
        toBeDisabled: toBeEnabledOrDisabledFnBuilder("disabled")
        toBeAbsent: toBeAbsent
        toHaveClass: toHaveClassFnBuilder(true)
        toNotHaveClass: toHaveClassFnBuilder(false)
        toHaveSelectedOption: toHaveSelectedOption
        toHaveAttribute: toHaveAttributeFnBuilder(true)
        toNotHaveAttribute: toHaveAttributeFnBuilder(false)
        toBeAn: toBeAn
        toBeA: toBeAn
        toMatchRoute: toMatchRoute

    return
