  Scenario: receive paypal notification
    Given I have made a "single" donation record
    When I receive a notification of payment received
    And I have a payment record for my donation
