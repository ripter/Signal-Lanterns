import std/strformat

from hexagon import HexagonSize, newHexagonSize

type Workspace* = ref object
  radius*: int
  hexSize*: HexagonSize


proc newWorkspace*(radius: int, hexSize: int): Workspace =
  result = new Workspace
  result.radius = radius
  result.hexSize = newHexagonSize(hexSize.toFloat())


proc `$`*(wksp: Workspace): string =
  &"\nWorkspace(\n\tradius: {wksp.radius}, \n\thexSize: {0}\n)"