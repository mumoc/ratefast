Feature: Add Recommendations
  In order clicked on Add my recommendations
  A user
  Should be able to create two new plates for voting menu

    Scenario: User can see the form to add recommendations
    Given I am logged in
    When An exiting voting is open
    And I clicked on add my recommendations
    Then I should see the form for update voting

    Scenario: User can see their dishes
    Given I am logged in
    When An exiting voting is open
    And I clicked on add my recommendations
    Then I should see my recommendations

    Scenario: User can't see form to add recommendations without logged in
    Given I am not logged in
    When An exiting voting is open
    And I clicked on add my recommendations
    Then I should redirect to login
