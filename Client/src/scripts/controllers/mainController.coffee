angular.module('app').controller('mainController', [
	'$scope', '$rootScope', 'userInfoService', 'dictionariesService'
	($scope, $rootScope, userInfoService, dictionariesService) ->

		userInfoService.initializeAsync().then (userInfo) ->
			$rootScope.userInfo = userInfo
			$rootScope.userInfo.hasPermission = userInfoService.hasPermission
			dictionariesService.getData() # just pre-load

])