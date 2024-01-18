
type AxialCoordinate* = tuple[q: int, r: int]


#[
var axial_direction_vectors = [
    Hex(+1, 0), Hex(+1, -1), Hex(0, -1), 
    Hex(-1, 0), Hex(-1, +1), Hex(0, +1), 
]
var cube_diagonal_vectors = [
    Cube(+2, -1, -1), Cube(+1, -2, +1), Cube(-1, -1, +2), 
    Cube(-2, +1, +1), Cube(-1, +2, -1), Cube(+1, +1, -2), 
]
function axial_direction(direction):
    return axial_direction_vectors[direction]

function axial_add(hex, vec):
    return Hex(hex.q + vec.q, hex.r + vec.r)

function axial_neighbor(hex, direction):
    return axial_add(hex, axial_direction(direction))

function cube_diagonal_neighbor(cube, direction):
    return cube_add(cube, cube_diagonal_vectors[direction])
]#