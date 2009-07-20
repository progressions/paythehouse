Feature: Sending email
  In order to understand what's going
  As a user
  I want to receive an email when I'm assigned a bill or payment
    
  Background: 
    Given a user: "bob" exists with login: "bob", name: "bob", state: "active", email: "bob@gmail.com"
    And a signed-in user named "matt"
  
  Scenario: Bob should receive an email when matt assigns him a bill
    Given a clear email queue
    When I go to the new bill page
    And I fill in "Amount" with "100.00"
    And I fill in "matt" with "50.00"
    And I fill in "bob" with "50.00"
    And I fill in "Note" with "cable bill"
    And I press "Submit"
    Then I should be on the homepage
    And I should see "Successfully created bill"
    And "bob@gmail.com" should receive 1 email
    When "bob@gmail.com" opens the email with subject "You have been assigned a bill"
    Then I should see "You have been assigned a payment in the amount of \$50\.00\." in the email
    And I should see "Balances" in the email
    And I should see "You owe .*matt.*\$50\.00" in the email
    And I should see "matt owes you 0.00" in the email
    And I should see "Note: cable bill" in the email
  

  
