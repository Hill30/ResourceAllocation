angular.module('app').service('personDataService', [
	'$rootScope', '$route', ($rootScope, $route) ->

		$rootScope.call = call = {}
		$rootScope.person = person = {}


		# initialization

		resetCall = () -> call[k] = null for k, v of call
		resetPerson = () -> person[k] = null for k, v of person

		setPersonTypeFull = () ->
			return if not person
			personTypeFull = if person.type is 'C' then 'client' else 'employee'
			person.typeFull = personTypeFull

		initialize = (callParam, personParam) ->
			angular.copy(callParam, call) if not angular.equals(callParam, call)
			angular.copy(personParam, person) if not angular.equals(personParam, person)
			setPersonTypeFull()

		initializeByRouteParams = () ->
			getCallFromRouteParams()
			getPersonFromRouteParams()
			setPersonTypeFull()


		# getting from $route current params

		getCallFromRouteParams = () ->
			routeParams = $route.current.params
			if routeParams.callType is 'inbound'
				call.type = 'I'
			else if routeParams.callType is 'outbound'
				call.type = '0'
			else if routeParams.callType is 'search'
				call.type = 'A'
			else
				console.log 'personDataService: there is no correct call type'
				resetCall()
				return

			call.typeFull = routeParams.callType

		getPersonFromRouteParams = () ->
			routeParams = $route.current.params
			if routeParams.personType is 'client'
				person.type = 'C'
			else if routeParams.personType is 'employee'
				person.type = 'E'
			else
				console.log 'personDataService: there is no correct person type'
				resetPerson()
				return

			if not routeParams.personId
				return console.log 'personDataService: there is no ' + routeParams.personType + ' id'

			person.id = routeParams.personId


		{
		initializeByRouteParams: initializeByRouteParams
		initialize: initialize
		getCall: -> call
		getPerson: -> person
		}
])
