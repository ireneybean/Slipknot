Feature: show_donation_pages
  As a donor
  I want to give Escape Artists money
  so that I can be entertained
  
  
  Scenario: go to donation page
    When I go to the new donation page
    Then I should see "Support Escape Artists!"
    And I should see "Escape Pod"
    And I should see "PodCastle"
    And I should see "Pseudopod"

  Scenario: fill in donor form
    Given I am on the new donation page
    When I fill in "Amount" with "15"
    And I check "Escape Pod"
    And I fill in "Name" with "Bob Smith"
    And I fill in "Email" with "bobsmith@gmail.com"
    And I press "Donate"
    Then I should have a donation for "Bob Smith"
    And I should be on the new payment page for that donation
    

  Scenario: make a payment
    Given I have made a donation record
    And I am on the new payment page for that donation
    Then I should see "Single Donation"
    And I should see the paypal form
    And a hidden "amount" should be the donation amount
    And a hidden "item_number" should be the donation id

  Scenario: validate donation amout
    Given I am on the new donation page
    When I fill in "Amount" with "-1"
    And I press "Donate"
    Then I should see "Amount must be greater than 0"