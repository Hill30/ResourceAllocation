angular.module('app').config ['$routeProvider', ($routeProvider) ->
	$routeProvider
	.when("/home",
		templateUrl: "views/homeView.html")
	.when("/call/:type",
		templateUrl: "views/callView.html", reloadOnSearch: false)
	.when("/:callType/:personType/:personId",
		templateUrl: "views/processView.html")
	.when("/process/:step",
		templateUrl: "views/processView.html")
	.otherwise
		redirectTo: "/home"
]