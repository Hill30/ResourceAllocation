angular.module('app').directive 'inputmaskCivilianTime', [
	'$parse', ($parse) ->
		restrict: 'A'
		require: '^ngModel'
		link: (scope, element, attrs) ->

			element.inputmask
				mask: "h:s t\\m"
				placeholder: "hh:mm am"
				alias: "datetime"
				hourFormat: "12"

			parsed = $parse(attrs.ngModel)

			element.on "change", ->
				scope.$apply () ->
					parsed.assign(scope, element.val())
]

angular.module('app').directive 'inputmaskTime', [
	'$parse', 'recordTypeService', ($parse, recordTypeService) ->
		restrict: 'A'
		require: '^ngModel'
		link: (scope, element, attrs) ->

			element.inputmask
				mask: "h:s"
				placeholder: "hh:mm"
				alias: "datetime"
				hourFormat: "24"

			parsed = $parse(attrs.ngModel)

			element.on "change", ->
				a = element.val()
				parsed.assign(scope, element.val())
]

angular.module('app').directive 'inputmaskTimeVisit', [
	'$parse', '$timeout', ($parse, $timeout) ->
		restrict: 'A'
		require: '^ngModel'
		link: (scope, element, attrs) ->

			placeholderBasic = "hh:mm"
			placeholderSmart = "00:mm"

			element.inputmask
				mask: "h:s"
				placeholder: placeholderBasic
				alias: "datetime"
				hourFormat: "24"

			parsed = $parse(attrs.ngModel)

			element.on "change", ->
				a = element.val()
				parsed.assign(scope, element.val())

			element.on "focus", (e) ->
				if not element.val()
					$timeout -> element.val(placeholderSmart)

			element.on "blur", ->
				element.val(placeholderBasic) if element.val() is placeholderSmart
]