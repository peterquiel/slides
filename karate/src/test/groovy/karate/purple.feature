Feature: The purple belt is awarded to students who are converting into advanced stages of leaning phase.


  Background:
   * def combine = function(a,b ) {return a + " " + b;}
   * def oneMore =
   """
     function(a,b,c) {
       return combine(combine(a,b), c);
     } 
   """

   * def Util =  Java.type("karate.Util")

  Scenario: Call JS
    * assert combine("Mr", "Pink") == "Mr Pink"
    * assert oneMore("Hi", "Mr", "Pink") == "Hi Mr Pink"







  Scenario: Calling other scenarios..
    Given def additionalMovie = {placement: "11",name: "Karate Tiger"}
    Given def calledBestMovie = call read('purple.feature@bestMovie') {additionalMovie : #(additionalMovie)}
    * match calledBestMovie.bestMovies contains {name: "The Karate Kid", placement: "#ignore"}
    * match calledBestMovie.bestMovies contains additionalMovie

   @bestMovie
   Scenario: Be called
   * def bestMovies = read("best-movies.csv")
   * def bestMovies = karate.append(bestMovies, karate.get("additionalMovie"));
    # the karate object offers different often needed functions..
    #  see https://github.com/intuit/karate#the-karate-object 





  Scenario: Use Java Interop
     * def util = new Util()
     * def uuid = util.random()
     * print "generated uuid", uuid
     * assert uuid.toString().length() > 0


  Scenario: Karate json arrays are lists
    * def util = new Util()
    * def bestMovies = read("best-movies.csv")
    * def bestMovies = util.addUuid(bestMovies)
    * match each bestMovies contains {id: "#uuid"}
    * print bestMovies








  Scenario: Using Java Types inside JS Functions
    * def dateStringToLong = read("classpath:date-parser.js")
    * assert dateStringToLong("2016-12-24T03:39:21.081+0000") == 1482550761081