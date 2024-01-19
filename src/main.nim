import std/strformat
import std/random
import pixie

import ./renderer/renderer
from workspace import newWorkspace





# # Represents a signal in the system.
# # A signal is defined by its color, position on the hexagonal grid, and direction.
# type
#   Signal = object
#     color: RGBA                # The color of the signal
#     position: AxialCoordinate  # The axial coordinate of the signal on the grid
#     direction: Direction       # The direction the signal is pointing in





# echo "Hello World"
# let testSignal = Signal(
#   # color: RGBA(r: 255, g: 0, b: 0, a: 255), 
#   color: [255'u8, 0'u8, 0'u8, 255'u8],
#   position: [0, 0],
#   direction: dEast
#   )
# echo testSignal


proc main() =
  # Start the randomizer!
  randomize()

  let workspace = newWorkspace(toFloat(3), 25)
  let outImage = renderWorkspace(workspace)
  outImage.writeFile(&"output.png")

  # for i in 1..5:
  #   # Create a Workspace and render it to an image.
  #   let workspace = newWorkspace(toFloat(i), 25)
  #   let outImage = renderWorkspace(workspace)
  #   outImage.writeFile(&"output-{i}.png")


# Run the Application
main()