import std/[math, strformat]
from pixie import Image, newImage, Vec2, vec2

from ./hexagon import HexagonSize, newHexagonSize

type AxialCoordinate* = tuple[q: int, r: int]

type Workspace* = ref object
  radius*: int
  hexSize*: HexagonSize
  width*: int
  height*: int


proc newWorkspace*(radius: int, hexSize: int): Workspace =
  let hexagonSize = newHexagonSize(hexSize.toFloat())
  let hexWidth = hexagonSize.width.toInt()
  let hexHeight = hexagonSize.height.toInt()
  let width = hexWidth + (hexWidth * (radius-1) * 2)
  let height = hexHeight + (hexHeight * (radius-1) * 2)

  result = new Workspace
  result.radius = radius
  result.hexSize = hexagonSize
  result.width = width
  result.height = height


proc `$`*(wksp: Workspace): string =
  &"\nWorkspace(\n\tradius: {wksp.radius}, \n\thexSize: {0}\n)"


proc newImage*(workspace: Workspace): Image =
  return newImage(workspace.width, workspace.height)


proc toPixelPos*(wksp: Workspace, axialPos: AxialCoordinate): Vec2 =
  let hexWidth = wksp.hexSize.width
  let horzOffset = wksp.hexSize.horzOffset
  let vertOffset = wksp.hexSize.vertOffset
  let centerX:float = wksp.width.toFloat() / 2.0
  let centerY:float = wksp.height.toFloat() / 2.0

  # q translates to move horizontally
  var xOffset:float = axialPos.q.toFloat() * hexWidth
  # r translates to move diagonally
  let yOffset:float = axialPos.r.toFloat() * (vertOffset)
  xOffset += axialPos.r.toFloat() * (horzOffset/2)
  return vec2(centerX + xOffset, centerY + yOffset)