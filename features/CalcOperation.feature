@OperationFeature
Feature: Calc OPERATION

Background:
    Given the calc stack is cleared

Scenario Outline: OPERATION endpoint returns calculated value in response
    Given the stack is populated with values
        | value |
        | 15    |
        | 5     |
    When I call OPERATION <operation>
    Then the response is successful
    And the response is value "<result>"

    Examples:
    | operation      | result |
    | Addition       | 20     |
    | Subtract       | 10     |
    | Multiplication | 75     |
    | Division       | 3      |

@smoke
Scenario Outline: OPERATION endpoint places calculated value on the stack
    Given the stack is populated with values
        | value |
        | 15    |
        | 5     |
    When I call OPERATION <operation>
    And I call GET STACK
    Then the response is a list with single value "<result>"

    Examples:
    | operation      | result |
    | Addition       | 20     |
    | Subtract       | 10     |
    | Multiplication | 75     |
    | Division       | 3      |


Scenario Outline: OPERATION endpoint removes original input values from the stack
    Given the stack is populated with values
        | value |
        | 15    |
        | 5     |
    When I call OPERATION <operation>
    And I call GET STACK
    Then the response is a list not containing value "5"
    And the response is a list not containing value "15"

    Examples:
    | operation      | result |
    | Addition       | 20     |
    | Subtract       | 10     |
    | Multiplication | 75     |
    | Division       | 3      |


Scenario Outline: OPERATION endpoint does not modify non-input values
    Given the stack is populated with values
        | value |
        | 451   |
        | 216   |
        | 15    |
        | 5     |
    When I call OPERATION <operation>
    And I call GET STACK
    Then the response is a list with values
        | value    |
        | 451      |
        | 216      |
        | <result> |

    Examples:
    | operation      | result |
    | Addition       | 20     |
    | Subtract       | 10     |
    | Multiplication | 75     |
    | Division       | 3      |


Scenario Outline: OPERATION endpoint can calculate negative values
    Given the stack is populated with values
        | value |
        | -15   |
        | -5    |
    When I call OPERATION <operation>
    Then the response is successful
    And the response is value "<result>"

    Examples:
    | operation      | result |
    | Addition       | -20    |
    | Subtract       | -10    |
    | Multiplication | 75     |
    | Division       | 3      |


Scenario Outline: OPERATION endpoint can calculate decimal values
    Given the stack is populated with values
        | value |
        | 6.6   |
        | 3.3   |
    When I call OPERATION <operation>
    Then the response is successful
    And the response is value "<result>"

    Examples:
    | operation      | result |
    | Addition       | 9.9    |
    | Subtract       | 3.3    |
    | Multiplication | 21.78  |
    | Division       | 2      |