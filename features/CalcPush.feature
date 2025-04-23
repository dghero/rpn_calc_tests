Feature: Calc PUSH

Scenario: PUSH endpoint populates empty stack with value
    Given the calc stack is cleared
    When I call PUSH with value "24601"
    And I call GET STACK
    Then the response is successful
    And the response is a list with single value "24601"

Scenario: PUSH endpoint populates stack in correct order
    Given the calc stack is cleared
    When I call PUSH with value "101"
    When I call PUSH with value "102"
    When I call PUSH with value "103"
    When I call PUSH with value "104"
    And I call GET STACK
    Then the response is successful
    And the response is a list with values

Scenario: PUSH endpoint returns no value in response
    When I call PUSH with value "314159"
    Then the response is successful
    And the response has content-length 0