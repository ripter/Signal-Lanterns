# Lanterns

Lanterns provide the API for the language. They do something when a Signal collides with them. Many can be "configured" to change it's behaviour.

## Black Hole (aka Null)
Eats all signals that collide with it, destroying them.


## Terminate (aka TERM)
Absorbs signal, Exits Runner, stopping exicution of the program. If a runner was not used, then it does nothing.


## Standard Output (STDOUT)
Absorbs signal, color is converted into UTF-8 char codes and sent to STDOUT.


## Generator
Generates a signal at a specific interval and direction.