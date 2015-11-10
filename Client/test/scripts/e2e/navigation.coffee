describe "E2E", ->
  beforeEach ->
    browser().navigateTo "/"

  it "should navigate to / when page is accessed", ->
    expect(browser().window().path()).toBe("/");

  it "should have sign-out button", ->
    expect(element('div.user a.btn').text()).toEqual('Sign out ')

  it "should have John Smith username", ->
    expect(element('span.user-name').text()).toEqual('tadams')

  it "should have dropdown with Applications", ->
    element('a.dropdown-toggle').click();
    expect(repeater('ul li').count()).toEqual(2);
