userInfo = {
	login: "tadams"
	firstName: "Terry"
	lastName: "Adams"
	email: "tadams@gmail.com"
	availableApplications: [
			name: "App 1"
			url: "http://localhost/app1"
		,
			name: "App 2"
			url: "http://localhost/app2"
	]
	permissions: [
		"RefundManager.ApproveRefund"
	]
}

dictionaries = {"processes": [
	{"code":"COFF", "name": "Call Off", "callType": "I", "callerType": "E", "steps": [
		{"name": "dates", "selectionType": 1, "mandatory": true},
		{"name": "visits", "selectionType": 1, "mandatory": true},
		{"name": "note", "mandatory": false}
	], "reasons": [
		{"id": 1, "name": "Family Emergency"}
	]},
	{"code":"CIC", "name": "CIC", "callType": "I", "callerType": "E", "steps": [
		{"name": "dates", "selectionType": 1, "mandatory": true},
		{"name": "visits", "selectionType": 1, "mandatory": true},
		{"name": "note", "mandatory": true}
	], "reasons": null},
	{"code":"def", "name": "Default", "callType": "A", "callerType": "A", "steps": [
		{"name": "dates", "selectionType": 1, "mandatory": false},
		{"name": "visits", "selectionType": 1, "mandatory": false},
		{"name": "note", "mandatory": true}
	], "reasons": null},
	{name: "Client changes Schedule"}
	{name: "Employee changes Schedule"}
	{name: "Employee Termination"}
	{name: "Hospitalized client"}
	{name: "Lock Out"}
	{name: "Log Complaint"}
	{name: "New Client"}
	{name: "PTO Request (non-Amp)"}
	{name: "Redetermination"}
	{name: "Refusal of offer"}
	{name: "Re-Staff"}
	{name: "Service Termination"}
	{name: "Short term service interruption"}
	{name: "Training queue"}
]}

randomInt = (a, b) ->
	return Math.floor(Math.random() * (b - a + 1) + a)


createPerson = (id) ->
	id: id
	type: ["E", "C"][randomInt(0, 1)]
	name: ["mr.Trololo", "mr.Trulala", "mrs.Trululu"][randomInt(0, 2)]
	phone: " " + randomInt(0, 9) + randomInt(0, 9) + randomInt(0, 9) + randomInt(0, 9) + randomInt(0, 9) + randomInt(0, 9)
	location: ["place A", "place B", "place C"][randomInt(0, 2)]
	branch: { id: -1, name: "Some strange place" }
	team: { id: -1, name: "Some strange team" }
	manager: { id: -1, name: "mr.Manager #" + randomInt(0, 9) }
	technology: "GPS/AMP"
	isFamilyCaregiver: [true, false][randomInt(0, 1)]
	lastNote:
		id: 0
		author: "mr.Programmer"
		createdAt: "2015-02-05T18:16:51.8821278+03:00"
		text: "Note text note text note text note text note text note text note text note text note text note text"

createNote = (id) ->
	id: id
	text: "Some note text (id = " + id + ")"
	author: "Author"
	createdAt: "2015-02-05T18:16:51.8821278+03:00"

createVisit = (id) ->
	id: id
	employeeId: persons[id].id
	employeeName: persons[id].name
	clientId: persons[id].id
	clientName: persons[id].name
	startTime: "2015-02-0" + id + "T15:00:00"
	endTime: "2015-02-0" + id + "T16:00:00"

persons = (createPerson(num) for num in [1..100])
notes = (createNote(num) for num in [1..100])
visits = (createVisit(num) for num in [1..9])

module.exports = (app, options) ->

	app.get '/', (req, res) ->
		res.render "#{options.base}/index.html"

	app.get '/api/userInfo', (req, res) ->
		res.json userInfo

	app.get '/api/dictionaries', (req, res) ->
		res.json dictionaries

	app.get '/api/persons', (req, res) ->
		result = persons

		# filter
		if req.query.searchString
			result = result.filter (x) ->
				(x.name.indexOf(req.query.searchString) isnt -1)

		# sorting (only for numeric fields)
		if req.query.sortBy
			result.sort (a, b) ->
				a[req.query.sortBy] - b[req.query.sortBy]

		if req.query.sortOrder == 'desc'
			result.reverse()

		# pagination
		if req.query.offset
			offset = parseInt(req.query.offset)
			count = parseInt(req.query.count)
			final = []
			for item, index in result
				if index >= offset and index < offset + count
					final.push item
			result = final

		finalResult = []
		for person in result
			finalResult.push
				id: person.id
				type: person.type
				name: person.name
				phone: person.phone
				location: person.location

		res.json finalResult

	app.get '/api/employee/:id', (req, res) ->
		id = req.params.id
		res.json person for person in persons when parseInt(person.id, 10) is parseInt(id, 10) and person.type is 'E'

	app.get '/api/client/:id', (req, res) ->
		id = req.params.id
		res.json person for person in persons when parseInt(person.id, 10) is parseInt(id, 10) and person.type is 'C'

	app.get '/api/notes', (req, res) ->
		result = notes

		# pagination
		if req.query.offset
			offset = parseInt(req.query.offset)
			count = parseInt(req.query.count)
			final = []
			for item, index in result
				if index >= offset and index < offset + count
					final.push item
			result = final

		res.json result

	app.get '/api/visits', (req, res) ->
		result = visits

		# filter
		###if req.query.dateFrom
			result = result.filter (x) ->
				(x.name.indexOf(req.query.searchString) isnt -1)###

		res.json result

	app.post '/api/complete', (req, res) ->
		result = {}
		res.json result