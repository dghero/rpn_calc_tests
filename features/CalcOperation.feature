@OperationFeature
Feature: Calc OPERATION

Scenario Outline: OPERATION endpoint returns calculated value in response
    Given the calc stack is cleared
    And the stack is populated with values
        | value |
        | 15    |
        | 5     |
    When I call OPERATION <operation>
    Then the response is value "<result>"

    Examples:
    | operation      | result |
    | Addition       | 20     |
    | Subtract       | 10     |
    | Multiplication | 75     |
    | Division       | 3      |

Scenario Outline: OPERATION endpoint places calculated value on the stack
    Given the calc stack is cleared
    When I call PUSH with value "15"
    And I call PUSH with value "5"
    And I call OPERATION <operation>
    And I call GET STACK
    Then the response is a list with single value "<result>"

    Examples:
    | operation      | result |
    | Addition       | 20     |
    | Subtract       | 10     |
    | Multiplication | 75     |
    | Division       | 3      |

Scenario Outline: OPERATION endpoint removes original values on the stack
    Given the calc stack is cleared
    When I call PUSH with value "15"
    And I call PUSH with value "5"
    And I call OPERATION <operation>
    And I call GET STACK
    Then the response is a list not containing value "5"
    And the response is a list not containing value "15"

    Examples:
    | operation      | result |
    | Addition       | 20     |
    | Subtract       | 10     |
    | Multiplication | 75     |
    | Division       | 3      |