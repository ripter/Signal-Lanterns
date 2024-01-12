import std/random
import renderer/renderer


type 
  Opcode = uint64 # ID used to identify a lantern and the native code to execute when a signal collides with it.
  Position = uint8 # Position on the hexgrid
  RGBA = array[4, uint8] # Color of a signal or lantern
  AxialCoordinate = array[2, Position] # Axial coordinates.


# Enum representing the six directions in a hexagonal grid.
# The directions are defined in a clockwise order starting from the north
# for a point-up hexagon.
type
  Direction = enum
    dEastNorth,  # Direction towards the east-northeast
    dEast,       # Direction due east
    dEastSouth,  # Direction towards the east-southeast
    dWestSouth,  # Direction towards the west-southwest
    dWest,       # Direction due west
    dWestNorth   # Direction towards the west-northwest


# Represents a signal in the system.
# A signal is defined by its color, position on the hexagonal grid, and direction.
type
  Signal = object
    color: RGBA                # The color of the signal
    position: AxialCoordinate  # The axial coordinate of the signal on the grid
    direction: Direction       # The direction the signal is pointing in

# Represents a lantern.
# A lantern has a unique identifier, a color, and a position on the grid.
type
  Lantern = object
    opcode: Opcode             # operation code to trigger when a signal collides with the lantern.
    color: RGBA                # Color of the lantern
    position: AxialCoordinate  # Position of the lantern on the grid


# Start the randomizer!
randomize()


# echo "Hello World"
# let testSignal = Signal(
#   # color: RGBA(r: 255, g: 0, b: 0, a: 255), 
#   color: [255'u8, 0'u8, 0'u8, 255'u8],
#   position: [0, 0],
#   direction: dEast
#   )
# echo testSignal


renderWorkspace(200)
