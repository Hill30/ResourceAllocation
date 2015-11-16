angular.module('app').service('processContainer', [
	'$rootScope', '$location', 'dictionariesService', 'personDataService', 'completeResource', 'popup'
	($rootScope, $location, dictionariesService, personDataService, completeResource, popup) ->

		$rootScope.processContainer = self = {}

		# processes common data

		self.list = []

		initializeProcesses = (call, person, callback) ->
			dictionariesService.getData (result) ->
				self.list = []

		# selected process data

		isInitialized = false
		stepIndex = null
		lastStepIndex = null

		resetProcess = () ->
			self.process = {}
			self.reason = {}
			self.step = {}
			stepIndex = null
			isInitialized = false

		initialize = (processParam, reasonParam) ->
			resetProcess()
			resetStepsData()
			self.process = processParam
			self.reason = reasonParam if reasonParam
			lastStepIndex = self.process.steps.length - 1
			isInitialized = true

		visits = null
		dateFrom = null
		dateTo = null
		note = null
		selectedVisitIdList = []

		# complete process

		self.completeProcess = () ->
			request =
				personId: personDataService.getPerson().id
				personType: personDataService.getPerson().type
				note: note

			completeResource.send( request, (result) ->
				$location.path('/home')
				popup.show
					type: 'success'
					text: self.process.name + ' completed successfully.'
					ttl: 2000
				resetProcess()
			, () ->
				popup.show
					type: 'danger'
					text: self.process.name + ' not completed.'
					ttl: -1
			)


		{
			initializeProcesses: initializeProcesses
			resetProcess: resetProcess
			initialize: initialize
			isProcessInitialized: -> isInitialized
			getNote: -> note
		}
])
