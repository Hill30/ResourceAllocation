currentDate = new Date()
day = currentDate.getDate()

dayF = day
dayE = day + 3
dayM = day + 1

if (dayM < 10)
    dayM = "0" + dayM

if (dayE < 10)
    dayE = "0" + dayE

if (dayF < 10)
    dayF = "0" + dayF

if (day < 10)
    day = "0" + day




month = currentDate.getMonth() + 1
if (month < 10)
    month = "0" + month

year = currentDate.getFullYear()

monthA = currentDate.getMonth() + 2
if (monthA > 12)
    monthA = monthA - 12
    yearA = year + 1
if (monthA < 10)
    monthA = "0" + monthA
dateA = monthA + " " + day + " " + yearA

dateC = month + "/" + day + "/" + year

hoursP = new Date().getHours()
minutes = new Date().getMinutes()
if (minutes < 10)
    minutes = "0" + minutes

if hoursP > 12
    hours = hoursP - 12
       
timeS = hours + ":" + minutes + " am"

hoursE = hoursP + 1

if hoursE > 12
    hoursEnd = hoursE - 12

timeE = hoursEnd + ":" + minutes + " am"



checkF = "Selected date: " + month + "/" + day + "/" + year
checkR = "Selected range: " + month + "/" + day + "/" + year
checkS = "- " + month + "/" + dayE + "/" + year

addActivity = element(`by`.xpath('//button[@ng-click="createRecord(activeType.id)"]'))
addNewActivity = element(`by`.xpath('//button[@ng-click="createRecord(activeType.id)"]'))
Cancel = element(`by`.xpath('//a[@ng-click="cancel()"]'))

employeeAdd = element(`by`.model('employee'))
serviceDateAdd = element(`by`.xpath('//input[@name="serviceDate"]'))
startTimeAdd = element(`by`.model('ar.startTime'))
endTimeAdd = element(`by`.model('ar.endTime'))
serviceCodeAdd = element(`by`.model('ar.serviceCode'))
clientAdd = element(`by`.model('client'))
duration = element(`by`.model('ar.duration'))
TravelDistance = element(`by`.model('ar.travelDistance'))
TravelTime = element(`by`.model('ar.travelTime'))
ErrandDistance = element(`by`.model('ar.errandDistance'))
VisitOutcome = element(`by`.model('ar.visitOutcome'))

switchCompleted = element(`by`.xpath('//input[@value="exported"]'))

ServiceDateSched = element(`by`.xpath('//td[@id="autoTestId.activityRecordEdit.serviceDate.scheduled"]'))
ServiceDateRecord = element(`by`.xpath('//td[@id="autoTestId.activityRecordEdit.serviceDate.recorded"]'))
ServiceDateOverride = element(`by`.xpath('//input-date[@id="autoTestId.activityRecordEdit.serviceDate.override"]'))
ServiceDateRounded = element(`by`.xpath('//td[@id="autoTestId.activityRecordEdit.serviceDate.rounded"]'))

StartTimeSched = element(`by`.xpath('//td[@id="autoTestId.activityRecordEdit.startTime.scheduled"]'))
StartTimeRecord = element(`by`.xpath('//td[@id="autoTestId.activityRecordEdit.startTime.recorded"]'))
StartTimeOverride = element(`by`.xpath('//input[@id="autoTestId.activityRecordEdit.startTime.override"]'))
StartTimeRounded = element(`by`.xpath('//td[@id="autoTestId.activityRecordEdit.startTime.rounded"]'))


EndTimeSched = element(`by`.xpath('//td[@id="autoTestId.activityRecordEdit.endTime.scheduled"]'))
EndTimeRecord = element(`by`.xpath('//td[@id="autoTestId.activityRecordEdit.endTime.recorded"]'))
EndTimeOverride = element(`by`.xpath('//input[@id="autoTestId.activityRecordEdit.endTime.override"]'))
EndTimeRounded = element(`by`.xpath('//td[@id="autoTestId.activityRecordEdit.endTime.rounded"]'))


HoursScheduled = element(`by`.xpath('//td[@id="autoTestId.activityRecordEdit.hours.scheduled"]'))
HoursRecorded = element(`by`.xpath('//td[@id="autoTestId.activityRecordEdit.hours.recorded"]'))
HoursOverride = element(`by`.xpath('//input[@id="autoTestId.activityRecordEdit.hours.override"]'))
HoursRounded = element(`by`.xpath('//td[@id="autoTestId.activityRecordEdit.hours.rounded"]'))

ServiceCodeRecorded = element(`by`.xpath('//td[@id="autoTestId.activityRecordEdit.serviceCode.recorded"]'))
ServiceCodeOverride = element(`by`.xpath('//select[@id="autoTestId.activityRecordEdit.serviceCode.override"]'))


VisitOutcomeRecorded = element(`by`.xpath('//td[@id="autoTestId.activityRecordEdit.visitOutcome.recorded"]'))
VisitOutcomeOverride = element(`by`.xpath('//select[@id="autoTestId.activityRecordEdit.visitOutcome.override"]'))

Calendar = element(`by`.css('i.glyphicon.glyphicon-calendar'))
Today =  element(`by`.xpath('//*[@ng-click="setToday()"]'))


userNameEl = element(`by`.name('UserName'))
passwordEl = element(`by`.name('Password'))
buttonEl = element(`by`.css('.buttons input'))
incorrectPas = element(`by`.xpath('//div[@class="validation-summary-errors"]'))


Inbound =  element(`by`.xpath('//*[@href="#call/inbound"]'))
Outbound =  element(`by`.xpath('//*[@href="#call/outbound"]'))
Search =  element(`by`.xpath('//*[@href="#call/search"]'))


#SearchForm = element(`by`.xpath('//div[@ng-model="filters.searchString"]'))
SearchForm = element(`by`.model('filters.searchString'))
ClearSearchForm = element(`by`.css('a.input-clean'))

ColName = element(`by`.css('div.grid-col-name.sort'))
ColPhone = element(`by`.css('div.grid-col-phone.sort'))
ColLocation = element(`by`.css('div.grid-col-location.sort'))
ColType = element(`by`.css('div.grid-col-type.sort'))

EmployeeType = element(`by`.xpath('//span[@ng-show="person.type==\u0027E\u0027"]'))
ClientType = element(`by`.xpath('//span[@ng-show="person.type==\u0027C\u0027"]'))

DetController = element(`by`.xpath('//div[@ng-controller="detailsController"]'))
HomeController = element(`by`.xpath('//div[@ng-controller="homeController"]'))


Calendar = element(`by`.model('pickerValue'))

SelectedDate = element(`by`.xpath('//span[@ng-show="selectedDate"]'))
DateFrom = element(`by`.xpath('//span[@ng-show="dateFrom"]'))
DateTo = element(`by`.xpath('//span[@ng-show="dateTo"]'))

ScName = element(`by`.xpath('//div[@class="grid-col-name"]'))
ScDate = element(`by`.xpath('//div[@class="grid-col-date"]'))
ScTime = element(`by`.xpath('//div[@class="grid-col-time"]'))
ScNote = element(`by`.css('div.grid-col-note'))
CheckVisit = element(`by`.xpath('//input[@ng-checked="visit.selected"]'))

ViewNote = element(`by`.xpath('//a[@ng-click="openNotes(visit); $event.stopPropagation();"]'))
WinNote = element(`by`.xpath('//h4[@class="ng-binding"]'))
CloseWinNote = element(`by`.xpath('//button[@ng-click="action.do()"]'))

CompletedProcess = element(`by`.xpath('//a[@ng-click="completeProcess()"]'))
CancelProcess = element(`by`.xpath('//a[@ng-click="cancelProcess()"]'))
Next = element(`by`.xpath('//a[@ng-click="nextStep.exec()"]'))


CancellCall = element(`by`.xpath('//div[@class="modal-body ng-binding"]'))
ResumeCall =  element(`by`.css('button.btn.btn-primary'))

ConfirmCancelCall =  element(`by`.buttonText('Cancel call'))

NoteForProcess = element(`by`.model('noteText'))



ptor = protractor.getInstance()

