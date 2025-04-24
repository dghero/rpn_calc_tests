@DeleteFeature
Feature: Calc DELETE

Scenario: Delete endpoint deletes all values
    Given the stack is populated with values
        | value |
        | 3001  |
        | 3002  |
        | 3003  |
    When I call DELETE
    And I call GET STACK
    Then the response is an empty list

Scenario: Delete endpoint returns no value in response
    When I call DELETE
    Then the response is successful
    And the response has content-length 0