module.exports = (params, callback) ->
	http = require("http")

	postCompose = (url) ->
		re = /http:\/\/([^:]*):([^\/]*)([^$]*)/
		tokens = url.match(re)
		theWholeUrl = tokens[0]
		host = tokens[1]
		port = tokens[2]
		path = tokens[3]

		return {
			host: host
			path: path
			port: port
			method: "POST"
			headers:
				Cookie: "cookie"
				"Content-Type": "text/xml"
		}

	postRequest = (post, body, callback) ->
		req = http.request(post, (res) ->
			buffer = ""
			res.on "data", (data) ->
				buffer = buffer + data
			res.on "end", (data) ->
				callback buffer
		)
		req.write body
		req.end()

	getRequestByObject = (object) ->
		xmlResponse = ""
		methodCall = ""
		parallelTag = ""
		oneLabelArray = ""
		for property of object
			if property is "methodName"
				methodCall = "<methodName>tl." + object[property] + "</methodName>\n"
			else
				if Array.isArray(object[property])
					recursiveTags = ""
					object[property].map (tag) ->
						recursiveTags = recursiveTags + "<member><name>" + tag.type + "</name><value><" + tag.name + ">" + tag.value + "</" + tag.type + "></value></member>\n"
						return

					oneLabelArray = oneLabelArray + "<member><name>" + property + "</name><value><struct>\n" + recursiveTags + "</struct></value></member>"
				else
					parallelTag = parallelTag + "<member><name>" + property + "</name><value>" + "<" + object[property]["type"] + ">" + object[property]["value"] + "</" + object[property]["type"] + "></value></member>\n"
		#End of loop
		xmlResponse = "<?xml version=\"1.0\"?>\n" + "<methodCall>\n" + methodCall + "<params>" + "<param><value><struct>\n" + parallelTag + oneLabelArray + "</struct></value></param>\n" + "</params></methodCall>"
		xmlResponse

	if params and callback	
		post = postCompose(params.url)
		inputObject =
			methodName: "reportTCResult"
			devKey:
				value: params.devkey
				type: "string"

			testplanid:
				value: params.testplanid or "testplanid"
				type: "int"

			testcaseid:
				value: params.testcaseid or "testcaseid"
				type: "string"

			buildname:
				value: params.buildname or "jenkins"
				type: "string"

			status:
				value: params.status or "status"
				type: "string"

			notes:
				value: params.notes or ""
				type: "string"

			platformid:
				value: params.platformid or "platformid"
				type: "string"

			user:
				value: params.user or "user"
				type: "string"

		body = getRequestByObject(inputObject)
		postRequest post, body, (response) ->
			callback response
