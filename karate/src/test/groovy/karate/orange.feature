Feature: Orange is representation of growing strength of sun, orange belt also symbolizes improvement in individual’s skills.

  Scenario: `get` accepts json XPath queries 
    see https://github.com/json-path/JsonPath#path-examples 
    * def bestMovies = read('best-movies.csv')
    * def names = get bestMovies $[*].name
    * print names
    * match names contains "The Karate Kid"
    # or directly with the matcher
    * match bestMovies $[*].name contains "The Karate Kid"









  Scenario: A more complicated xpath query
   * def books = read('books.json')  
   * match books $..[?(@.price > 20)].title == ["The Lord of the Rings"]









  Scenario: json files as templates
   set and remove makes updating json easy .. see https://github.com/intuit/karate#set and https://github.com/intuit/karate#remove
   * def books = read('books.json')  
   * set books $..[?(@.price > 20)].title = "Braindead"
   * match books $..[?(@.price > 20)].title == ["Braindead"]

  #  this causes currently an error String indec out of range: -1
  #  * remove books $..[?(@.price > 20)]
   * remove books.store.book[3]
   * match books $..[?(@.price > 20)] == []
