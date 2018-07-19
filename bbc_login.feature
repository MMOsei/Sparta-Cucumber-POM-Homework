Feature: BBC Login

  Scenario: Inputting incorrect username credentials shows an error
    Given I access the bbc login page
      And I input incorrect username details
      And I input incorrect password details
    When I try to login
    Then I receive an error telling me username not found

  Scenario: Inputting correct username credentials shows an error
    Given I access the bbc login page
      And I input correct username details
      And I input incorrect password details
    When I try to login
    Then I receive an error
