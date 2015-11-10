angular.module('app').config(['$httpProvider', ($httpProvider) ->
	# httpInterceptor factory must exists i.e. as a part of hill30Module (WebApiComponents)
	$httpProvider.interceptors.push('httpInterceptor')
])