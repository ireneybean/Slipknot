#TODO: Figure out how to check for the podcast checkboxes

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
    And I should see "monthly"
    And the checkbox with id "Escape_Pod" should be checked
    And the checkbox with id "PodCastle" should be checked
    And the checkbox with id "Pseudopod" should be checked
    And the checkbox with id "donation_type_recurringdonation" should not be checked

  Scenario: fill in donor form
    Given I am on the new donation page
    When I fill in "I want to donate" with "15"
    And I check "Escape_Pod"
    And I fill in "My name" with "Bob Smith"
    And I fill in "My email" with "bobsmith@gmail.com"
    And I press "Proceed to Payment"
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
    And I press "Proceed to Payment"
    Then I should see "Amount must be greater than 0"
    
  Scenario: validate at least one podcast is selected
    Given I am on the new donation page
    When I fill in "I want to donate" with "15"
    And I fill in "My name" with "John"
    And I uncheck "Escape_Pod"
    And I uncheck "PodCastle"
    And I uncheck "Pseudopod"
    And I press "Proceed to Payment"
    Then I should see "Podcasts can't be blank"
    
    
#  Scenario: go to donation edit page
#    Given I have made a "single" donation record
#    And I am on the new payment page for that donation
#    And I follow "edit"
#    Then I should be on the edit donation page for that donation
  
#  Scenario: make changes to existing donation record
#    pending
#    Given I have made a "single" donation record
#    And I am on the edit donation page for that donation
#    And I choose "donation_type_recurringdonation"
#    And I fill in "My Name" with "Edited"
#    And I press "Proceed to Payment"
#    Then I should be on the new payment page for that donation
#    And I should see "monthly"
#    And I should see "Edited"
#    And I should see "BobSmith@gmail.com"
    
