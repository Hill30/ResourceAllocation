angular.module('app').controller('detailsController', [
	'$scope', '$location', 'personResource', 'personDataService', 'processContainer'
	($scope, $location, personResource, personDataService, processContainer) ->

		personDataService.initializeByRouteParams()
		if not $scope.call.type or not $scope.person.type
			console.log 'detailsController: there is no call/person data in route params'
			$location.path('/home')
			return

		personResource.get[$scope.person.typeFull]({ id: $scope.person.id }, (result) ->
			personDataService.initialize($scope.call, result) # to persist loaded person's data
		, () ->
			console.log 'detailsController: can\'t load call/person data from server'
			$location.path('/home')
			return false
		)

		processContainer.initializeProcesses $scope.call, $scope.person

])