angular.module('app').factory('personsResource', ['$resource',
	($resource) ->
		$resource 'api/persons/', {}, {
			list: { method: 'GET', isArray: true }
		}
])

angular.module('app').factory('clientResource', ['$resource',
	($resource) ->
		$resource 'api/client/:id', {}, {
			get: { method: 'GET' }
		}
])

angular.module('app').factory('employeeResource', ['$resource',
	($resource) ->
		$resource 'api/employee/:id', {}, {
			get: { method: 'GET' }
		}
])

angular.module('app').factory('personResource', [
	'clientResource', 'employeeResource'
	(clientResource, employeeResource) ->
		get: {
			client: clientResource.get
			employee: employeeResource.get
		}
])