describe "2502", ->
  beforeEach ->
    ptor = protractor.getInstance()
    ptor.ignoreSynchronization = true
    browser.manage().timeouts().implicitlyWait(80000);

    #ptor.manage().deleteAllCookies()
    #ptor.manage().addCookie "FedAuth", "77u/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz48U2VjdXJpdHlDb250ZXh0VG9rZW4gcDE6SWQ9Il8zMmFlZmIyMy03OTRjLTQwOGUtOGEyZi1hNTFiYzgwMjMxNmQtODRFQjlCMzlDMDNFMTg4REM0RTM0NUU1NDNEMjkwRjkiIHhtbG5zOnAxPSJodHRwOi8vZG9jcy5vYXNpcy1vcGVuLm9yZy93c3MvMjAwNC8wMS9vYXNpcy0yMDA0MDEtd3NzLXdzc2VjdXJpdHktdXRpbGl0eS0xLjAueHNkIiB4bWxucz0iaHR0cDovL2RvY3Mub2FzaXMtb3Blbi5vcmcvd3Mtc3gvd3Mtc2VjdXJlY29udmVyc2F0aW9uLzIwMDUxMiI+PElkZW50aWZpZXI+dXJuOnV1aWQ6YzU1YzY2MGYtMmM3Ny00Y2Q5LWIxNjYtYTg1ZWRlODVmYTJmPC9JZGVudGlmaWVyPjxDb29raWUgeG1sbnM9Imh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwNi8wNS9zZWN1cml0eSI+N1kvL3BNRmNSdENZZmZJMllnd3BTZG5aandCOU1KNHZxeVQ3dEI4ekJiVVJXN2pRMFBmQS9aazNydmpJekh3Z0kreHNvb2xZMVovMWV4Y0NIOVZaZmdsMmpyb3FianZTMU5pODJkc3ptcWlqSHcvcFdjSyt2eU9RQlFlZTVpY1RiYVVlT2wwT00rdkhmUC9oVmZBdkFrekdJZTlpMW5Rc3R5aC9kbFBpZjIrSkUvV1E4VmUvVmZvR0ZYWW1NMmEySG43VDE4MjhHSHd6cUY4REp1UUFhc3l6dlpMWEFYK2crVjhzNjl3WGdRdk4zK25Rd1FCQVh1cWxHK0d1UlhDSWVJd1BWUjE0aHZ0b2YxK0M1ekhTaFBRa0pJbmRER3VNK3ZVSkRRTXdvYityTkJmZkozdWdVV3lWbWJNc1NhSFpKU0xBaTlRM0dUaTFicDd6WFlrQ2x5ekxMV1dpT3BWRXdrMXVTVjNScXM3TlFINWpWN0YrcmVFSHpVQlNiNXhnRVNRY251eWRlUkFNTExqY3pKSitGTUpYZkY5aTA5dE9mRDlydXFGWlpPVEFBS2NhUk0zd2NRVE41MmJ1cmNVd0ZaaTdoTGRPMHl1RGQ1aTFKaG5aeHFlN09SNmlUejBTTnpjUkljSnAxelJLbXNUZ3RheVA1RVM5WlBkK29QbWdhWjlQSnFNNGdIOTV2R1Vmd2dVZnFETmIwS0VXR0wxOFdONUZCL3JwMWZGWlM2UzNHeGZLbkxPdHoxeC9YQVl2U3pmS1EybmZDTjVwZEE0cmFmby9scC9vbjcrY1Q5UGFkQ2RsSTlwYy9qNVBWTGZXRVVLTS9EL2Uram9GUm4wazFWWUxKY2RHalU2amZJcDd4YnhRaU1FaC9WYkx2WWlJRE43Z1pGd3pyS1NGSEJMeUZYajJ2WVdnMHRhS0p5SFdRTVliMjd6V3hVcjM2R1BNNWZLK1p1UzI1TmM1ZTJjTjErMnRacm5PRkovendUSlRKNXI2TjAyaE1QT2hFdEVFaHoxQkZwUFVhejRHRmdHSGRzRjRQTk0zWGZzaHFCWHZ1S0RvQm5DY09MQWl3c2FhUTRaeTAvYmpMZ1o3RDA1U1ducFVNaEExeUp5azhMeUNmeERqWUFIVDZMN2xoRVpmRDlkeElvdVhUN0xrdlpkaElRUXdzWm5KcTZic3F0RER0VEpiWG0xYzZCRFJxMzE4bG52YVU1SnhiNzNFK0RtRUdiZFdNMW1xYWVHUkZENWt6YjBHL2wrdVZLZzllZmVFUHlsTGcxSVdrbWJaVjR6Z3NhVHRNbThSY01sZnh2Q0hiRDR1Y29MVlJQRHVzQVNEUTNCOWxybDU5MEhXTDAyTDBocFJ0N3Y1dTJzaHprdENnWnFFVFA1dDFJaVUxMWNJejQ1"
    #ptor.manage().addCookie "FedAuth1", "WjdrbG5Kak83V1ZsR1cxaFZjNDZtcy83TVhrSmRuYnExVitPcWVRcGNXUFV5eDVUMG9PVjdSRTA9PC9Db29raWU+PC9TZWN1cml0eUNvbnRleHRUb2tlbj4="    
    #browser.driver.get "https://adfs.hill30.com/public/servicetracker/#/activities"

    

  it "2399", ->
    "Log with incorrect credential password"
    browser.get ('#')
    browser.driver.manage().window().maximize()
    #browser.driver.manage().timeouts(10000).implicitlyWait(15000)
    #browser.driver.manage().timeouts(10000).setScriptTimeout(1500)
    #browser.driver.manage().timeouts(10000).pageLoadTimeout(1500)

    #
      
    selectEl = element(`by`.xpath('//select/option[2]'))
    submitEl = element(`by`.xpath('//input[@type="submit"]'))

    expect(ptor.isElementPresent(selectEl)).toBe(true)
    expect(ptor.isElementPresent(submitEl)).toBe(true)

    selectEl.click()
    submitEl.click()

    expect(ptor.isElementPresent(userNameEl)).toBe(true)
    expect(ptor.isElementPresent(passwordEl)).toBe(true)
    expect(ptor.isElementPresent(buttonEl)).toBe(true)

    userNameEl.sendKeys('test')
    passwordEl.sendKeys('password')
    buttonEl.click()

    expect(ptor.isElementPresent(Outbound)).toBe(true)

    Outbound.click()
    #ptor.sleep 500

    Inbound.click()
    expect(element(`by`.xpath('//*[text()[contains(.,"Inbound Call")]]')).isPresent()).toBe(true)

    #

  it "2523", ->
    "Cancel Call from Calendar (without selected date)(Inbound)"

    Inbound.click()
    expect(element(`by`.xpath('//*[text()[contains(.,"Inbound Call")]]')).isPresent()).toBe(true)

    expect(ColName).toBePresentAndDisplayed()
    expect(ColPhone).toBePresentAndDisplayed()
    expect(ColLocation).toBePresentAndDisplayed()
    expect(ColType).toBePresentAndDisplayed()

    SelectEmployees =  element.all(`by`.cssContainingText('span.ng-scope', 'Employee'))
    SelectEmployee = SelectEmployees.first() 
    SelectEmployee.click() 

    Branch =  element(`by`.cssContainingText('label.data-label', 'Branch'))
    expect(Branch).toBePresentAndDisplayed()


    CallOffReason = element(`by`.cssContainingText('span.menu-reasons-link.ng-binding', 'Call Off'))
    expect(CallOffReason).toBePresentAndDisplayed()
    Li = CallOffReason.element(`by`.xpath('ancestor::li'))
    browser.actions().mouseMove(Li).perform();
    element(`by`.cssContainingText('a.ng-binding', 'Family Emergency')).click();

    expect(Calendar).toBePresentAndDisplayed()
    expect(CancelProcess).toNotHaveClass('disabled')

    Inbound.click()

    expect(CancellCall).toBePresentAndDisplayed()
    expect(CancellCall.getText()).toBe('Please confirm that the call has to be canceled')

    ResumeCall.click()
    expect(Calendar).toBePresentAndDisplayed()

    Inbound.click()

    expect(CancellCall).toBePresentAndDisplayed()
    expect(CancellCall.getText()).toBe('Please confirm that the call has to be canceled')

    ConfirmCancelCall.click()
    #expect(Calendar).toBePresentAndDisplayed()

    expect(element(`by`.xpath('//*[text()[contains(.,"Inbound Call")]]')).isPresent()).toBe(true)




    "Cancel Call from Calendar (without selected date)(Outbound)"


    Inbound.click()
    expect(element(`by`.xpath('//*[text()[contains(.,"Inbound Call")]]')).isPresent()).toBe(true)

    expect(ColName).toBePresentAndDisplayed()
    expect(ColPhone).toBePresentAndDisplayed()
    expect(ColLocation).toBePresentAndDisplayed()
    expect(ColType).toBePresentAndDisplayed()

    SelectEmployees =  element.all(`by`.cssContainingText('span.ng-scope', 'Employee'))
    SelectEmployee = SelectEmployees.first() 
    SelectEmployee.click() 

    Branch =  element(`by`.cssContainingText('label.data-label', 'Branch'))
    expect(Branch).toBePresentAndDisplayed()


    CallOffReason = element(`by`.cssContainingText('span.menu-reasons-link.ng-binding', 'Call Off'))
    expect(CallOffReason).toBePresentAndDisplayed()
    Li = CallOffReason.element(`by`.xpath('ancestor::li'))
    browser.actions().mouseMove(Li).perform();
    element(`by`.cssContainingText('a.ng-binding', 'Family Emergency')).click();

    expect(Calendar).toBePresentAndDisplayed()
    expect(CancelProcess).toNotHaveClass('disabled')

    Outbound.click()

    expect(CancellCall).toBePresentAndDisplayed()
    expect(CancellCall.getText()).toBe('Please confirm that the call has to be canceled')

    ResumeCall.click()
    expect(Calendar).toBePresentAndDisplayed()

    Outbound.click()

    expect(CancellCall).toBePresentAndDisplayed()
    expect(CancellCall.getText()).toBe('Please confirm that the call has to be canceled')

    ConfirmCancelCall.click()
    #expect(Calendar).toBePresentAndDisplayed()

    expect(element(`by`.xpath('//*[text()[contains(.,"Outbound")]]')).isPresent()).toBe(true)



    "Cancel Call from Calendar (without selected date)(Search)"


    Inbound.click()
    expect(element(`by`.xpath('//*[text()[contains(.,"Inbound Call")]]')).isPresent()).toBe(true)

    expect(ColName).toBePresentAndDisplayed()
    expect(ColPhone).toBePresentAndDisplayed()
    expect(ColLocation).toBePresentAndDisplayed()
    expect(ColType).toBePresentAndDisplayed()

    SelectEmployees =  element.all(`by`.cssContainingText('span.ng-scope', 'Employee'))
    SelectEmployee = SelectEmployees.first() 
    SelectEmployee.click() 

    Branch =  element(`by`.cssContainingText('label.data-label', 'Branch'))
    expect(Branch).toBePresentAndDisplayed()


    CallOffReason = element(`by`.cssContainingText('span.menu-reasons-link.ng-binding', 'Call Off'))
    expect(CallOffReason).toBePresentAndDisplayed()
    Li = CallOffReason.element(`by`.xpath('ancestor::li'))
    browser.actions().mouseMove(Li).perform();
    element(`by`.cssContainingText('a.ng-binding', 'Family Emergency')).click();

    expect(Calendar).toBePresentAndDisplayed()
    expect(CancelProcess).toNotHaveClass('disabled')

    Search.click()

    expect(CancellCall).toBePresentAndDisplayed()
    expect(CancellCall.getText()).toBe('Please confirm that the call has to be canceled')

    ResumeCall.click()
    expect(Calendar).toBePresentAndDisplayed()

    Search.click()

    expect(CancellCall).toBePresentAndDisplayed()
    expect(CancellCall.getText()).toBe('Please confirm that the call has to be canceled')

    ConfirmCancelCall.click()
    #expect(Calendar).toBePresentAndDisplayed()

    expect(element(`by`.xpath('//*[text()[contains(.,"Search")]]')).isPresent()).toBe(true)


  it "2525", ->
    "Cancel Call from Calendar (with selected date)(Inbound)"

    Inbound.click()
    expect(element(`by`.xpath('//*[text()[contains(.,"Inbound Call")]]')).isPresent()).toBe(true)

    expect(ColName).toBePresentAndDisplayed()
    expect(ColPhone).toBePresentAndDisplayed()
    expect(ColLocation).toBePresentAndDisplayed()
    expect(ColType).toBePresentAndDisplayed()

    SelectEmployees =  element.all(`by`.cssContainingText('span.ng-scope', 'Employee'))
    SelectEmployee = SelectEmployees.first() 
    SelectEmployee.click() 

    Branch =  element(`by`.cssContainingText('label.data-label', 'Branch'))
    expect(Branch).toBePresentAndDisplayed()


    CallOffReason = element(`by`.cssContainingText('span.menu-reasons-link.ng-binding', 'Call Off'))
    expect(CallOffReason).toBePresentAndDisplayed()
    Li = CallOffReason.element(`by`.xpath('ancestor::li'))
    browser.actions().mouseMove(Li).perform();
    element(`by`.cssContainingText('a.ng-binding', 'Family Emergency')).click();

    expect(Calendar).toBePresentAndDisplayed()
    expect(CancelProcess).toNotHaveClass('disabled')

    DateFirsts = element.all(`by`.cssContainingText('span.ng-binding', dayF))
    DateFirst = DateFirsts.first() 
    DateFirstP = DateFirst.element(`by`.xpath('ancestor::button'))
    DateFirstP.click()


    DateMidles = element.all(`by`.cssContainingText('span.ng-binding', dayM))
    DateMidle = DateMidles.first() 
    DateMidleP = DateMidle.element(`by`.xpath('ancestor::button'))


    DateSeconds = element.all(`by`.cssContainingText('span.ng-binding', dayE))
    DateSecond = DateSeconds.first() 
    DateSecondP = DateSecond.element(`by`.xpath('ancestor::button'))
    DateSecondP.click()

    Inbound.click()

    expect(CancellCall).toBePresentAndDisplayed()
    expect(CancellCall.getText()).toBe('Please confirm that the call has to be canceled')

    ResumeCall.click()
    expect(Calendar).toBePresentAndDisplayed()

    Inbound.click()

    expect(CancellCall).toBePresentAndDisplayed()
    expect(CancellCall.getText()).toBe('Please confirm that the call has to be canceled')

    ConfirmCancelCall.click()
    #expect(Calendar).toBePresentAndDisplayed()

    expect(element(`by`.xpath('//*[text()[contains(.,"Inbound Call")]]')).isPresent()).toBe(true)




    "Cancel Call from Calendar (with selected date)(Outbound)"


    Inbound.click()
    expect(element(`by`.xpath('//*[text()[contains(.,"Inbound Call")]]')).isPresent()).toBe(true)

    expect(ColName).toBePresentAndDisplayed()
    expect(ColPhone).toBePresentAndDisplayed()
    expect(ColLocation).toBePresentAndDisplayed()
    expect(ColType).toBePresentAndDisplayed()

    SelectEmployees =  element.all(`by`.cssContainingText('span.ng-scope', 'Employee'))
    SelectEmployee = SelectEmployees.first() 
    SelectEmployee.click() 

    Branch =  element(`by`.cssContainingText('label.data-label', 'Branch'))
    expect(Branch).toBePresentAndDisplayed()


    CallOffReason = element(`by`.cssContainingText('span.menu-reasons-link.ng-binding', 'Call Off'))
    expect(CallOffReason).toBePresentAndDisplayed()
    Li = CallOffReason.element(`by`.xpath('ancestor::li'))
    browser.actions().mouseMove(Li).perform();
    element(`by`.cssContainingText('a.ng-binding', 'Family Emergency')).click();

    expect(Calendar).toBePresentAndDisplayed()
    expect(CancelProcess).toNotHaveClass('disabled')

    DateFirsts = element.all(`by`.cssContainingText('span.ng-binding', dayF))
    DateFirst = DateFirsts.first() 
    DateFirstP = DateFirst.element(`by`.xpath('ancestor::button'))
    DateFirstP.click()


    DateMidles = element.all(`by`.cssContainingText('span.ng-binding', dayM))
    DateMidle = DateMidles.first() 
    DateMidleP = DateMidle.element(`by`.xpath('ancestor::button'))


    DateSeconds = element.all(`by`.cssContainingText('span.ng-binding', dayE))
    DateSecond = DateSeconds.first() 
    DateSecondP = DateSecond.element(`by`.xpath('ancestor::button'))
    DateSecondP.click()

    Outbound.click()

    expect(CancellCall).toBePresentAndDisplayed()
    expect(CancellCall.getText()).toBe('Please confirm that the call has to be canceled')

    ResumeCall.click()
    expect(Calendar).toBePresentAndDisplayed()

    Outbound.click()

    expect(CancellCall).toBePresentAndDisplayed()
    expect(CancellCall.getText()).toBe('Please confirm that the call has to be canceled')

    ConfirmCancelCall.click()
    #expect(Calendar).toBePresentAndDisplayed()

    expect(element(`by`.xpath('//*[text()[contains(.,"Outbound")]]')).isPresent()).toBe(true)



    "Cancel Call from Calendar (with selected date)(Search)"


    Inbound.click()
    expect(element(`by`.xpath('//*[text()[contains(.,"Inbound Call")]]')).isPresent()).toBe(true)

    expect(ColName).toBePresentAndDisplayed()
    expect(ColPhone).toBePresentAndDisplayed()
    expect(ColLocation).toBePresentAndDisplayed()
    expect(ColType).toBePresentAndDisplayed()

    SelectEmployees =  element.all(`by`.cssContainingText('span.ng-scope', 'Employee'))
    SelectEmployee = SelectEmployees.first() 
    SelectEmployee.click() 

    Branch =  element(`by`.cssContainingText('label.data-label', 'Branch'))
    expect(Branch).toBePresentAndDisplayed()


    CallOffReason = element(`by`.cssContainingText('span.menu-reasons-link.ng-binding', 'Call Off'))
    expect(CallOffReason).toBePresentAndDisplayed()
    Li = CallOffReason.element(`by`.xpath('ancestor::li'))
    browser.actions().mouseMove(Li).perform();
    element(`by`.cssContainingText('a.ng-binding', 'Family Emergency')).click();

    expect(Calendar).toBePresentAndDisplayed()
    expect(CancelProcess).toNotHaveClass('disabled')

    DateFirsts = element.all(`by`.cssContainingText('span.ng-binding', dayF))
    DateFirst = DateFirsts.first() 
    DateFirstP = DateFirst.element(`by`.xpath('ancestor::button'))
    DateFirstP.click()


    DateMidles = element.all(`by`.cssContainingText('span.ng-binding', dayM))
    DateMidle = DateMidles.first() 
    DateMidleP = DateMidle.element(`by`.xpath('ancestor::button'))


    DateSeconds = element.all(`by`.cssContainingText('span.ng-binding', dayE))
    DateSecond = DateSeconds.first() 
    DateSecondP = DateSecond.element(`by`.xpath('ancestor::button'))
    DateSecondP.click()

    Search.click()

    expect(CancellCall).toBePresentAndDisplayed()
    expect(CancellCall.getText()).toBe('Please confirm that the call has to be canceled')

    ResumeCall.click()
    expect(Calendar).toBePresentAndDisplayed()

    Search.click()

    expect(CancellCall).toBePresentAndDisplayed()
    expect(CancellCall.getText()).toBe('Please confirm that the call has to be canceled')

    ConfirmCancelCall.click()
    #expect(Calendar).toBePresentAndDisplayed()

    expect(element(`by`.xpath('//*[text()[contains(.,"Search")]]')).isPresent()).toBe(true)



  it "2527", ->
    "Cancel Call from Schedule(without select event)(Inbound)"

    Inbound.click()
    expect(element(`by`.xpath('//*[text()[contains(.,"Inbound Call")]]')).isPresent()).toBe(true)

    expect(ColName).toBePresentAndDisplayed()
    expect(ColPhone).toBePresentAndDisplayed()
    expect(ColLocation).toBePresentAndDisplayed()
    expect(ColType).toBePresentAndDisplayed()

    SelectEmployees =  element.all(`by`.cssContainingText('span.ng-scope', 'Employee'))
    SelectEmployee = SelectEmployees.first() 
    SelectEmployee.click() 

    Branch =  element(`by`.cssContainingText('label.data-label', 'Branch'))
    expect(Branch).toBePresentAndDisplayed()


    CallOffReason = element(`by`.cssContainingText('span.menu-reasons-link.ng-binding', 'Call Off'))
    expect(CallOffReason).toBePresentAndDisplayed()
    Li = CallOffReason.element(`by`.xpath('ancestor::li'))
    browser.actions().mouseMove(Li).perform();
    element(`by`.cssContainingText('a.ng-binding', 'Family Emergency')).click();

    expect(Calendar).toBePresentAndDisplayed()
    expect(CancelProcess).toNotHaveClass('disabled')

    DateFirsts = element.all(`by`.cssContainingText('span.ng-binding', dayF))
    DateFirst = DateFirsts.first() 
    DateFirstP = DateFirst.element(`by`.xpath('ancestor::button'))
    DateFirstP.click()


    DateMidles = element.all(`by`.cssContainingText('span.ng-binding', dayM))
    DateMidle = DateMidles.first() 
    DateMidleP = DateMidle.element(`by`.xpath('ancestor::button'))


    DateSeconds = element.all(`by`.cssContainingText('span.ng-binding', dayE))
    DateSecond = DateSeconds.first() 
    DateSecondP = DateSecond.element(`by`.xpath('ancestor::button'))
    DateSecondP.click()

    Next.click()
    expect(ScName).toBePresentAndDisplayed()

    Inbound.click()

    expect(CancellCall).toBePresentAndDisplayed()
    expect(CancellCall.getText()).toBe('Please confirm that the call has to be canceled')

    ResumeCall.click()
    expect(ScName).toBePresentAndDisplayed()

    Inbound.click()

    expect(CancellCall).toBePresentAndDisplayed()
    expect(CancellCall.getText()).toBe('Please confirm that the call has to be canceled')

    ConfirmCancelCall.click()
    #expect(Calendar).toBePresentAndDisplayed()

    expect(element(`by`.xpath('//*[text()[contains(.,"Inbound Call")]]')).isPresent()).toBe(true)




    "Cancel Call from Schedule(without select event)(Outbound)"


    Inbound.click()
    expect(element(`by`.xpath('//*[text()[contains(.,"Inbound Call")]]')).isPresent()).toBe(true)

    expect(ColName).toBePresentAndDisplayed()
    expect(ColPhone).toBePresentAndDisplayed()
    expect(ColLocation).toBePresentAndDisplayed()
    expect(ColType).toBePresentAndDisplayed()

    SelectEmployees =  element.all(`by`.cssContainingText('span.ng-scope', 'Employee'))
    SelectEmployee = SelectEmployees.first() 
    SelectEmployee.click() 

    Branch =  element(`by`.cssContainingText('label.data-label', 'Branch'))
    expect(Branch).toBePresentAndDisplayed()


    CallOffReason = element(`by`.cssContainingText('span.menu-reasons-link.ng-binding', 'Call Off'))
    expect(CallOffReason).toBePresentAndDisplayed()
    Li = CallOffReason.element(`by`.xpath('ancestor::li'))
    browser.actions().mouseMove(Li).perform();
    element(`by`.cssContainingText('a.ng-binding', 'Family Emergency')).click();

    expect(Calendar).toBePresentAndDisplayed()
    expect(CancelProcess).toNotHaveClass('disabled')

    DateFirsts = element.all(`by`.cssContainingText('span.ng-binding', dayF))
    DateFirst = DateFirsts.first() 
    DateFirstP = DateFirst.element(`by`.xpath('ancestor::button'))
    DateFirstP.click()


    DateMidles = element.all(`by`.cssContainingText('span.ng-binding', dayM))
    DateMidle = DateMidles.first() 
    DateMidleP = DateMidle.element(`by`.xpath('ancestor::button'))


    DateSeconds = element.all(`by`.cssContainingText('span.ng-binding', dayE))
    DateSecond = DateSeconds.first() 
    DateSecondP = DateSecond.element(`by`.xpath('ancestor::button'))
    DateSecondP.click()

    Next.click()
    expect(ScName).toBePresentAndDisplayed()

    Outbound.click()

    expect(CancellCall).toBePresentAndDisplayed()
    expect(CancellCall.getText()).toBe('Please confirm that the call has to be canceled')

    ResumeCall.click()
    expect(ScName).toBePresentAndDisplayed()

    Outbound.click()

    expect(CancellCall).toBePresentAndDisplayed()
    expect(CancellCall.getText()).toBe('Please confirm that the call has to be canceled')

    ConfirmCancelCall.click()
    #expect(Calendar).toBePresentAndDisplayed()

    expect(element(`by`.xpath('//*[text()[contains(.,"Outbound")]]')).isPresent()).toBe(true)



    "Cancel Call from Schedule(without select event)(Search)"


    Inbound.click()
    expect(element(`by`.xpath('//*[text()[contains(.,"Inbound Call")]]')).isPresent()).toBe(true)

    expect(ColName).toBePresentAndDisplayed()
    expect(ColPhone).toBePresentAndDisplayed()
    expect(ColLocation).toBePresentAndDisplayed()
    expect(ColType).toBePresentAndDisplayed()

    SelectEmployees =  element.all(`by`.cssContainingText('span.ng-scope', 'Employee'))
    SelectEmployee = SelectEmployees.first() 
    SelectEmployee.click() 

    Branch =  element(`by`.cssContainingText('label.data-label', 'Branch'))
    expect(Branch).toBePresentAndDisplayed()


    CallOffReason = element(`by`.cssContainingText('span.menu-reasons-link.ng-binding', 'Call Off'))
    expect(CallOffReason).toBePresentAndDisplayed()
    Li = CallOffReason.element(`by`.xpath('ancestor::li'))
    browser.actions().mouseMove(Li).perform();
    element(`by`.cssContainingText('a.ng-binding', 'Family Emergency')).click();

    expect(Calendar).toBePresentAndDisplayed()
    expect(CancelProcess).toNotHaveClass('disabled')

    DateFirsts = element.all(`by`.cssContainingText('span.ng-binding', dayF))
    DateFirst = DateFirsts.first() 
    DateFirstP = DateFirst.element(`by`.xpath('ancestor::button'))
    DateFirstP.click()


    DateMidles = element.all(`by`.cssContainingText('span.ng-binding', dayM))
    DateMidle = DateMidles.first() 
    DateMidleP = DateMidle.element(`by`.xpath('ancestor::button'))


    DateSeconds = element.all(`by`.cssContainingText('span.ng-binding', dayE))
    DateSecond = DateSeconds.first() 
    DateSecondP = DateSecond.element(`by`.xpath('ancestor::button'))
    DateSecondP.click()

    Next.click()
    expect(ScName).toBePresentAndDisplayed()

    Search.click()

    expect(CancellCall).toBePresentAndDisplayed()
    expect(CancellCall.getText()).toBe('Please confirm that the call has to be canceled')

    ResumeCall.click()
    expect(ScName).toBePresentAndDisplayed()

    Search.click()

    expect(CancellCall).toBePresentAndDisplayed()
    expect(CancellCall.getText()).toBe('Please confirm that the call has to be canceled')

    ConfirmCancelCall.click()
    #expect(Calendar).toBePresentAndDisplayed()

    expect(element(`by`.xpath('//*[text()[contains(.,"Search")]]')).isPresent()).toBe(true)


  it "2529", ->
    "Cancel Call from Schedule(with select event)(Inbound)"

    Inbound.click()
    expect(element(`by`.xpath('//*[text()[contains(.,"Inbound Call")]]')).isPresent()).toBe(true)

    expect(ColName).toBePresentAndDisplayed()
    expect(ColPhone).toBePresentAndDisplayed()
    expect(ColLocation).toBePresentAndDisplayed()
    expect(ColType).toBePresentAndDisplayed()

    SelectEmployees =  element.all(`by`.cssContainingText('span.ng-scope', 'Employee'))
    SelectEmployee = SelectEmployees.first() 
    SelectEmployee.click() 

    Branch =  element(`by`.cssContainingText('label.data-label', 'Branch'))
    expect(Branch).toBePresentAndDisplayed()


    CallOffReason = element(`by`.cssContainingText('span.menu-reasons-link.ng-binding', 'Call Off'))
    expect(CallOffReason).toBePresentAndDisplayed()
    Li = CallOffReason.element(`by`.xpath('ancestor::li'))
    browser.actions().mouseMove(Li).perform();
    element(`by`.cssContainingText('a.ng-binding', 'Family Emergency')).click();

    expect(Calendar).toBePresentAndDisplayed()
    expect(CancelProcess).toNotHaveClass('disabled')

    DateFirsts = element.all(`by`.cssContainingText('span.ng-binding', dayF))
    DateFirst = DateFirsts.first() 
    DateFirstP = DateFirst.element(`by`.xpath('ancestor::button'))
    DateFirstP.click()


    DateMidles = element.all(`by`.cssContainingText('span.ng-binding', dayM))
    DateMidle = DateMidles.first() 
    DateMidleP = DateMidle.element(`by`.xpath('ancestor::button'))


    DateSeconds = element.all(`by`.cssContainingText('span.ng-binding', dayE))
    DateSecond = DateSeconds.first() 
    DateSecondP = DateSecond.element(`by`.xpath('ancestor::button'))
    DateSecondP.click()

    Next.click()
    expect(ScName).toBePresentAndDisplayed()

    expect(CheckVisit.getAttribute('checked')).toBe(null)
    CheckVisit.click()
    expect(CheckVisit.getAttribute('checked')).toBe('true')

    Inbound.click()

    expect(CancellCall).toBePresentAndDisplayed()
    expect(CancellCall.getText()).toBe('Please confirm that the call has to be canceled')

    ResumeCall.click()
    expect(CheckVisit.getAttribute('checked')).toBe('true')

    Inbound.click()

    expect(CancellCall).toBePresentAndDisplayed()
    expect(CancellCall.getText()).toBe('Please confirm that the call has to be canceled')

    ConfirmCancelCall.click()
    #expect(Calendar).toBePresentAndDisplayed()

    expect(element(`by`.xpath('//*[text()[contains(.,"Inbound Call")]]')).isPresent()).toBe(true)




    "Cancel Call from Schedule(with select event)(Outbound)"


    Inbound.click()
    expect(element(`by`.xpath('//*[text()[contains(.,"Inbound Call")]]')).isPresent()).toBe(true)

    expect(ColName).toBePresentAndDisplayed()
    expect(ColPhone).toBePresentAndDisplayed()
    expect(ColLocation).toBePresentAndDisplayed()
    expect(ColType).toBePresentAndDisplayed()

    SelectEmployees =  element.all(`by`.cssContainingText('span.ng-scope', 'Employee'))
    SelectEmployee = SelectEmployees.first() 
    SelectEmployee.click() 

    Branch =  element(`by`.cssContainingText('label.data-label', 'Branch'))
    expect(Branch).toBePresentAndDisplayed()


    CallOffReason = element(`by`.cssContainingText('span.menu-reasons-link.ng-binding', 'Call Off'))
    expect(CallOffReason).toBePresentAndDisplayed()
    Li = CallOffReason.element(`by`.xpath('ancestor::li'))
    browser.actions().mouseMove(Li).perform();
    element(`by`.cssContainingText('a.ng-binding', 'Family Emergency')).click();

    expect(Calendar).toBePresentAndDisplayed()
    expect(CancelProcess).toNotHaveClass('disabled')

    DateFirsts = element.all(`by`.cssContainingText('span.ng-binding', dayF))
    DateFirst = DateFirsts.first() 
    DateFirstP = DateFirst.element(`by`.xpath('ancestor::button'))
    DateFirstP.click()


    DateMidles = element.all(`by`.cssContainingText('span.ng-binding', dayM))
    DateMidle = DateMidles.first() 
    DateMidleP = DateMidle.element(`by`.xpath('ancestor::button'))


    DateSeconds = element.all(`by`.cssContainingText('span.ng-binding', dayE))
    DateSecond = DateSeconds.first() 
    DateSecondP = DateSecond.element(`by`.xpath('ancestor::button'))
    DateSecondP.click()

    Next.click()
    expect(ScName).toBePresentAndDisplayed()

    expect(CheckVisit.getAttribute('checked')).toBe(null)
    CheckVisit.click()
    expect(CheckVisit.getAttribute('checked')).toBe('true')

    Outbound.click()

    expect(CancellCall).toBePresentAndDisplayed()
    expect(CancellCall.getText()).toBe('Please confirm that the call has to be canceled')

    ResumeCall.click()
    expect(CheckVisit.getAttribute('checked')).toBe('true')

    Outbound.click()

    expect(CancellCall).toBePresentAndDisplayed()
    expect(CancellCall.getText()).toBe('Please confirm that the call has to be canceled')

    ConfirmCancelCall.click()
    #expect(Calendar).toBePresentAndDisplayed()

    expect(element(`by`.xpath('//*[text()[contains(.,"Outbound")]]')).isPresent()).toBe(true)



    "Cancel Call from Schedule(with select event)(Search)"


    Inbound.click()
    expect(element(`by`.xpath('//*[text()[contains(.,"Inbound Call")]]')).isPresent()).toBe(true)

    expect(ColName).toBePresentAndDisplayed()
    expect(ColPhone).toBePresentAndDisplayed()
    expect(ColLocation).toBePresentAndDisplayed()
    expect(ColType).toBePresentAndDisplayed()

    SelectEmployees =  element.all(`by`.cssContainingText('span.ng-scope', 'Employee'))
    SelectEmployee = SelectEmployees.first() 
    SelectEmployee.click() 

    Branch =  element(`by`.cssContainingText('label.data-label', 'Branch'))
    expect(Branch).toBePresentAndDisplayed()


    CallOffReason = element(`by`.cssContainingText('span.menu-reasons-link.ng-binding', 'Call Off'))
    expect(CallOffReason).toBePresentAndDisplayed()
    Li = CallOffReason.element(`by`.xpath('ancestor::li'))
    browser.actions().mouseMove(Li).perform();
    element(`by`.cssContainingText('a.ng-binding', 'Family Emergency')).click();

    expect(Calendar).toBePresentAndDisplayed()
    expect(CancelProcess).toNotHaveClass('disabled')

    DateFirsts = element.all(`by`.cssContainingText('span.ng-binding', dayF))
    DateFirst = DateFirsts.first() 
    DateFirstP = DateFirst.element(`by`.xpath('ancestor::button'))
    DateFirstP.click()


    DateMidles = element.all(`by`.cssContainingText('span.ng-binding', dayM))
    DateMidle = DateMidles.first() 
    DateMidleP = DateMidle.element(`by`.xpath('ancestor::button'))


    DateSeconds = element.all(`by`.cssContainingText('span.ng-binding', dayE))
    DateSecond = DateSeconds.first() 
    DateSecondP = DateSecond.element(`by`.xpath('ancestor::button'))
    DateSecondP.click()

    Next.click()
    expect(ScName).toBePresentAndDisplayed()

    expect(CheckVisit.getAttribute('checked')).toBe(null)
    CheckVisit.click()
    expect(CheckVisit.getAttribute('checked')).toBe('true')

    Search.click()

    expect(CancellCall).toBePresentAndDisplayed()
    expect(CancellCall.getText()).toBe('Please confirm that the call has to be canceled')

    ResumeCall.click()
    expect(CheckVisit.getAttribute('checked')).toBe('true')

    Search.click()

    expect(CancellCall).toBePresentAndDisplayed()
    expect(CancellCall.getText()).toBe('Please confirm that the call has to be canceled')

    ConfirmCancelCall.click()
    #expect(Calendar).toBePresentAndDisplayed()

    expect(element(`by`.xpath('//*[text()[contains(.,"Search")]]')).isPresent()).toBe(true)



  it "2531", ->
    "Cancel Call from Completed(without note)(Inbound)"

    Inbound.click()
    expect(element(`by`.xpath('//*[text()[contains(.,"Inbound Call")]]')).isPresent()).toBe(true)

    expect(ColName).toBePresentAndDisplayed()
    expect(ColPhone).toBePresentAndDisplayed()
    expect(ColLocation).toBePresentAndDisplayed()
    expect(ColType).toBePresentAndDisplayed()

    SelectEmployees =  element.all(`by`.cssContainingText('span.ng-scope', 'Employee'))
    SelectEmployee = SelectEmployees.first() 
    SelectEmployee.click() 

    Branch =  element(`by`.cssContainingText('label.data-label', 'Branch'))
    expect(Branch).toBePresentAndDisplayed()


    CallOffReason = element(`by`.cssContainingText('span.menu-reasons-link.ng-binding', 'Call Off'))
    expect(CallOffReason).toBePresentAndDisplayed()
    Li = CallOffReason.element(`by`.xpath('ancestor::li'))
    browser.actions().mouseMove(Li).perform();
    element(`by`.cssContainingText('a.ng-binding', 'Family Emergency')).click();

    expect(Calendar).toBePresentAndDisplayed()
    expect(CancelProcess).toNotHaveClass('disabled')

    DateFirsts = element.all(`by`.cssContainingText('span.ng-binding', dayF))
    DateFirst = DateFirsts.first() 
    DateFirstP = DateFirst.element(`by`.xpath('ancestor::button'))
    DateFirstP.click()


    DateMidles = element.all(`by`.cssContainingText('span.ng-binding', dayM))
    DateMidle = DateMidles.first() 
    DateMidleP = DateMidle.element(`by`.xpath('ancestor::button'))


    DateSeconds = element.all(`by`.cssContainingText('span.ng-binding', dayE))
    DateSecond = DateSeconds.first() 
    DateSecondP = DateSecond.element(`by`.xpath('ancestor::button'))
    DateSecondP.click()

    Next.click()
    expect(ScName).toBePresentAndDisplayed()

    expect(CheckVisit.getAttribute('checked')).toBe(null)
    CheckVisit.click()
    expect(CheckVisit.getAttribute('checked')).toBe('true')

    Next.click()
    expect(NoteForProcess).toBePresentAndDisplayed() 

    Inbound.click()

    expect(CancellCall).toBePresentAndDisplayed()
    expect(CancellCall.getText()).toBe('Please confirm that the call has to be canceled')

    ResumeCall.click()
    expect(NoteForProcess).toBePresentAndDisplayed() 

    Inbound.click()

    expect(CancellCall).toBePresentAndDisplayed()
    expect(CancellCall.getText()).toBe('Please confirm that the call has to be canceled')

    ConfirmCancelCall.click()
    #expect(Calendar).toBePresentAndDisplayed()

    expect(element(`by`.xpath('//*[text()[contains(.,"Inbound Call")]]')).isPresent()).toBe(true)




    "Cancel Call from Completed(without note)(Outbound)"


    Inbound.click()
    expect(element(`by`.xpath('//*[text()[contains(.,"Inbound Call")]]')).isPresent()).toBe(true)

    expect(ColName).toBePresentAndDisplayed()
    expect(ColPhone).toBePresentAndDisplayed()
    expect(ColLocation).toBePresentAndDisplayed()
    expect(ColType).toBePresentAndDisplayed()

    SelectEmployees =  element.all(`by`.cssContainingText('span.ng-scope', 'Employee'))
    SelectEmployee = SelectEmployees.first() 
    SelectEmployee.click() 

    Branch =  element(`by`.cssContainingText('label.data-label', 'Branch'))
    expect(Branch).toBePresentAndDisplayed()


    CallOffReason = element(`by`.cssContainingText('span.menu-reasons-link.ng-binding', 'Call Off'))
    expect(CallOffReason).toBePresentAndDisplayed()
    Li = CallOffReason.element(`by`.xpath('ancestor::li'))
    browser.actions().mouseMove(Li).perform();
    element(`by`.cssContainingText('a.ng-binding', 'Family Emergency')).click();

    expect(Calendar).toBePresentAndDisplayed()
    expect(CancelProcess).toNotHaveClass('disabled')

    DateFirsts = element.all(`by`.cssContainingText('span.ng-binding', dayF))
    DateFirst = DateFirsts.first() 
    DateFirstP = DateFirst.element(`by`.xpath('ancestor::button'))
    DateFirstP.click()


    DateMidles = element.all(`by`.cssContainingText('span.ng-binding', dayM))
    DateMidle = DateMidles.first() 
    DateMidleP = DateMidle.element(`by`.xpath('ancestor::button'))


    DateSeconds = element.all(`by`.cssContainingText('span.ng-binding', dayE))
    DateSecond = DateSeconds.first() 
    DateSecondP = DateSecond.element(`by`.xpath('ancestor::button'))
    DateSecondP.click()

    Next.click()
    expect(ScName).toBePresentAndDisplayed()

    expect(CheckVisit.getAttribute('checked')).toBe(null)
    CheckVisit.click()
    expect(CheckVisit.getAttribute('checked')).toBe('true')

    Next.click()
    expect(NoteForProcess).toBePresentAndDisplayed() 

    Outbound.click()

    expect(CancellCall).toBePresentAndDisplayed()
    expect(CancellCall.getText()).toBe('Please confirm that the call has to be canceled')

    ResumeCall.click()
    expect(NoteForProcess).toBePresentAndDisplayed() 

    Outbound.click()

    expect(CancellCall).toBePresentAndDisplayed()
    expect(CancellCall.getText()).toBe('Please confirm that the call has to be canceled')

    ConfirmCancelCall.click()
    #expect(Calendar).toBePresentAndDisplayed()

    expect(element(`by`.xpath('//*[text()[contains(.,"Outbound")]]')).isPresent()).toBe(true)



    "Cancel Call from Completed(without note)(Search)"


    Inbound.click()
    expect(element(`by`.xpath('//*[text()[contains(.,"Inbound Call")]]')).isPresent()).toBe(true)

    expect(ColName).toBePresentAndDisplayed()
    expect(ColPhone).toBePresentAndDisplayed()
    expect(ColLocation).toBePresentAndDisplayed()
    expect(ColType).toBePresentAndDisplayed()

    SelectEmployees =  element.all(`by`.cssContainingText('span.ng-scope', 'Employee'))
    SelectEmployee = SelectEmployees.first() 
    SelectEmployee.click() 

    Branch =  element(`by`.cssContainingText('label.data-label', 'Branch'))
    expect(Branch).toBePresentAndDisplayed()


    CallOffReason = element(`by`.cssContainingText('span.menu-reasons-link.ng-binding', 'Call Off'))
    expect(CallOffReason).toBePresentAndDisplayed()
    Li = CallOffReason.element(`by`.xpath('ancestor::li'))
    browser.actions().mouseMove(Li).perform();
    element(`by`.cssContainingText('a.ng-binding', 'Family Emergency')).click();

    expect(Calendar).toBePresentAndDisplayed()
    expect(CancelProcess).toNotHaveClass('disabled')

    DateFirsts = element.all(`by`.cssContainingText('span.ng-binding', dayF))
    DateFirst = DateFirsts.first() 
    DateFirstP = DateFirst.element(`by`.xpath('ancestor::button'))
    DateFirstP.click()


    DateMidles = element.all(`by`.cssContainingText('span.ng-binding', dayM))
    DateMidle = DateMidles.first() 
    DateMidleP = DateMidle.element(`by`.xpath('ancestor::button'))


    DateSeconds = element.all(`by`.cssContainingText('span.ng-binding', dayE))
    DateSecond = DateSeconds.first() 
    DateSecondP = DateSecond.element(`by`.xpath('ancestor::button'))
    DateSecondP.click()

    Next.click()
    expect(ScName).toBePresentAndDisplayed()

    expect(CheckVisit.getAttribute('checked')).toBe(null)
    CheckVisit.click()
    expect(CheckVisit.getAttribute('checked')).toBe('true')

    Next.click()
    expect(NoteForProcess).toBePresentAndDisplayed() 

    Search.click()

    expect(CancellCall).toBePresentAndDisplayed()
    expect(CancellCall.getText()).toBe('Please confirm that the call has to be canceled')

    ResumeCall.click()
    expect(NoteForProcess).toBePresentAndDisplayed() 

    Search.click()

    expect(CancellCall).toBePresentAndDisplayed()
    expect(CancellCall.getText()).toBe('Please confirm that the call has to be canceled')

    ConfirmCancelCall.click()
    #expect(Calendar).toBePresentAndDisplayed()

    expect(element(`by`.xpath('//*[text()[contains(.,"Search")]]')).isPresent()).toBe(true)




  it "2533", ->
    "Cancel Call from Completed(with note)(Inbound)"

    Inbound.click()
    expect(element(`by`.xpath('//*[text()[contains(.,"Inbound Call")]]')).isPresent()).toBe(true)

    expect(ColName).toBePresentAndDisplayed()
    expect(ColPhone).toBePresentAndDisplayed()
    expect(ColLocation).toBePresentAndDisplayed()
    expect(ColType).toBePresentAndDisplayed()

    SelectEmployees =  element.all(`by`.cssContainingText('span.ng-scope', 'Employee'))
    SelectEmployee = SelectEmployees.first() 
    SelectEmployee.click() 

    Branch =  element(`by`.cssContainingText('label.data-label', 'Branch'))
    expect(Branch).toBePresentAndDisplayed()


    CallOffReason = element(`by`.cssContainingText('span.menu-reasons-link.ng-binding', 'Call Off'))
    expect(CallOffReason).toBePresentAndDisplayed()
    Li = CallOffReason.element(`by`.xpath('ancestor::li'))
    browser.actions().mouseMove(Li).perform();
    element(`by`.cssContainingText('a.ng-binding', 'Family Emergency')).click();

    expect(Calendar).toBePresentAndDisplayed()
    expect(CancelProcess).toNotHaveClass('disabled')

    DateFirsts = element.all(`by`.cssContainingText('span.ng-binding', dayF))
    DateFirst = DateFirsts.first() 
    DateFirstP = DateFirst.element(`by`.xpath('ancestor::button'))
    DateFirstP.click()


    DateMidles = element.all(`by`.cssContainingText('span.ng-binding', dayM))
    DateMidle = DateMidles.first() 
    DateMidleP = DateMidle.element(`by`.xpath('ancestor::button'))


    DateSeconds = element.all(`by`.cssContainingText('span.ng-binding', dayE))
    DateSecond = DateSeconds.first() 
    DateSecondP = DateSecond.element(`by`.xpath('ancestor::button'))
    DateSecondP.click()

    Next.click()
    expect(ScName).toBePresentAndDisplayed()

    expect(CheckVisit.getAttribute('checked')).toBe(null)
    CheckVisit.click()
    expect(CheckVisit.getAttribute('checked')).toBe('true')

    Next.click()
    expect(NoteForProcess).toBePresentAndDisplayed() 
    NoteForProcess.click()
    NoteForProcess.sendKeys('Note is added!')
    expect(NoteForProcess.getAttribute('value')).toBe('Note is added!')

    Inbound.click()

    expect(CancellCall).toBePresentAndDisplayed()
    expect(CancellCall.getText()).toBe('Please confirm that the call has to be canceled')

    ResumeCall.click()
    expect(NoteForProcess.getAttribute('value')).toBe('Note is added!') 

    Inbound.click()

    expect(CancellCall).toBePresentAndDisplayed()
    expect(CancellCall.getText()).toBe('Please confirm that the call has to be canceled')

    ConfirmCancelCall.click()
    #expect(Calendar).toBePresentAndDisplayed()

    expect(element(`by`.xpath('//*[text()[contains(.,"Inbound Call")]]')).isPresent()).toBe(true)




    "Cancel Call from Completed(with note)(Outbound)"


    Inbound.click()
    expect(element(`by`.xpath('//*[text()[contains(.,"Inbound Call")]]')).isPresent()).toBe(true)

    expect(ColName).toBePresentAndDisplayed()
    expect(ColPhone).toBePresentAndDisplayed()
    expect(ColLocation).toBePresentAndDisplayed()
    expect(ColType).toBePresentAndDisplayed()

    SelectEmployees =  element.all(`by`.cssContainingText('span.ng-scope', 'Employee'))
    SelectEmployee = SelectEmployees.first() 
    SelectEmployee.click() 

    Branch =  element(`by`.cssContainingText('label.data-label', 'Branch'))
    expect(Branch).toBePresentAndDisplayed()


    CallOffReason = element(`by`.cssContainingText('span.menu-reasons-link.ng-binding', 'Call Off'))
    expect(CallOffReason).toBePresentAndDisplayed()
    Li = CallOffReason.element(`by`.xpath('ancestor::li'))
    browser.actions().mouseMove(Li).perform();
    element(`by`.cssContainingText('a.ng-binding', 'Family Emergency')).click();

    expect(Calendar).toBePresentAndDisplayed()
    expect(CancelProcess).toNotHaveClass('disabled')

    DateFirsts = element.all(`by`.cssContainingText('span.ng-binding', dayF))
    DateFirst = DateFirsts.first() 
    DateFirstP = DateFirst.element(`by`.xpath('ancestor::button'))
    DateFirstP.click()


    DateMidles = element.all(`by`.cssContainingText('span.ng-binding', dayM))
    DateMidle = DateMidles.first() 
    DateMidleP = DateMidle.element(`by`.xpath('ancestor::button'))


    DateSeconds = element.all(`by`.cssContainingText('span.ng-binding', dayE))
    DateSecond = DateSeconds.first() 
    DateSecondP = DateSecond.element(`by`.xpath('ancestor::button'))
    DateSecondP.click()

    Next.click()
    expect(ScName).toBePresentAndDisplayed()

    expect(CheckVisit.getAttribute('checked')).toBe(null)
    CheckVisit.click()
    expect(CheckVisit.getAttribute('checked')).toBe('true')

    Next.click()
    expect(NoteForProcess).toBePresentAndDisplayed() 
    NoteForProcess.click()
    NoteForProcess.sendKeys('Note is added!')
    expect(NoteForProcess.getAttribute('value')).toBe('Note is added!')

    Outbound.click()

    expect(CancellCall).toBePresentAndDisplayed()
    expect(CancellCall.getText()).toBe('Please confirm that the call has to be canceled')

    ResumeCall.click()
    expect(NoteForProcess.getAttribute('value')).toBe('Note is added!')

    Outbound.click()

    expect(CancellCall).toBePresentAndDisplayed()
    expect(CancellCall.getText()).toBe('Please confirm that the call has to be canceled')

    ConfirmCancelCall.click()
    #expect(Calendar).toBePresentAndDisplayed()

    expect(element(`by`.xpath('//*[text()[contains(.,"Outbound")]]')).isPresent()).toBe(true)



    "Cancel Call from Completed(with note)(Search)"


    Inbound.click()
    expect(element(`by`.xpath('//*[text()[contains(.,"Inbound Call")]]')).isPresent()).toBe(true)

    expect(ColName).toBePresentAndDisplayed()
    expect(ColPhone).toBePresentAndDisplayed()
    expect(ColLocation).toBePresentAndDisplayed()
    expect(ColType).toBePresentAndDisplayed()

    SelectEmployees =  element.all(`by`.cssContainingText('span.ng-scope', 'Employee'))
    SelectEmployee = SelectEmployees.first() 
    SelectEmployee.click() 

    Branch =  element(`by`.cssContainingText('label.data-label', 'Branch'))
    expect(Branch).toBePresentAndDisplayed()


    CallOffReason = element(`by`.cssContainingText('span.menu-reasons-link.ng-binding', 'Call Off'))
    expect(CallOffReason).toBePresentAndDisplayed()
    Li = CallOffReason.element(`by`.xpath('ancestor::li'))
    browser.actions().mouseMove(Li).perform();
    element(`by`.cssContainingText('a.ng-binding', 'Family Emergency')).click();

    expect(Calendar).toBePresentAndDisplayed()
    expect(CancelProcess).toNotHaveClass('disabled')

    DateFirsts = element.all(`by`.cssContainingText('span.ng-binding', dayF))
    DateFirst = DateFirsts.first() 
    DateFirstP = DateFirst.element(`by`.xpath('ancestor::button'))
    DateFirstP.click()


    DateMidles = element.all(`by`.cssContainingText('span.ng-binding', dayM))
    DateMidle = DateMidles.first() 
    DateMidleP = DateMidle.element(`by`.xpath('ancestor::button'))


    DateSeconds = element.all(`by`.cssContainingText('span.ng-binding', dayE))
    DateSecond = DateSeconds.first() 
    DateSecondP = DateSecond.element(`by`.xpath('ancestor::button'))
    DateSecondP.click()

    Next.click()
    expect(ScName).toBePresentAndDisplayed()

    expect(CheckVisit.getAttribute('checked')).toBe(null)
    CheckVisit.click()
    expect(CheckVisit.getAttribute('checked')).toBe('true')

    Next.click()
    expect(NoteForProcess).toBePresentAndDisplayed()
    NoteForProcess.click()
    NoteForProcess.sendKeys('Note is added!')
    expect(NoteForProcess.getAttribute('value')).toBe('Note is added!') 

    Search.click()

    expect(CancellCall).toBePresentAndDisplayed()
    expect(CancellCall.getText()).toBe('Please confirm that the call has to be canceled')

    ResumeCall.click()
    expect(NoteForProcess.getAttribute('value')).toBe('Note is added!') 

    Search.click()

    expect(CancellCall).toBePresentAndDisplayed()
    expect(CancellCall.getText()).toBe('Please confirm that the call has to be canceled')

    ConfirmCancelCall.click()
    #expect(Calendar).toBePresentAndDisplayed()

    expect(element(`by`.xpath('//*[text()[contains(.,"Search")]]')).isPresent()).toBe(true)


