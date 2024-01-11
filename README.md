# Signal-Lanterns

Signal Lanterns is an innovative and esoteric programming language, drawing inspiration from the cellular automaton principles of Conway's Game of Life and the rule-manipulating puzzles of Baba Is You. It stands out by its unique approach to programming, where code is not written in a traditional text format but is instead visually represented and dynamically executed in a 2D hexagonal grid environment.

## Overview

In Signal Lanterns, the primary elements are:

* **Lanterns**: These are the core components placed in the grid, acting as the source, manipulator, or destination of signals.
* **Signals**: Emanating from Lanterns, these colored entities traverse the grid, carrying data and interacting with other Lanterns.
* **Workspace**: This is the 2D hexagonal grid where Lanterns are placed and Signals move.
* **Tick**: A single iteration or time step in the execution of the program, during which Signals move and interact according to predefined rules.

Each program in Signal Lanterns is a dynamic and evolving system, where the placement and configuration of Lanterns determine the flow and transformation of Signals, ultimately leading to the program's output or end state.

## How It Works

* **Initialization**: The user sets up the initial state by placing Lanterns in the Workspace.
* **Execution**: Upon starting the program, the Workspace evolves over a series of Ticks. During each Tick:
  * Signals are generated, absorbed, or manipulated by Lanterns.
  * Signals move one hexagon per Tick, following specific rules based on their color and the Lanterns they interact with.
  * The Workspace updates to reflect these changes.
* **Termination**: The execution of a program in Signal Lanterns can conclude under several conditions:

  * **Stable State**: When the input Workspace is identical to the output Workspace after a Tick, indicating no further changes are occurring.
  * **Terminator Lantern**: When a special Lantern, designated as the Terminator Lantern, is activated. This Lantern serves as a programmable condition for ending the execution.
  * **User Intervention**: The user can choose to manually stop the program at any time, providing flexibility during experimentation and development.

