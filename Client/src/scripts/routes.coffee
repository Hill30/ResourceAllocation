angular.module('app').config ['$routeProvider', ($routeProvider) ->
	$routeProvider
	.when("/home",
		templateUrl: "views/searchView.html", reloadOnSearch: false)
	.when("/:personType/:personId",
		templateUrl: "views/processView.html")
	.otherwise
		redirectTo: "/home"
]