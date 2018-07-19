Feature: BBC Login

  #Test1
  Scenario: During the registration process age verification fails and and gives an error
    Given I access the bbc registration page
      And I click the thirteen or over button
      And I input a date less that thirteen years in the past
    When I try to click continue
    Then I receive an error telling me I need to be thirteen or over

  #Test2
  Scenario: During the registration process a pre registered email is used and gives an error
    Given I access the bbc registration page
      And I click the thirteen or over button with valid age
      And I input a pre registered email address
    When I try to click register
    Then I receive an error telling me the email is already registered

  #Test3
  Scenario: During the registration process an unregistered email and invalid password is used and gives an error
  Given I access the bbc registration page with a new dummy email
    And I click the thirteen or over button with valid age
    And I input a short and invalid password
  When I try to click register
  Then I receive an error telling me the password is too short

  #Test4
  Scenario: During the registration process I input a city instead of a postcode and gives an error
  Given I access the bbc registration page with a new dummy email
    And I click the thirteen or over button with valid age
    And I input a city
  When I try to click register
  Then I receive an error telling me the postcode is invalid

  #Test5
  Scenario: During the registration process I don't choose an email update option and I get an error
    Given I access the bbc registration page with a new dummy email
      And I click the thirteen or over button with valid age
      And I skip the email updates section
    When I try to click register
    Then I receive an error telling me that email updates was missed

  #Test6
  Scenario: During the registration process an unregistered email and invalid password is used and gives an error
    Given I access the bbc registration page with a new dummy email
      And I click the thirteen or over button with valid age
      And I input a invalid password
    When I try to click register
    Then I receive an error telling me the password is invalid
