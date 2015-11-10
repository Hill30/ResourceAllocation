angular.module('app').factory 'dateFormat', () ->

	getDate: (date) ->
		month = date.getMonth() + 1
		month = "0" + month.toString() if month < 10
		day = date.getDate()
		day = "0" + day.toString() if day < 10
		return month + "/" + day + "/" + date.getFullYear()

	getTime: (date, isMilitary = true) ->
		hours = date.getHours()
		minutes = date.getMinutes()
		militaryPart = ""
		if isMilitary
			isPm = false
			if hours == 0 or hours == 24
				hours = 12
			else
				isPm = true if hours >= 12
				hours -= 12 if hours > 12
			militaryPart = " " + if isPm then "pm" else "am"
		hours = "0" + hours.toString() if hours < 10
		minutes = "0" + minutes.toString() if minutes < 10
		return hours + ":" + minutes + militaryPart

	getDateCommon: (date) ->
		month = date.getMonth() + 1
		month = "0" + month.toString() if month < 10
		day = date.getDate()
		day = "0" + day.toString() if day < 10
		return date.getFullYear() + "/" + month + "/" + day

	getTimeCommon: (date) ->
		hours = date.getHours()
		minutes = date.getMinutes()
		seconds = date.getSeconds()
		hours = "0" + hours.toString() if hours < 10
		minutes = "0" + minutes.toString() if minutes < 10
		seconds = "0" + seconds.toString() if seconds < 10
		return hours + ":" + minutes + ":" + seconds

	getDateTimeCommon: (date) ->
		this.getDateCommon(date) + 'T' + this.getTimeCommon(date)
