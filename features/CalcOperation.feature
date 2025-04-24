Feature: Calc OPERATION

Scenario Outline: OPERATION endpoint returns calculated value in response
    Given the calc stack is cleared
    When I call PUSH with value "15"
    And I call PUSH with value "5"
    And I call OPERATION <operation>
    Then the response is value "<result>"

    Examples:
    | operation      | result |
    | Addition       | 20     |
    | Subtract       | 10     |
    | Multiplication | 75     |
    | Division       | 3      |

Scenario: AAAAAAAAAA
