angular.module('app').controller('processController', [
	'$scope', '$location', 'processContainer', 'notesDialogService', 'popup', 'confirmation', 'personResource', 'personDataService'
	($scope, $location, processContainer, notesDialogService, popup, confirmation, personResource, personDataService) ->

		$scope.isProcessMenuExpanded = false

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

])