@StackFeature
Feature: Calc STACK

Scenario: STACK endpoint can return empty stack
    Given the calc stack is cleared
    When I call GET STACK
    Then the response is successful
    Then the response is an empty list

Scenario: STACK endpoint can return single-value stack
    Given the calc stack is cleared
    When I call PUSH with value "2112"
    And I call GET STACK
    Then the response is successful
    And the response is a list with single value "2112"

Scenario: TODO STACK endpoint can return all values after invalid push
    Given you finish this scenario

Scenario: TODO STACK endpoint can return all values after pop
    Given you finish this scenario