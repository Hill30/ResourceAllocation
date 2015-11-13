angular.module('app').controller('datesController', [
	'$scope', '$location', 'processContainer', 'visitsResource', 'dateFormat'
	($scope, $location, processContainer, visitsResource, dateFormat) ->

		$scope.selectedDates = []

		resetStepsData = () ->
			$scope.selectedDates.pop() while $scope.selectedDates.length # else the $watchCollection subscription will be lost
			$scope.selectedDate = null
			$scope.dateFrom = null
			$scope.dateTo = null

		resetStepsData()

		$scope.$on 'resetStepsData', resetStepsData

		$scope.uiConfig = calendar:
			height: 450
			editable: true
			header:
				left: 'month basicWeek basicDay agendaWeek agendaDay'
				center: 'title'
				right: 'today prev,next'
			dayClick: $scope.alertEventOnClick
			eventDrop: $scope.alertOnDrop
			eventResize: $scope.alertOnResize

		$scope.eventSources = []


		$scope.$watchCollection 'selectedDates', () ->
			if not $scope.selectedDates.length
				resetStepsData()
				processContainer.setDates()
				return

			if $scope.selectedDates.length is 1
				date = $scope.selectedDates[0]
				$scope.selectedDate =
					timestamp: date
					viewValue: dateFormat.getDate(new Date(date))
					requestValue: dateFormat.getDateTimeCommon(new Date(date))
				$scope.dateFrom = null
				$scope.dateTo = null
				processContainer.setDates($scope.selectedDate.requestValue)
				return

			$scope.selectedDate = null
			start = $scope.selectedDates[0]
			end = $scope.selectedDates[$scope.selectedDates.length - 1]
			if start > end
				temp = start
				start = end
				end = temp
			$scope.dateFrom =
				timestamp: start
				viewValue: dateFormat.getDate(new Date(start))
				requestValue: dateFormat.getDateTimeCommon(new Date(start))
			$scope.dateTo =
				timestamp: end
				viewValue: dateFormat.getDate(new Date(end))
				requestValue: dateFormat.getDateTimeCommon(new Date(end))
			processContainer.setDates($scope.dateTo.requestValue, $scope.dateFrom.requestValue)


		# virtual

		$scope.nextStep.exec = () ->
			request = {
				personId: $scope.person.id
				personType: $scope.person.type
				processCode: processContainer.getProcess().code
			}
			request.dateFrom = processContainer.getDateFrom()
			request.dateTo = processContainer.getDateTo()
			request.dateTo = request.dateFrom if not request.dateTo and processContainer.getStep().selectionType is 1

			visitsResource.list request, (result) ->
				processContainer.setVisits(result)
				processContainer.gotToNextStep()

])