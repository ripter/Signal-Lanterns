import std/[math, strformat]
from pixie import Image, newImage, Vec2, vec2

from ./hexagon import HexagonSize, newHexagonSize

type AxialCoordinate = tuple[q: int, r: int, s: int]

type Workspace* = ref object
  radius*: int
  hexSize*: HexagonSize
  width*: int
  height*: int


proc newWorkspace*(radius: int, hexSize: int): Workspace =
  let hexagonSize = newHexagonSize(hexSize.toFloat())
  let hexWidth = hexagonSize.width.toInt()
  let hexHeight = hexagonSize.height.toInt()
  let width = hexWidth + (hexWidth * radius * 2)
  let height = hexHeight + (hexHeight * radius * 2)

  result = new Workspace
  result.radius = radius
  result.hexSize = hexagonSize
  result.width = width
  result.height = height


proc `$`*(wksp: Workspace): string =
  &"\nWorkspace(\n\tradius: {wksp.radius}, \n\thexSize: {0}\n)"


proc newImage*(workspace: Workspace): Image =
  ## Creates an image based on the size of the workspace and hexagons.
  let radius = workspace.radius - 1
  let hexWidth = workspace.hexSize.width.toInt()
  let hexHeight = workspace.hexSize.height.toInt()
  let width = hexWidth + (hexWidth * radius * 2)
  let height = hexHeight + (hexHeight * radius * 2)
  return newImage(width, height)


proc toPixelPos*(wksp: Workspace, axialPos: AxialCoordinate): Vec2 =
  let centerX:float = wksp.radius.toFloat() * wksp.hexSize.width
  let centerY:float = wksp.radius.toFloat() * wksp.hexSize.height

  return vec2(centerX, centerY)