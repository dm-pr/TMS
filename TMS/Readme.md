# Techniques / concepts / frameworks used:

* Entity Framework Core
* MVC with no Razor Pages
* Model Binding 
* Automapper
* Identity
* Role-dependent areas
* Area routing
* Bootstrap 5
* API & JS fetching




Relations:

Operator one-to-one OperatorSchedule - Operator = principle
OperatorSchedule  one-to-many Tickets  -  optional because Ticket can exist without being assigned to Operator.  Optional relationship via omitting FK in Ticket.



Error handling

API controllers have extensive error handling

HTTP Code errors like 404 have very basic middleware handling

Validation should prevent bad parameters, 
and request parameters manipulation/injection that result in thrown exceptions are handled in most basic way - via middleware and Error method in Login Controller.

Some hardcoded error messages and alerts. Also hardcoded report templates.
