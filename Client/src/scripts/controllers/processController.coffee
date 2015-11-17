angular.module('app').controller('processController', [
	'$scope', '$location', 'processContainer', 'notesDialogService', 'popup', 'confirmation', 'personResource', 'personDataService', 'personResourceSelect'
	($scope, $location, processContainer, notesDialogService, popup, confirmation, personResource, personDataService, personResourceSelect) ->

		$scope.isProcessMenuExpanded = false
		$scope.eventCal = {}
		$scope.eventCal.Person = {}
		$scope.eventCal.Person.name = ""

		$scope.uiConfig = calendar:
			height: 450
			editable: true
			header:
				left: 'month agendaWeek agendaDay'
				center: 'title'
				right: 'today prev,next'
			dayClick: $scope.alertEventOnClick
			eventDrop: $scope.alertOnDrop
			eventResize: $scope.alertOnResize

		$scope.openNotesDialog = () ->
			notesDialogService.configure($scope, { type: $scope.person.type, id: $scope.person.id }).openDialog()

		$scope.startProcess = (process, reason) ->
			return if not reason and process.reasons # additional protection

			startNewProcess = () ->
				processContainer.initialize(process, reason)
				$location.path('/process/' + processContainer.getStep().name)

			if processContainer.isProcessInitialized()
				confirmation.configure(
					title: 'Cancel process'
					text: 'Please confirm that the ' + processContainer.getProcess().name + ' process has to be canceled'
					cancelCaption: 'Resume'
					confirmCaption: 'Cancel process'
					confirmAction: startNewProcess
				).openDialog()
			else startNewProcess()

		$scope.nextStep = {}
		$scope.nextStep.exec = () -> processContainer.gotToNextStep() # this can be overrided in a child step ctrls

		$scope.cancelProcess = () ->
			$location.path('/home')
			popup.show
				type: 'info'
				text: processContainer.getProcess().name + ' has been canceled.'
				ttl: 2000

		locationChangeStartOff = $scope.$on '$locationChangeStart', (event, next, current) ->
			if next.indexOf('/call/') isnt -1
				path = next.substr(next.indexOf($location.$$path))
				event.preventDefault()
				confirmation.configure(
					title: 'Cancel call'
					text: 'Please confirm that the call has to be canceled'
					cancelCaption: 'Resume'
					confirmCaption: 'Cancel call'
					confirmAction: () ->
						locationChangeStartOff()
						$location.path(path)
				).openDialog()


		personDataService.initializeByRouteParams()
		if not $scope.person.type
			console.log 'detailsController: there is no call/person data in route params'
			$location.path('/home')
			return

		person = personDataService.getPerson()
		$scope.person.typeFull = person.typeFull
		personResource.get[$scope.person.typeFull]({ id: $scope.person.id }, (result) ->
			$scope.person = result
		, () ->
			console.log 'detailsController: can\'t load call/person data from server'
			$location.path('/home')
			return false
		)

		$scope.onPersonSearch = (search) ->
			if not search
				$scope.eventCal['PersonList'] = []
				$scope.eventCal['PersonListToSelect'] = []
				return
			if $scope.person.type is 'E'
				personFullName = 'client'
			else 
				personFullName = 'employee'
			personResourceSelect.get[personFullName]({ name: search, count: 10 }, (result) ->
				$scope.eventCal['PersonListToSelect'] = result
			)

		$scope.onPersonChange = () ->
			$scope.eventCal.personOutput = $scope.eventCal.Person.name

		$scope.addEvent = () ->
			#stDate = $scope.eventCal.startDate.split('/')
			#fDate = $scope.eventCal.finishDate.split('/')
			$scope.events.push {
				title: $scope.eventCal.personOutput
				start: $scope.eventCal.startDate
				end: $scope.eventCal.finishDate
				allDay: false
			}

		$scope.events = []

		date = new Date
		d = date.getDate()
		m = date.getMonth()
		y = date.getFullYear()

		### event source that contains custom events on the scope ###

		$scope.events = [
			{
				title: 'All Day Event'
				start: new Date(y, m, 1)
			}
			{
				title: 'Long Event'
				start: new Date(y, m, d - 5)
				end: new Date(y, m, d - 2)
			}
			{
				id: 999
				title: 'Repeating Event'
				start: new Date(y, m, d - 3, 16, 0)
				allDay: false
			}
			{
				id: 999
				title: 'Repeating Event'
				start: new Date(y, m, d + 4, 16, 0)
				allDay: false
			}
			{
				title: 'Marco Polo'
				start: new Date(y, m, d + 1, 19, 0)
				end: new Date(y, m, d + 1, 22, 30)
				allDay: false
			}
			{
				title: 'Click for Google'
				start: new Date(y, m, 28)
				end: new Date(y, m, 29)
				url: 'http://google.com/'
			}
		]
		$scope.eventSources = [$scope.events]

])