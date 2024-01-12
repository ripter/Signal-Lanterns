import std/math
import std/strformat

type HexagonSize* = ref object
  size*: float
  width*: float
  height*: float
  horzOffset*: float
  vertOffset*: float


proc calcWidth(size: float): float =
  ## Width of the hexagon
  sqrt(3.0) * size

proc calcHeight(size: float): float =
  ## Height of the hexagon
  2 * size

proc calcHorizOffset(size: float): float =
  ## Horizontal distance between the centers of two adjacent hexagons
  # horiz = width = sqrt(3) * size
  sqrt(3.0) * size

proc calcVertOffset(size: float): float =
  ## Vertical distance between the centers of two adjacent hexagons
  # vert == 3/4 * height == 3/2 * size
  (3/2) * size



proc newHexagonSize*(size: float): HexagonSize =
  result = new HexagonSize
  result.size = size
  result.height =calcHeight(size) 
  result.width = calcWidth(size)
  result.horzOffset = calcHorizOffset(size)
  result.vertOffset = calcVertOffset(size)


proc `$`*(hexSize: HexagonSize): string =
  &"\nHexagonSize(\n\tsize: {hexSize.size}, \n\twidth: {hexSize.width}, \n\theight: {hexSize.height}, \n\thorzOffset: {hexSize.horzOffset}, \n\tvertOffset: {hexSize.vertOffset}\n)"