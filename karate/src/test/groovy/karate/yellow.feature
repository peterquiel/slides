Feature: The yellow belt gives hope to a learner that he is actually learning and practicing at his best.

  Scenario: Printing and simple karate expressions
    Given def color = 'red '
    And def num = 5
    * print 'Num is ', num, '\n'
    * print 'Print takes js expressions as well: ', color + num
    * print 'Error logging could be improved; rubbish in expression leads to empty string:', doesNoExists + 10
    * print 'Default value from karate-config.js: ', someDefaultConfig

    Then assert color + num == 'red 5'

  Scenario: Given, When and Then is obsolete
    * print 'The given, when, then blocks are ignored in the end'
    * print 'You can leave them out'
  
  Scenario: Basic expressions
    * def one = 1
    * def two = 2
    * def three = one + two
    * assert 4 > three

  Scenario: Native JSON support 
   * def json = {this: "is", a:"json", "object": true }
   * match json.this == "is"
   
  Scenario: CSV file to json
    * def bestMovies = read('best-movies.csv')
    * print bestMovies
    * def names = get bestMovies $[*].name
    * print names
    


  Scenario Outline: inline json
    * match __row == { first: 'hello', second: { a: 1 } }
    * match first == 'hello'
    * match second == { a: 1 }

    Examples: Just a view examples
      | first | second!  |
      | hello | { a: 1 } |

  Scenario: Matching text
    * def yourResponse = "12:10:33.960 [print] Kyc Status changed from NotStarted to Accepted.Reason: Output Address AddressLine : 6927 14TH AVE"
    * match yourResponse contains "NotStarted to Accepted"
    * match yourResponse !contains "does not contain"
    * assert new RegExp("NotStarted to Accepted").test(yourResponse)


  Scenario Outline: Reading examples from csv. Placeholders like <name> and <likes> will be replaced by example data.
    * print '<name>'
    * print '<likes>'
    Examples:
      | read('data.csv') |


#  Scenario: Documentary string..
#  This is is currently - 0.9.5.RC3 - a bug and doesn't terminate.
#    Given url "https://www.google.de"
#      """
#      This is text to document your scenario in detail.
#      """
#    When method get
#    Then status 200

  Scenario: Documentary string  whit karate embed
    Given url "https://www.google.de"
    * karate.embed('This is text to document your scenario in detail.', 'text/plain')
    When method get
    Then status 200

  # following scenarios reproduce test result listing bug
  Scenario: First 'scenario' with single quotes in title
    * print 1

  Scenario: Second 'scenario' with single quotes in title
    * print 1 + 1

  Scenario: First scenario without quotes in title
    * print 1 + 1 + 1