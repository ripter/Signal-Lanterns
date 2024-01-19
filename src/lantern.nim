import ./types

# Represents a lantern.
# A lantern has a unique identifier, a color, and a position on the grid.
type
  Lantern* = object
    opcode*: Opcode             # operation code to trigger when a signal collides with the lantern.
    color*: RGBA                # Color of the lantern
    position*: AxialCoordinate  # Position of the lantern on the grid
