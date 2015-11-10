angular.module('app').controller('breadcrumbsController', [
	'$scope', '$location', 'processContainer'
	($scope, $location, processContainer) ->

		$scope.goToDetails = () ->
			processContainer.resetProcess()
			$location.path($scope.call.typeFull + '/' + $scope.person.typeFull + '/' + $scope.person.id)

		$scope.gotToStep = (step) ->
			processContainer.goToStep(step)

		$scope.steps = []

		for step in processContainer.getProcess().steps
			$scope.steps.push step
			continue if step isnt processContainer.getStep()
			break

])