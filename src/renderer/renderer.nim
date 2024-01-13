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



proc renderWorkspace*(workspace: Workspace): Image =
  # let hexSize = newHexagonSize(workspace.hexSize.toFloat())
  let hexSize = workspace.hexSize
  # create the result image from the workspace.
  result = newImage(workspace)
  # Create a context so we can draw the buffer at position.
  let ctx = newContext(result)

  # Draw in the center
  let gridCenterX = result.width / 2
  let gridCenterY = result.height / 2
  ctx.drawFilledHexagon(
    vec2(gridCenterX, gridCenterY), 
    hexSize.size, 
    parseHtmlHex("#2ECC40")
    # randomColor()
  )

  ctx.drawHexagon(
    vec2(gridCenterX+hexSize.width, gridCenterY), 
    hexSize.size, 
    parseHtmlHex("#0074D9")
    # randomColor()
  )

  ctx.drawHexagon(
    vec2(gridCenterX-hexSize.width, gridCenterY), 
    hexSize.size, 
    parseHtmlHex("#FF4136")
    #FF4136
    # randomColor()
  )
  