import std/[strformat, math, random]
import pixie
import chroma

import ../hexagon

proc randomColor(): ColorRGBA =
  let
    r = rand(255).uint8
    g = rand(255).uint8
    b = rand(255).uint8

  return rgba(r, g, b, 255)





proc drawHexagon(image: var Image, color: ColorRGBA) =
  let width: float32 = image.width / 2
  let height: float32 = image.height / 2
  # Create a Hexagon path
  let path = newPath()
  path.polygon(vec2(width, height), height, sides = 6)
  # Draw the path
  image.fillPath(path, color)



proc renderWorkspace*(hexgonSize: int): Image =
  let hexSize = newHexagonSize(hexgonSize.toFloat())
  echo &"Hexagon size: {hexSize}"

  # create the result image.
  let workspaceWidth:int = toInt(hexSize.width * 3.0)
  let workspaceHeight:int = toInt(hexSize.height * 3.0)
  result = newImage(workspaceWidth, workspaceHeight)

  # Create a buffer to draw on
  var buffer = newImage(hexSize.width.toInt(), hexSize.height.toInt())
  # Create a context so we can draw the buffer at position.
  let ctx = newContext(result)


  # var outImage = newImage(width * 2, height * 2)

  # # Create a new image to draw on
  # var image = newImage(width, height)

  drawHexagon(buffer, randomColor())
  ctx.drawImage(buffer, 0, 0)
  buffer.fill(rgba(0, 0, 0, 0))

  drawHexagon(buffer, randomColor())
  ctx.drawImage(buffer, hexSize.horzOffset, 0)
  buffer.fill(rgba(0, 0, 0, 0))

  # drawHexagon(buffer, randomColor())
  # ctx.drawImage(buffer, hexSize.horzOffset, hexSize.vertOffset)
  # buffer.fill(rgba(0, 0, 0, 0))

  # drawHexagon(buffer, randomColor())
  # ctx.drawImage(buffer, hexSize.width, hexSize.vertOffset)
  # buffer.fill(rgba(0, 0, 0, 0))


  # # Write the image to disk.
  # outImage.writeFile("output.png")