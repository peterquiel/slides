Feature: Student who gets awarded with red belt is considered to be more dangerous in his/her skills and knowledge.


  Background:
    * configure driver = { type: 'chrome' }

  Scenario: do a google search and goto 
    Given driver 'https://google.com'
    And   input("input[name=q]", 'karate dsl')
    And   screenshot()
    And   submit().click("//input[@name='btnI']")
    Then  match driver.url == "https://github.com/intuit/karate"
    And   screenshot()
    
  Scenario: Same search but different
    Given driver 'https://google.com'
    And   input('input[name=q]', 'karate dsl')
    And   screenshot()
    When  click('input[name=btnI]')
    # waits and makes an assertion
    And   waitForUrl('https://github.com/intuit/karate')
    And   screenshot()
