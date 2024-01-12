import std/[strformat, math, random]
import pixie
import chroma

proc randomColor(): ColorRGBA =
  # Generate random values for red, green, blue, and alpha (0-255)
  let
    r = rand(255).uint8
    g = rand(255).uint8
    b = rand(255).uint8
    # a = rand(255).uint8
  return rgba(r, g, b, 255)


proc hexagonWidth(height: int): int =
  let width: float = toFloat(height) / 2.0 * sqrt(3.0)
  return width.toInt()


proc drawHexagon(image: var Image, color: ColorRGBA) =
  let width: float32 = image.width / 2
  let height: float32 = image.height / 2
  # Create a Hexagon path
  let path = newPath()
  path.polygon(vec2(width, height), height, sides = 6)
  # Draw the path
  image.fillPath(path, color)



proc renderWorkspace*() =
  let height = 200
  let width = hexagonWidth(height)
  echo &"Width: {width} Height: {height}"
  let color = randomColor()
  echo &"Color: {color}"
  # Create a new image to draw on
  var image = newImage(width, height)

  # drawHexagon(image, rgba(155, 255, 155, 255))
  drawHexagon(image, color)

  # Write the image to disk.
  image.writeFile("output.png")