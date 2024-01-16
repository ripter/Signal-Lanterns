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



proc renderHexagonGrid(ctx: Context, workspace: Workspace, color: Color) =
  let hexSize = workspace.hexSize.size
  let minValue = -workspace.radius
  let maxValue = workspace.radius
  var s = 0

  for q in minValue..maxValue:
    for r in minValue..maxValue:
      s = -q - r
      if s in minValue..maxValue:
        let pos = workspace.toPixelPos((q: q, r: r))
        ctx.drawHexagon(pos, hexSize, color)



proc renderWorkspace*(workspace: Workspace): Image =
  let bgColor = parseHtmlHex("#000000")
  let color = parseHtmlHex("#2ECC40") 
  # create the result image from the workspace.
  result = newImage(workspace)
  # Create a context so we can draw the buffer at position.
  let ctx = newContext(result)
  # Background Fill
  result.fill(bgColor)

  # Draw the Hexagon Grid
  ctx.renderHexagonGrid(workspace, color)

