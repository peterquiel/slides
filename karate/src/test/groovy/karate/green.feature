Feature: The green belt is awarded to intermediate students who are refining their kills.


  Scenario: fuzzy schema matching helps to validate a json completely or partly against a schema
    see https://github.com/intuit/karate#fuzzy-matching 
    and see https://github.com/intuit/karate#self-validation-expressions for exprissions
    * def bestMovies = read('books.json')

    # match every element in an array against a schema
    * match each bestMovies.store.book == {category: "#regex (reference|fiction)", author: "#present", title: "#string", isbn: "#ignore", price:"#number"}

    # every book must have a positive price
    * match each bestMovies.store.book contains {price: "#? _ > 0"}

    # expect four objects in the book array
    * match bestMovies.store.book == '#[4] #object'

    # expect that if a book has an isbn, it's a string. 
    * match each bestMovies.store.book contains {isbn: "##string"}

    # matching against a mixed schema, just need to match any
    * match each bestMovies.store.book contains any {isbn: "##string", "not_exists": "#present"}