###


    #browser.actions().mouseMove(Li).perform();
    #element(`by`.cssContainingText('a.ng-binding', 'Family Emergency')).click();


  it "2500", ->
    "Cancel Process from Calendar"


  it "2506", ->
    "Cancel Process from Schedule"

    Inbound.click()
    expect(element(`by`.xpath('//*[text()[contains(.,"Inbound Call")]]')).isPresent()).toBe(true)

    expect(ColName).toBePresentAndDisplayed()
    expect(ColPhone).toBePresentAndDisplayed()
    expect(ColLocation).toBePresentAndDisplayed()
    expect(ColType).toBePresentAndDisplayed()

    SelectEmployees =  element.all(`by`.cssContainingText('span.ng-scope', 'Employee'))
    SelectEmployee = SelectEmployees.first() 
    SelectEmployee.click() 

    Branch =  element(`by`.cssContainingText('label.data-label', 'Branch'))
    expect(Branch).toBePresentAndDisplayed()


    CallOffReason = element(`by`.cssContainingText('span.menu-reasons-link.ng-binding', 'Call Off'))
    expect(CallOffReason).toBePresentAndDisplayed()
    Li = CallOffReason.element(`by`.xpath('ancestor::li'))
    browser.actions().mouseMove(Li).perform();
    element(`by`.cssContainingText('a.ng-binding', 'Family Emergency')).click();


    expect(CancelProcess).toHaveClass('disabled')

 
    DateFirsts = element.all(`by`.cssContainingText('span.ng-binding', dayF))
    DateFirst = DateFirsts.first() 
    DateFirstP = DateFirst.element(`by`.xpath('ancestor::button'))
    DateFirstP.click()


    DateMidles = element.all(`by`.cssContainingText('span.ng-binding', dayM))
    DateMidle = DateMidles.first() 
    DateMidleP = DateMidle.element(`by`.xpath('ancestor::button'))


    DateSeconds = element.all(`by`.cssContainingText('span.ng-binding', dayE))
    DateSecond = DateSeconds.first() 
    DateSecondP = DateSecond.element(`by`.xpath('ancestor::button'))
    DateSecondP.click()

    Next.click()

    ScNotes = element.all(`by`.css('div.grid-col-note'))
    ScNote = ScNotes.last()
    expect(ScNote).toBePresentAndDisplayed() 

    CheckVisit.click()


    CancelProcess.click()
    expect(HomeController).toBePresentAndDisplayed() 
    Popup = element(`by`.xpath('//div[@id="webApiComponents.services.popup"]'))
    PopupText = Popup.element(`by`.xpath('//span[@class="ng-scope ng-binding"]'))

    expect(PopupText.getText()).toBe('Call Off has been canceled.')
    expect(Popup).toBePresentAndDisplayed() 



  it "2506", ->
    "Cancel Process from Schedule"

    Inbound.click()
    expect(element(`by`.xpath('//*[text()[contains(.,"Inbound Call")]]')).isPresent()).toBe(true)

    expect(ColName).toBePresentAndDisplayed()
    expect(ColPhone).toBePresentAndDisplayed()
    expect(ColLocation).toBePresentAndDisplayed()
    expect(ColType).toBePresentAndDisplayed()

    SelectEmployees =  element.all(`by`.cssContainingText('span.ng-scope', 'Employee'))
    SelectEmployee = SelectEmployees.first() 
    SelectEmployee.click() 

    Branch =  element(`by`.cssContainingText('label.data-label', 'Branch'))
    expect(Branch).toBePresentAndDisplayed()


    CallOffReason = element(`by`.cssContainingText('span.menu-reasons-link.ng-binding', 'Call Off'))
    expect(CallOffReason).toBePresentAndDisplayed()
    Li = CallOffReason.element(`by`.xpath('ancestor::li'))
    browser.actions().mouseMove(Li).perform();
    element(`by`.cssContainingText('a.ng-binding', 'Family Emergency')).click();

 
    DateFirsts = element.all(`by`.cssContainingText('span.ng-binding', dayF))
    DateFirst = DateFirsts.first() 
    DateFirstP = DateFirst.element(`by`.xpath('ancestor::button'))
    DateFirstP.click()


    DateMidles = element.all(`by`.cssContainingText('span.ng-binding', dayM))
    DateMidle = DateMidles.first() 
    DateMidleP = DateMidle.element(`by`.xpath('ancestor::button'))


    DateSeconds = element.all(`by`.cssContainingText('span.ng-binding', dayE))
    DateSecond = DateSeconds.first() 
    DateSecondP = DateSecond.element(`by`.xpath('ancestor::button'))
    DateSecondP.click()

    Next.click()

    ScNotes = element.all(`by`.css('div.grid-col-note'))
    ScNote = ScNotes.last()
    expect(ScNote).toBePresentAndDisplayed() 

    CheckVisit.click()

    Next.click()


    CancelProcess.click()
    expect(HomeController).toBePresentAndDisplayed() 
    Popup = element(`by`.xpath('//div[@id="webApiComponents.services.popup"]'))
    PopupText = Popup.element(`by`.xpath('//span[@class="ng-scope ng-binding"]'))

    expect(PopupText.getText()).toBe('Call Off has been canceled.')
    expect(Popup).toBePresentAndDisplayed() 


    


    #ptor.sleep 5000   


    ###
