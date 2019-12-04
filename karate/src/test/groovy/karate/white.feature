# tag::structure[]
Feature: Karate Hello World

  Background: A block that is executed before every scenario
    * url "https://jsonplaceholder.typicode.com"
    
  Scenario: Fetch todo number one
    Given path "todos", "1"
    When method get
    Then status 200
    * match response.id == 1
# end::structure[]
