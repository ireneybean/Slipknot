Feature: show_donation_pages
  As a donor
  I want to give Escape Artists money
  so that I can be entertained
  
  
  Scenario: go to donation page
    When I go to the donation page
    Then I should see "Support Escape Artists!"

  Scenario: fill in donor form
    Given I am on the donation page
    When I fill in "Amount" with "15"
    And I check "one time"
    And I check "Escape Pod"
    And I fill in "Name" with "Bob Smith"
    And I fill in "Email" with "bobsmith@gmail.com"
    And I press "Donate"
    Then I should be on the Payment Page
    And I should see "Single Donation"
    And I should see "Pay with Paypal"