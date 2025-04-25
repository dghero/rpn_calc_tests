@PopFeature
Feature: Calc POP

Background:
    Given the calc stack is cleared

Scenario: POP endpoint returns last value from calc stack
    Given the stack is populated with values
        | value |
        | 141   |
        | 142   |
        | 143   |
    When I call POP
    Then the response is successful
    And the response is value "143"

@smoke
Scenario: POP endpoint removes value from calc stack
    Given the stack is populated with values
        | value |
        | 11433 |
        | 143   |
    When I call POP
    And I call GET STACK
    Then the response is a list not containing value "143"

Scenario: POP endpoint does not modify non-top values of calc stack
    Given the stack is populated with values
        | value |
        | 76    |
        | 77    |
        | 78    |
        | 79    |
    When I call POP
    And I call GET STACK
    Then the response is a list with values
        | value |
        | 76    |
        | 77    |
        | 78    |
