import pixie

proc renderWorkspace*() =
  echo "Do some rendering"
  let image = newImage(200, 200)
  let path = newPath()
  path.polygon(vec2(100, 100), 70, sides = 6)

  let polygonImage = newImage(200, 200)
  polygonImage.fillPath(path, rgba(255, 255, 255, 255))

  let shadow = polygonImage.shadow(
    offset = vec2(2, 2),
    spread = 2,
    blur = 10,
    color = rgba(0, 0, 0, 200)
  )

  image.draw(shadow)
  image.draw(polygonImage)
  image.writeFile("output.png")