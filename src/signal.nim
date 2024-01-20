import chroma

import ./types


# Represents a signal in the system.
# A signal is defined by its color, position on the hexagonal grid, and direction.
type
  Signal* = object
    color*: ColorRGBA           # The color of the signal
    position*: AxialCoordinate  # The axial coordinate of the signal on the grid
    direction*: Direction       # The direction the signal is pointing in