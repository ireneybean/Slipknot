Feature: show_donation_pages
  As a donor
  I want to give Escape Artists money
  so that I can be entertained
  
  
  Scenario: go to donation page
    When I go to the new donation page
    Then I should see "Support Escape Artists!"

  Scenario: fill in donor form
    Given I am on the new donation page
    When I fill in "Amount" with "15"
    And I check "Escape Pod"
    And I fill in "Name" with "Bob Smith"
    And I fill in "Email" with "bobsmith@gmail.com"
    And I press "Donate"
    Then I should have a donation for "Bob Smith"
    And I should be on the new payment page for that donation
    And I should see "Single Donation"
    And I should see a button labeled "Pay with Paypal"

  Scenario: make a payment
    Given I have made a donation record
    And I am on the new payment page for that donation
    When I press "Pay with Paypal"
    Then I should be redirected to Paypal