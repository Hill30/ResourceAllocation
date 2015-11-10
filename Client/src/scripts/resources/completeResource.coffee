angular.module('app').factory('completeResource', ['$resource',
	($resource) ->
		$resource 'api/complete/', {}, {
			send: { method: 'POST' }
		}
])
