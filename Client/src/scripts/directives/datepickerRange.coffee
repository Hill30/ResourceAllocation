angular.module('app')

.config(['$provide', ($provide) ->
	$provide.decorator 'daypickerDirective', [
		'$delegate', ($delegate) ->
			directive = $delegate[0]

			### Override compile ###

			link = directive.link

			directive.compile = ->
				(scope, element, attrs, ctrl) ->
					link.apply this, arguments
					selectedDates = []

					update = ->
						angular.forEach scope.rows, (row) ->
							angular.forEach row, (day) ->
								day.selected = selectedDates.indexOf(day.date.setHours(0, 0, 0, 0)) > -1

					# Called when multiSelect model is updated
					scope.$on 'update', (event, newDates) ->
						selectedDates = newDates
						update()

					# Get dates pushed into multiSelect array before Datepicker is ready
					scope.$emit 'requestSelectedDates'

					# Fires when date is selected or when month is changed.
					scope.$watch (->
						ctrl.activeDate.getTime()
					), update

			$delegate
	]
	return
])

.directive 'rangeSelect', ->
	require: [ 'ngModel' ]
	link: (scope, elem, attrs, ctrls) ->
		selectedDates = undefined

		### Called when directive is compiled ###

		scope.$on 'requestSelectedDates', ->
			scope.$broadcast 'update', selectedDates

		scope.$watchCollection attrs.rangeSelect, (newVal) ->
			selectedDates = newVal or []
			scope.$broadcast 'update', selectedDates

		scope.$watch attrs.ngModel, (newVal, oldVal) ->
			return if !newVal
			dateVal = newVal.getTime()

			# cancel selected range
			if selectedDates.length > 1
				for date in selectedDates
					selectedDates.splice(selectedDates.indexOf(date), 1)

			# select a day for the first time
			return selectedDates.push dateVal if not selectedDates.length

			selectedDates.sort()
			prevVal = selectedDates[0]
			nextVal = selectedDates[selectedDates.length - 1]

			setNext = () ->
				next = new Date(nextVal)
				next.setDate(next.getDate() + 1)
				nextVal = next.getTime()
				selectedDates.push nextVal

			setPrev = () ->
				prev = new Date(prevVal)
				prev.setDate(prev.getDate() - 1)
				prevVal = prev.getTime()
				selectedDates.push prevVal

			# create a range
			if dateVal > nextVal
				setNext()
				setNext() while nextVal < dateVal
			else if dateVal < nextVal
				setPrev()
				setPrev() while prevVal > dateVal
			else
				selectedDates.splice(selectedDates.indexOf(dateVal), 1)



