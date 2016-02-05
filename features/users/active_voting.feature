Feature: Active Voting
  In order to user is signed in and a voting is open
  A user
  Should be able to see in homepage a link to add recommendations

    Scenario: User can see in homepage a link to add recommendations
    Given I am logged in
    When An exiting voting is open
    Then I show see the message to add my recommendations
