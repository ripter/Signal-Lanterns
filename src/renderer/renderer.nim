import pixie

proc drawHexagon(image: var Image, color: ColorRGBA) =
  let width: float32 = image.width / 2
  let height: float32 = image.height / 2
  # Create a Hexagon path
  let path = newPath()
  path.polygon(vec2(width, height), height, sides = 6)
  # Draw the path
  image.fillPath(path, color)



proc renderWorkspace*() =
  # Create a new image to draw on
  var image = newImage(200, 200)

  drawHexagon(image, rgba(255, 155, 155, 255))

  # Write the image to disk.
  image.writeFile("output.png")