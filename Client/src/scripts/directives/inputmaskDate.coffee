angular.module('app').directive 'inputmaskDate', [
	'$parse', '$timeout', 'dateFormat', ($parse, $timeout, dateFormat) ->
		restrict:'A'
		require: '^ngModel'
		link: (scope, element, attrs, ngModelCtrl) ->

			mask = attrs.mask || 'mm/dd/yyyy'
			element.inputmask(mask)

			if attrs.inputmaskDateYear is 'true'
				hasYearEnhancement = true
				dateNow = dateFormat.getDate(new Date())
				year = dateNow.substr(6)
				setViewValue = (value) ->
					element.val(value)
					ngModelCtrl.$setViewValue(value)
					element[0].setSelectionRange(6, 10)

			dRegex = new RegExp("^(0[1-9]|1[0-2])\/(0[1-9]|1[0-9]|2[0-9]|3[0-1])\/(19[0-9]{2}|2[0-9]{3})$")
			dRegexNoYear = new RegExp("^(0[1-9]|1[0-2])\/(0[1-9]|1[0-9]|2[0-9]|3[0-1])\/yyyy$")

			scope.$watch () ->
				ngModelCtrl.$viewValue
			, (value) ->
				if typeof value is 'string'
					if hasYearEnhancement and dRegexNoYear.test(value)
						return setViewValue value.substr(0,6) + year
					if value isnt mask
						ngModelCtrl.$setValidity('dateFormat', dRegex.test(value))
					else
						ngModelCtrl.$setValidity('dateFormat', true)
						ngModelCtrl.$setValidity('required', false)
				else
					ngModelCtrl.$setValidity('dateFormat', true)

]