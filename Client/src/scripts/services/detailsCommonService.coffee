angular.module('app').service 'detailsCommonService', [
	'$location', 'personDataService', 'processContainer', 'notesDialogService'
	($location, personDataService, processContainer, notesDialogService) ->

		setCallAndPerson: ($scope) ->
			$scope.call = personDataService.getCall()
			$scope.person = personDataService.getPerson()
			if not $scope.call or not $scope.person
				console.log 'detailsCommonService: there is no call/person data in route params'
				$location.path('/home')
			true

		injectNotesFunctionality: ($scope) ->
			$scope.openNotesDialog = () ->
				notesDialogService.configure($scope, { type: $scope.person.type, id: $scope.person.id }).openDialog()

		injectProcessesFunctionality: ($scope) ->
			$scope.startProcess = (process, reason) ->
				processContainer.initialize(process, reason)
				$location.path('/process/' + processContainer.getStep().name)
]