hill30Module.factory 'notesDialogService', [
	'modalDialogs', '$templateCache', 'notesResource'
	(modalDialogs, $templateCache, notesResource) ->

		dialogInstanceId = 'notesDialog'
		notesDatasourceRevision = 0

		bodyTemplate =
			'
			<ul class="note-list" ui-scroll-viewport>
				<li class="note" ui-scroll="note in uiData.data.notesDatasource" buffer-size="10">
					<div class="note-title">
							<span class="note-author">{{note.author}}</span>
							<span class="note-date">{{note.createdAt}}</span>
					</div>
					<div class="note-content">
						{{note.text}}
					</div>
				</li>
			</ul>
			'

		$templateCache.put(dialogInstanceId + modalDialogs.commonTemplateId, bodyTemplate)

		configureData = ($scope, personForNotes) ->
			data = {}

			$scope.notesDatasource =
				get: (index, count, successCallback) ->
					return if not notesDatasourceRevision
					options = {}
					options.offset = index
					options.count = count
					options.personType = personForNotes.type
					options.personId = personForNotes.id
					notesResource.list(options, successCallback, () ->
						$scope.areNotesLoading = false
					)
				revision: ->
					notesDatasourceRevision
				loading: (value) ->
					$scope.areNotesLoading = value

			data.notesDatasource = $scope.notesDatasource
			data


		configure = ($scope, personForNotes) ->

			data = configureData($scope, personForNotes)
			notesDatasourceRevision++

			modalDialogs.instance(dialogInstanceId).configure(
				backdrop: true
				title: 'View Notes'
				windowClass: 'modal-notes'
				iconClass: 'glyphicon-comments'
				data: data
				actions: [
					caption: 'Ok'
					btnClass: 'btn-primary'
				]
			)

		return {
			configure: configure
		}
]