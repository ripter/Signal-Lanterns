import std/[strformat, math, random]
import pixie
import chroma

proc randomColor(): ColorRGBA =
  let
    r = rand(255).uint8
    g = rand(255).uint8
    b = rand(255).uint8

  return rgba(r, g, b, 255)


proc hexagonWidth(height: int): int =
  let width: float = (toFloat(height) / 2.0) * sqrt(3.0)
  return width.toInt()

proc horizOffset(size: int): float32 =
  return sqrt(3.0) * toFloat(size)/2.0

proc vertOffset(size: int): float32 =
  return 3/2 * toFloat(size)/2.0


proc drawHexagon(image: var Image, color: ColorRGBA) =
  let width: float32 = image.width / 2
  let height: float32 = image.height / 2
  # Create a Hexagon path
  let path = newPath()
  path.polygon(vec2(width, height), height, sides = 6)
  # Draw the path
  image.fillPath(path, color)



proc renderWorkspace*(hexSize: int) =
  let height = hexSize
  let width = hexagonWidth(hexSize)
  let vertOffset = vertOffset(hexSize)
  let horizOffset = horizOffset(hexSize)

  echo &"Width: {width} Height: {height}"
  echo &"Vert Offset: {vertOffset} Horiz Offset: {horizOffset}"

  var outImage = newImage(width * 2, height * 2)
  var ctx = newContext(outImage)

  # Create a new image to draw on
  var image = newImage(width, height)

  drawHexagon(image, randomColor())
  ctx.drawImage(image, 0, 0)

  drawHexagon(image, randomColor())
  ctx.drawImage(image, horizOffset, 0)

  drawHexagon(image, randomColor())
  ctx.drawImage(image, horizOffset/2, vertOffset)

  # Write the image to disk.
  outImage.writeFile("output.png")