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

		$scope.events = []
		$scope.eventSources = [$scope.events]

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

])