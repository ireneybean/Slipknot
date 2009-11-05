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
    And I should see "Monthly"
    And the "Escape Pod" checkbox should be checked
    And the "PodCastle" checkbox should be checked
    And the "Pseudopod" checkbox should be checked
    And the "Monthly" checkbox should not be checked

  Scenario: fill in donor form
    Given I am on the new donation page
    When I fill in "I want to donate" with "15"
    And I check "Escape Pod"
    And I fill in "My name" with "Bob Smith"
    And I fill in "My email" with "bobsmith@gmail.com"
    And I press "Donate"
    Then I should have a donation for "Bob Smith"
    And I should be on the new payment page for that donation

  Scenario: make a single payment
    Given I have made a "single" donation record
    And I am on the new payment page for that donation
    Then a hidden "cmd" should be "_donations"
    And I should see "Bob"
    And I should see "BobSmith@gmail.com"
    And I should see "right now"
    And I should see "15.00"
    And I should see "Escape Pod"
    And I should see the paypal form
    And a hidden "amount" should be the donation amount
    And a hidden "item_number" should be the donation id
    
  Scenario: make a recurring payment
    Given I have made a "monthly" donation record
    And I am on the new payment page for that donation
    Then I should see "monthly"
    And I should see the paypal form
    And a hidden "a3" should be the donation amount
    And a hidden "cmd" should be "_xclick-subscriptions"

  Scenario: validate donation amout
    Given I am on the new donation page
    When I fill in "I want to donate" with "-1"
    And I press "Donate"
    Then I should see "Amount must be greater than 0"
