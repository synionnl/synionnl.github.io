Feature: CQRS events

    Background:
        Given event handler is auto wired

    Scenario: Can notify event
        When event is notified
        Then notification is recieved

    Scenario: Can auto wire second event handler of same event type
        When second event handler is auto wired
        When event is notified
        Then notification is recieved twice

    Scenario: Can use event aspect
        Given event aspect is autowired
        When event is notified
        Then notification is recieved
        And event aspect is executed

    Scenario: Can use generic event aspect
        Given generic event aspect is autowired
        When event is notified
        Then notification is recieved
        And event aspect is executed

    Scenario: Can use multiple event aspects
        Given generic event aspect is autowired
        And event aspect is autowired
        When event is notified
        Then notification is recieved
        And event aspect is executed twice

    Scenario: Event aspect can stop pipeline
        Given generic event aspect is autowired
        And event aspect next is not executed
        When event is notified
        Then notification is not recieved
    
    Scenario: Can activate event aspect with attribute
        Given attributed event handler is auto wired
        When event is notified
        Then notification is recieved
        And event attribute aspect is executed