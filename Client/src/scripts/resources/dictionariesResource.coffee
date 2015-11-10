angular.module('app')
.factory('dictionariesResource', ['$resource', ($resource) ->
		$resource 'api/dictionaries', {}, {
			get:	{ method: 'GET' }
		}
	])
