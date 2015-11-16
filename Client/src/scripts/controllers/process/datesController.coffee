angular.module('app').controller('datesController', [
	'$scope', '$location', 'processContainer', 'visitsResource', 'dateFormat'
	($scope, $location, processContainer, visitsResource, dateFormat) ->

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

		$scope.eventSources = []

		#$scope.$watchCollection 'selectedDates', () ->
		#	processContainer.setDates($scope.dateTo.requestValue, $scope.dateFrom.requestValue)

])