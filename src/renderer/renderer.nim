import std/[strformat, math, random]
import chroma
import pixie

import ../workspace
import ../hexagon

proc randomColor(): ColorRGBA =
  let
    r = rand(255).uint8
    g = rand(255).uint8
    b = rand(255).uint8

  return rgba(r, g, b, 255)



proc pathHexagon(ctx: Context, pos: Vec2, size: float) =
  ctx.beginPath()
  ctx.polygon(pos, size, sides = 6)
  ctx.closePath()

proc drawFilledHexagon(ctx: Context, pos: Vec2, size: float, color: ColorRGBA) =
  ctx.pathHexagon(pos, size)
  ctx.fillStyle = color
  ctx.fill()

proc drawHexagon(ctx: Context, pos: Vec2, size: float, color: ColorRGBA) =
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

  # Create a buffer to draw on
  var buffer = newImage(hexSize.width.toInt(), hexSize.height.toInt())


  # var outImage = newImage(width * 2, height * 2)

  # # Create a new image to draw on
  # var image = newImage(width, height)

  # drawFilledHexagon(buffer, randomColor())
  # # Draw in the center
  let gridCenterX = result.width / 2
  let gridCenterY = result.height / 2
  ctx.drawFilledHexagon(
    vec2(gridCenterX, gridCenterY), 
    hexSize.size, 
    randomColor()
  )

  ctx.drawHexagon(
    vec2(gridCenterX+hexSize.width, gridCenterY), 
    hexSize.size, 
    randomColor()
  )

  ctx.drawHexagon(
    vec2(gridCenterX-hexSize.width, gridCenterY), 
    hexSize.size, 
    randomColor()
  )
  
  # ctx.drawImage(buffer, gridCenterX - (hexSize.width/2), gridCenterY - (hexSize.height/2))


  # drawHexagon(ctx, randomColor())
  # drawHexagon(buffer, randomColor())
  # ctx.drawImage(buffer, hexSize.horzOffset, 0)

  # drawHexagon(buffer, randomColor())
  # ctx.drawImage(
  #   buffer, 
  #   (hexSize.horzOffset/2), 
  #   hexSize.vertOffset
  #   )

  # drawHexagon(buffer, randomColor())
  # ctx.drawImage(
  #   buffer, 
  #   (hexSize.horzOffset/2) + hexSize.horzOffset,
  #   hexSize.vertOffset
  #   )
  # buffer.fill(rgba(0, 0, 0, 0))


  # # Write the image to disk.
  # outImage.writeFile("output.png")