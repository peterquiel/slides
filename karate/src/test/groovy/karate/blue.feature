Feature: The blue belt awarded to students who have started learning technical skills and additional knowledge about karate.


    Background: setup 
      * url "http://localhost:8080/"
      * configure headers = { 'Content-Type': 'application/json' }
      * configure lowerCaseResponseHeaders = true

    Scenario: Make wire mock return books
    * path "__admin", "mappings"
    * def store = read("books.json")
    * def mockResponse = 
      """
    {
      request: { 
        method: "GET", 
        urlPathPattern: "/blue/books",
        cookies : {
          session : {
            matches : ".*345.*"
          }
        },        
        queryParameters : {
          query : {
            equalTo : "books"
          }
        },        
      },
      response: {
        status: 200,
        jsonBody: {
          books: #(store.store.book)
        },        
        headers: {
            "Content-Type": "application/json",
            "ETag": "W/12345"
        }
      }
    }
    """
    * request mockResponse
    When method post
    Then status 201






  Scenario: Get the books and check response
    Given path "blue", "books"
    # Query parameter as params
    # And param query = "books"
    # or as form fields bc this is a get request
    * form field query = "books"
    * param test = "test"
    * params {}

    * cookie session = "my 345 session cookie"
    When method get
   
    Then status 200
    * match response.books == "#[4]"

    # match header is special and makes header matching easy
    # see https://github.com/intuit/karate#match-header
    * match header etag contains "12345"







  Scenario: Reset wire mock
   Given path "__admin", "reset"
   * request ""
   When method post
   Then status 200





  Scenario: Get wire mock mappings
   Given path "__admin", "mappings"
   * request ""
   When method get
   Then status 200

  # you want to show cUrl past ;-)