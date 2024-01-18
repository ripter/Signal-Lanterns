import std/[math, strformat]
from pixie import Image, newImage, Vec2, vec2

from ./hexagon import HexagonSize, newHexagonSize
from ./AxialCoordinate import AxialCoordinate


type Workspace* = ref object
  radius*: int
  hexSize*: HexagonSize
  width*: int
  height*: int


proc newWorkspace*(radius: int, hexSize: int): Workspace =
  let hexagonSize = newHexagonSize(hexSize.toFloat())
  let hexWidth:float = hexagonSize.width
  let hexHeight:float = hexagonSize.height
  let verticalSpacing:float = 1.5 * hexSize.toFloat()
  let diameter:float = radius.toFloat() * 2
  let width:float = hexWidth + (hexWidth * diameter)
  let height: float = hexHeight + (verticalSpacing * (2 * radius.toFloat()))

  result = new Workspace
  result.radius = radius
  result.hexSize = hexagonSize
  result.width = width.toInt()
  result.height = height.toInt()


proc `$`*(wksp: Workspace): string =
  &"\nWorkspace(\n\tradius: {wksp.radius}, \n\thexSize: {wksp.hexSize.size}\n)"


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