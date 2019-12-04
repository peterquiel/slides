Feature: The green belt is awarded to intermediate students who are refining their kills.



  Scenario: fuzzy schema matching is important
    * def bestMovies = read('best-movies.csv')
    * match each bestMovies.store.book == {}