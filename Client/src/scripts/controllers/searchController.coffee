angular.module('app')
	.controller('searchController', [
		'$scope', '$location', '$routeParams', 'debounce', 'personsResource', 'personDataService', 'processContainer'
		($scope, $location, $routeParams, debounce, personsResource, personDataService, processContainer) ->

			# initialization

			processContainer.resetProcess()

			datasourceRevision = 0
			forcePersonsDataReload = -> datasourceRevision++
			defaultDebounceTime = 350
			$scope.filters =
				searchString: ''
			sorting = $scope.sorting = {
				by: null
				isAsc: isAscendingDefaultSortOrder
			}
			searchStringRouteParamsToken = 'searchString'
			sortByRouteParamsToken = 'sortBy'
			sortOrderRouteParamsToken = 'sortOrder'
			isAscendingDefaultSortOrder = true


			# set call

			call = $scope.call = {}

			call.typeFull = $routeParams.type


			# work with route params

			setSearchStringFromRouteParams = () ->
				$scope.filters.searchString = $routeParams.searchString if $routeParams.searchString

			setSortingFromRouteParams = () ->
				sorting.by = $routeParams[sortByRouteParamsToken] if $routeParams[sortByRouteParamsToken]
				sorting.isAsc = isSortOrderAsc($routeParams[sortOrderRouteParamsToken]) if $routeParams[sortOrderRouteParamsToken]

			refreshSortingWithinRouteParams = () ->
				valueBy = if sorting and sorting.by then sorting.by else null
				$location.search(sortByRouteParamsToken, valueBy).replace()
				valueOrder = if sorting and sorting.isAsc then 'asc' else 'desc'
				$location.search(sortOrderRouteParamsToken, if valueBy then valueOrder else null).replace()

			refreshSearchStringWithinRouteParams = () ->
				$location.search(searchStringRouteParamsToken, $scope.filters.searchString or null).replace()


			# sorting implementation

			isSortOrderAsc = (orderString) ->
				return if orderString is 'asc' then true else false

			$scope.setSort = (token) ->
				if sorting.by isnt token
					sorting.isAsc =  if token is 'dateSent' then false else isAscendingDefaultSortOrder
					sorting.by = token
				else
					sorting.isAsc = !sorting.isAsc
				refreshSortingWithinRouteParams()
				forcePersonsDataReload()

			$scope.sortPredicate = (sortBy, sortOrder) ->
				return sorting.by is sortBy and sorting.isAsc is isSortOrderAsc(sortOrder)


			# search string filtering

			setSearchStringDebounced = debounce () ->
				refreshSearchStringWithinRouteParams()
				forcePersonsDataReload()
			, defaultDebounceTime, false


			# scroller datasource implementation

			$scope.personsDatasource =
				get: (index, count, successCallback) ->
					return if not datasourceRevision # todo dhilt : think about first data load (zero, which is odd)...

					options = {}
					options.offset = index
					options.count = count
					options.searchString = $scope.filters.searchString
					if sorting.by
						options.sortBy = sorting.by
						options.sortOrder = if sorting.isAsc then 'asc' else 'desc'

					processedCallback = (result) ->
						successCallback(result)

					personsResource.list(options, processedCallback, () ->
						$scope.isGridLoading = false
					)

				revision: ->
					datasourceRevision
				loading: (value) ->
					$scope.isGridLoading = value


			# common actions: pick a person

			$scope.pickPerson = (person) ->
				personDataService.initialize(call, person)
				$location.path($scope.person.typeFull + '/' + person.id)


			# subscriptions

			setSubscriptions = () ->
				$scope.$watch "filters.searchString", setSearchStringDebounced


			# start program

			setSubscriptions()
			setSearchStringFromRouteParams()
			setSortingFromRouteParams()

	])