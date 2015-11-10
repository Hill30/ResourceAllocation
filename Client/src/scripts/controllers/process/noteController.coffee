angular.module('app').controller('noteController', [
	'$scope', 'processContainer'
	($scope, processContainer) ->

		resetStepsData = () ->
			$scope.noteText = ""

		resetStepsData()
		$scope.$on 'resetStepsData', resetStepsData


		$scope.$watch 'noteText', (value) ->
			processContainer.setNote(value)

])