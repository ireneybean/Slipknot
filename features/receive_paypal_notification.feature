  Scenario: receive paypal notification
    Given I have made a "single" donation record
    When I receive a notification of payment received
    Then I have a payment record for my donation
