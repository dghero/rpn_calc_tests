Feature: Calc POP

Scenario: POP endpoint returns last PUSHed value
    When I call PUSH with value "143"
    And I call POP
    Then the response is successful
    And the response is value "143"


Scenario: POP endpoint removes value from calc stack
    Given the calc stack is cleared
    When I call PUSH with value "11433"
    When I call PUSH with value "143"
    And I call POP
    And I call GET STACK
    Then the response is successful
    And the response is a list not containing value "143"

Scenario: POP endpoint does not remove non-top values from calc stack
    Given the calc stack is cleared
    When I call PUSH with value "76"
    When I call PUSH with value "77"
    When I call PUSH with value "78"
    And I call POP
    And I call GET STACK
    Then the response is successful
    And the response is a list containing value "76"
    And the response is a list containing value "77"


    # Technically, this is an undocumented 500 internal server error,
    # and it would be better to poke the devs on proper error handling,
    # but I'm adding it for negative testing purposes anyway
Scenario: TODO POP returns error when called with empty stack
    