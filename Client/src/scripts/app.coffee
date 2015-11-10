app = angular.module 'app', ['envConfig', 'ngResource', 'ngRoute', 'ui.bootstrap', 'ui.scroll', 'addus', 'hill30']

angular.module('app').run ['$route', '$rootScope', '$location', ($route, $rootScope, $location) ->

	# fire an event related to the current route
	$rootScope.$on '$routeChangeSuccess', (event, currentRoute, priorRoute) ->
		$rootScope.$broadcast "#{currentRoute.controller}$routeChangeSuccess", currentRoute, priorRoute

	original = $location.path
	$location.path = (path, noReload) ->
		if noReload is true
			lastRoute = $route.current
			un = $rootScope.$on '$locationChangeSuccess', () ->
				$route.current = lastRoute
				un()
		return original.apply($location, [path])

]