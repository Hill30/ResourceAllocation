angular.module('app').controller('visitsController', [
	'$scope', 'processContainer', 'dateFormat', 'notesDialogService'
	($scope, processContainer, dateFormat, notesDialogService) ->

		resetStepsData = () ->
			$scope.visits = []
			$scope.allVisitsSelected = false

		resetStepsData()
		$scope.$on 'resetStepsData', resetStepsData


		for visit in processContainer.getVisits()
			result = []
			if $scope.person.type is 'E' or $scope.person.type is 'A'
				result.personType = 'C'
				result.personId = visit.clientId
				result.personName = visit.clientName
			else if $scope.person.type is 'C'
				result.personType = 'E'
				result.personId = visit.employeeId
				result.personName = visit.employeeName
			result.date = dateFormat.getDate(new Date(visit.startTime))
			result.startTime = dateFormat.getTime(new Date(visit.startTime), true)
			result.endTime = dateFormat.getTime(new Date(visit.endTime), true)
			result.id = visit.id
			result.selected = false
			$scope.visits.push result


		$scope.pickAllVisits = () ->
			$scope.allVisitsSelected = !$scope.allVisitsSelected
			for visit in $scope.visits
				visit.selected = $scope.allVisitsSelected
			processContainer.setSelectedVisitIdList($scope.visits)

		$scope.pickVisit = (visit) ->
			visit.selected = !visit.selected
			processContainer.setSelectedVisitIdList($scope.visits)

		$scope.openNotes = (visit) ->
			notesDialogService.configure($scope, { type: visit.personType, id: visit.personId }).openDialog()

])