
type 
  Opcode* = uint64 # ID used to identify a lantern and the native code to execute when a signal collides with it.
  Position* = uint8 # Position on the hexgrid
  RGBA* = array[4, uint8] # Color of a signal or lantern
  AxialCoordinate* = array[2, Position] # Axial coordinates.


# Enum representing the six directions in a hexagonal grid.
# The directions are defined in a clockwise order starting from the north
# for a point-up hexagon.
type
  Direction* = enum
    dEastNorth,  # Direction towards the east-northeast
    dEast,       # Direction due east
    dEastSouth,  # Direction towards the east-southeast
    dWestSouth,  # Direction towards the west-southwest
    dWest,       # Direction due west
    dWestNorth   # Direction towards the west-northwest