import std/[strformat, math, random]
import chroma
import pixie

import ../workspace
import ../hexagon




proc randomColor(): Color =
  let
    r = rand(255).uint8
    g = rand(255).uint8
    b = rand(255).uint8

  return color(rgba(r, g, b, 255))



proc pathHexagon(ctx: Context, pos: Vec2, size: float) =
  ctx.beginPath()
  ctx.polygon(pos, size, sides = 6)
  ctx.closePath()

proc drawFilledHexagon(ctx: Context, pos: Vec2, size: float, color: Color) =
  ctx.pathHexagon(pos, size)
  ctx.fillStyle = color
  ctx.fill()

proc drawHexagon(ctx: Context, pos: Vec2, size: float, color: Color) =
  ctx.pathHexagon(pos, size)
  ctx.strokeStyle = color
  ctx.stroke()



proc renderHexagonRing(ctx: Context, workspace: Workspace, ringPos: int, hexSize: float, color: Color) =
  let minValue = -ringPos
  let maxValue = ringPos
  var s = 0

  for q in minValue..maxValue:
    for r in minValue..maxValue:
      s = -q - r
      if s in minValue..maxValue:
        let pos = workspace.toPixelPos((q: q, r: r))
        ctx.drawHexagon(pos, hexSize, color)



proc renderWorkspace*(workspace: Workspace): Image =
  # let hexSize = newHexagonSize(workspace.hexSize.toFloat())
  let hexSize = workspace.hexSize
  # create the result image from the workspace.
  result = newImage(workspace)
  # Create a context so we can draw the buffer at position.
  let ctx = newContext(result)
  # Background Fill
  result.fill(parseHtmlHex("#000000"))

  # Draw a ring of hexagons
  ctx.renderHexagonRing(workspace, 3, hexSize.size, parseHtmlHex("#2ECC40"))

  # Draw a row of hexagons
  #[
  var startPos:int = 0 - toInt(workspace.radius/2)-1
  var endPos:int = toInt(workspace.radius/2)+1
  for q in startPos..endPos:
    for r in (startPos-q)..(endPos-q):
      let pos = workspace.toPixelPos((q: q, r: r))
      ctx.drawHexagon(pos, hexSize.size, parseHtmlHex("#2ECC40"))
  ]#
  

  #[
  ctx.drawHexagon(
    workspace.toPixelPos((q: 0, r: 0)),
    hexSize.size, 
    parseHtmlHex("#2ECC40")
  )

  ctx.drawHexagon(
    workspace.toPixelPos((q: 1, r: 0)),
    hexSize.size, 
    parseHtmlHex("#0074D9")
  )

  ctx.drawHexagon(
    workspace.toPixelPos((q: -1, r: 0)),
    hexSize.size, 
    parseHtmlHex("#FF4136")
  )
  
  ctx.drawHexagon(
    workspace.toPixelPos((q: 0, r: -1)),
    hexSize.size, 
    parseHtmlHex("#FFDC00")
  )

  ctx.drawHexagon(
    workspace.toPixelPos((q: -1, r: 1)),
    hexSize.size, 
    parseHtmlHex("#2ECC40")
  )
  ]#