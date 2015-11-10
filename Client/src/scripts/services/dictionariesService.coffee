angular.module('app').service('dictionariesService', [
	'$rootScope', 'dictionariesResource'
	($rootScope, dictionariesResource) ->
		dictionaries = {}
		loaded = false
		getData = (callback) ->
			if loaded
				console.log "Get Dictionary Resources"
				callback(dictionaries)
			else
				dictionariesResource.get {}, (response) ->
					console.log "Load Dictionary Resources"
					dictionaries = response
					loaded = true
					callback(dictionaries) if typeof callback is 'function'

		{
		getData: getData
		}
])
