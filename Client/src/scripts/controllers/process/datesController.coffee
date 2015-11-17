angular.module('app').controller('datesController', [
	'$scope', '$location', 'processContainer', 'visitsResource', 'dateFormat'
	($scope, $location, processContainer, visitsResource, dateFormat) ->


		#$scope.$watchCollection 'selectedDates', () ->
		#	processContainer.setDates($scope.dateTo.requestValue, $scope.dateFrom.requestValue)

])