import std/math
import std/strformat

type HexagonSize* = ref object
  size*: float
  width*: float
  height*: float
  horzOffset*: float
  vertOffset*: float


proc calcWidth(height: float): float =
  (height / 2.0) * sqrt(3.0)


proc calcHorizOffset(size: float): float =
  # horiz = width = sqrt(3) * size
  sqrt(3.0) * size

proc calcVertOffset(size: float): float =
  # vert == 3/4 * height == 3/2 * size
  (3/2) * size


proc newHexagonSize*(size: float): HexagonSize =
  result = new HexagonSize
  result.size = size
  result.height = size * 2
  result.width = calcWidth(result.height)
  result.horzOffset = calcHorizOffset(size)
  result.vertOffset = calcVertOffset(size)


proc `$`*(hexSize: HexagonSize): string =
  &"\nHexagonSize(\n\tsize: {hexSize.size}, \n\twidth: {hexSize.width}, \n\theight: {hexSize.height}, \n\thorzOffset: {hexSize.horzOffset}, \n\tvertOffset: {hexSize.vertOffset}\n)"