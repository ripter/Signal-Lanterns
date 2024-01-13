import std/strformat
from pixie import Image, newImage

from ./hexagon import HexagonSize, newHexagonSize

type Workspace* = ref object
  radius*: int
  hexSize*: HexagonSize


proc newWorkspace*(radius: int, hexSize: int): Workspace =
  result = new Workspace
  result.radius = radius
  result.hexSize = newHexagonSize(hexSize.toFloat())


proc `$`*(wksp: Workspace): string =
  &"\nWorkspace(\n\tradius: {wksp.radius}, \n\thexSize: {0}\n)"


proc newImage*(workspace: Workspace): Image =
  ## Creates an image based on the size of the workspace and hexagons.
  let hexWidth = workspace.hexSize.width.toInt()
  let hexHeight = workspace.hexSize.height.toInt()
  let width = hexWidth + (hexWidth * workspace.radius * 2)
  let height = hexHeight + (hexHeight * workspace.radius * 2)
  return newImage(width, height)

