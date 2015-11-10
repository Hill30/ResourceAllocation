angular.module('app').service('processContainer', [
	'$rootScope', '$location', 'dictionariesService', 'personDataService', 'completeResource', 'popup'
	($rootScope, $location, dictionariesService, personDataService, completeResource, popup) ->

		$rootScope.processContainer = self = {}

		# processes common data

		self.list = []

		initializeProcesses = (call, person, callback) ->
			dictionariesService.getData (result) ->
				self.list = []
				for process in result.processes
					if (process.callType is call.type or process.callType is 'A') and (process.callerType is person.type or process.callerType is 'A')
						self.list.push process
				callback(self.list) if typeof callback is 'function'


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
			setNextStep(true)
			isInitialized = true

		isCurrentStepDataCorrect = (selectionType) ->
			if not selectionType or selectionType is 'none'
				return !self.step.mandatory
			if selectionType is 'single'
				return self.step.selectionType is 0 or self.step.selectionType is 1
			if selectionType is 'range'
				return self.step.selectionType is 1
			true # just for 'filled'

		setStepSettings = (settings = {}) ->
			isCorrect = isCurrentStepDataCorrect(settings.selection)

			self.isNextStepAvailable = !(lastStepIndex is stepIndex) and isCorrect

			self.isCompleteAvailable = isCorrect
			return if not isCorrect

			# check for next steps mandatory if current step data is correct
			if stepIndex is lastStepIndex
				self.isCompleteAvailable = true
			else
				for i in [stepIndex + 1 .. lastStepIndex]
					if self.process.steps[i].mandatory
						self.isCompleteAvailable = false
						break
					self.isCompleteAvailable = true

		setNextStep = (init) ->
			stepIndex = if init then 0 else stepIndex + 1
			if stepIndex > self.process.steps.length or stepIndex < 0
				return console.log 'processContainer: can\'t set next step, out of array'
			self.step = self.process.steps[stepIndex]
			setStepSettings()

		setStep = (stepParam) ->
			stepIndex = self.process.steps.indexOf(stepParam)
			if stepIndex is -1
				return console.log 'processContainer: can\'t set step, out of array'
			self.step = self.process.steps[stepIndex]
			setStepSettings()

		goToStep = (stepParam) ->
			setStep(stepParam)
			$location.path('/process/' + self.step.name)

		gotToNextStep = () ->
			setNextStep()
			$location.path('/process/' + self.step.name)


		# steps data

		visits = null
		dateFrom = null
		dateTo = null
		note = null
		selectedVisitIdList = []

		resetStepsData = () ->
			visits = null
			dateFrom = null
			dateTo = null
			note = null
			selectedVisitIdList = []
			$rootScope.$broadcast('resetStepsData')

		setDates = (dateFromParam = null, dateToParam = null) ->
			dateFrom = dateFromParam
			dateTo = dateToParam
			if not dateFrom and not dateTo
				return setStepSettings({selection: 'none'})
			if dateFrom and not dateTo
				return setStepSettings({selection: 'single'})
			setStepSettings({selection: 'range'})

		setVisits = (visitsParam) ->
			visits = visitsParam

		setSelectedVisitIdList = (visits) ->
			selectedVisitIdList = []
			selection = 'none'
			for visit in visits
				if visit.selected
					selectedVisitIdList.push visit.id
					selection = 'range' # todo dhilt : is it hardcode for visits ?
			setStepSettings({selection: selection})

		setNote = (noteParam) ->
			note = noteParam
			setStepSettings({selection: if note then 'filled' else 'none'})



		# complete process

		self.completeProcess = () ->
			request =
				personId: personDataService.getPerson().id
				personType: personDataService.getPerson().type
				processCode: self.process.code
				note: note,
				processPayload:
					dateFrom: dateFrom,
					dateTo: dateTo,
					visits: selectedVisitIdList

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
		getProcess: -> self.process
		getReason: -> self.reason
		getSteps: -> self.process.steps
		getStep: -> self.step
		gotToNextStep: gotToNextStep
		goToStep: goToStep

		setDates: setDates
		getDateFrom: -> dateFrom
		getDateTo: -> dateTo
		setVisits: setVisits
		getVisits: -> visits
		setSelectedVisitIdList: setSelectedVisitIdList
		getSelectedVisitIdList: -> selectedVisitIdList
		setNote: setNote
		getNote: -> note
		}
])
