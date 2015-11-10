angular.module('app').factory('notesResource', ['$resource',
	($resource) ->
		$resource 'api/notes/', {}, {
			list: { method: 'GET', isArray: true }
		}
])
