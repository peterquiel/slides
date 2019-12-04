Feature: The yellow belt gives hope to a learner that he is actually learning and practicing at his best.

  Scenario: Printing and simple karate expressions
    Given def color = 'red '
    And def num = 5
    * print 'Num is ', num, '\n'
    * print 'Print takes js expressions as well: ', color + num
    * print 'Addition', num + 5
    * print 'Rubbish in expression leads to empty string:', doesNoExists + 10
    * print 'Default value from karate-config.js: ', someDefaultConfig
    * text multiLine =
    """
        this is a 
        multi line text
    """
    * print multiLine

    # Assert evaluates expressions..
    Then assert color + num == 'red 5'






  Scenario: Given, When, Then And But is optional
    * print 'The given, when, then blocks are ignored in the end'
    * print 'You can leave them out'





  Scenario: Basic expressions
    * def one = 1
    * def two = 2
    * def three = one + two
    * assert 4 > three








  Scenario: Native JSON support 
   * def json = { full: "json", is:"supported", as: ["you", "can", "see"]}
   * match json.is == "supported"








  Scenario: Embbed expressions in json
   * def anArray = ["you", "can", "see"]
   * def json = { full: "json", is:#( "support" + 3 + "d"), as: #(anArray)}
   * match json.as == anArray
   * match json.is == "support3d"








  Scenario: Tables offer an elegant way to create json arrays
    Given table bikes
      | placement | name                          |
      | 1         | "Big Trouble in Little China" |
      | 2         | "The Karate Kid"              |
      | 3         | "Police Story"                |

    Then match bikes ==
    """
    [
      {placement: 1, name: "Big Trouble in Little China" }
      {placement: 2, name: "The Karate Kid"              }
      {placement: 3, name: "Police Story"                }
    ]
    """










  Scenario Outline: Feeding a scenario by a table with values <placement>: <name>
    * print __row 
    * print "current movie:", name
    * assert 0 < placement && placement < 4

    Examples: Every Outline needs an example table
      | placement | name                          |
      | 1         | "Big Trouble in Little China" |
      | 2         | "The Karate Kid"              |
      | 3         | "Police Story"                |