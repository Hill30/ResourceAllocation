angular.module('app').factory('visitsResource', ['$resource',
	($resource) ->
		$resource 'api/visits/', {}, {
			list: { method: 'GET', isArray: true }
		}
])
