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

Scenario: POP endpoint removes value from calc stack
    Given the stack is populated with values
        | value |
        | 11433 |
        | 143   |
    When I call POP
    And I call GET STACK
    Then the response is successful
    And the response is a list not containing value "143"

Scenario: POP endpoint does not modify non-top values from calc stack
    When I call PUSH with value "76"
    When I call PUSH with value "77"
    When I call PUSH with value "78"
    And I call POP
    And I call GET STACK
    Then the response is successful
    And the response is a list containing values
        | value |
        | 76    |
        | 77    |
