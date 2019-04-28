extends Node2D

class_name Unit

const MIN_SIZE := 0
const MAX_SIZE := 9
const SQUARE_SIZE := 50
const OFFSET_X := 17
const OFFSET_Y := 0
const GRID_OFFSET_X := 41
const GRID_OFFSET_Y := 25
const LINE := 1.8
            
func real_position(coord: Vector2) -> Vector2:
    var new_position := Vector2.ZERO
    new_position.x = coord.x * SQUARE_SIZE + SQUARE_SIZE
    new_position.y = coord.y * SQUARE_SIZE + SQUARE_SIZE
    new_position.x += OFFSET_X + LINE * coord.x
    new_position.y -= OFFSET_Y - LINE * coord.y
    return new_position
    
func grip_position(coord: Vector2) -> Vector2:
    coord.y -= GRID_OFFSET_Y
    coord.x -= GRID_OFFSET_X
    var new_position := Vector2.ZERO
    new_position.x = (coord.x - SQUARE_SIZE) / SQUARE_SIZE
    new_position.y = (coord.y - SQUARE_SIZE) / SQUARE_SIZE
    coord.x -= new_position.x * LINE
    coord.y -= new_position.y * LINE
    new_position.x = (coord.x - SQUARE_SIZE) / SQUARE_SIZE
    new_position.y = (coord.y - SQUARE_SIZE) / SQUARE_SIZE
    new_position.x = clamp(new_position.x, MIN_SIZE, MAX_SIZE)
    new_position.y = clamp(new_position.y, MIN_SIZE, MAX_SIZE)
    return new_position.ceil()

func search_nearest(units: Array):
    var nearest = units[0]
    var dist = 9999
    for unit in units:
        if dist > position.distance_to(unit.position):
            nearest = unit
            dist = position.distance_to(unit.position)
    return nearest

func grid_distance(coord: Vector2) -> Vector2:
    return grip_position(position) - grip_position(coord)
    
func take_damage(damage: int):
    $HealthBar.value -= damage
    if ($HealthBar.value == 0):
        queue_free()