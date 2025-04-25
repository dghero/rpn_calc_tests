@StackFeature
Feature: Calc STACK

Background:
    Given the calc stack is cleared

Scenario: STACK endpoint can return empty stack
    When I call GET STACK
    Then the response is successful
    Then the response is an empty list

Scenario: STACK endpoint can return single-value stack
    Given the stack is populated with values
        | value |
        | 2112  |
    When I call GET STACK
    Then the response is successful
    And the response is a list with single value "2112"

@smoke
Scenario: STACK endpoint can return multi-value stack
    Given the stack is populated with values
        | value |
        | 1     |
        | 2     |
        | 3     |
        | 4     |
        | 5     |
    When I call GET STACK
    Then the response is successful
    And the response is a list with values
        | value |
        | 1     |
        | 2     |
        | 3     |
        | 4     |
        | 5     |
