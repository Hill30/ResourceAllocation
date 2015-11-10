angular.module('app').controller('homeController', [
	'$scope', 'processContainer'
	($scope, processContainer) ->

		processContainer.resetProcess()

		$scope.isLoaded = true;

])