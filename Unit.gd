extends Node2D

class_name Unit

const SIZE_X := 10
const SIZE_Y := 10
const SQUARE_SIZE := 40
            
func real_position(coord: Vector2) -> Vector2:
    var new_position := Vector2.ZERO
    new_position.x = coord.x * SQUARE_SIZE + SQUARE_SIZE
    new_position.y = coord.y * SQUARE_SIZE + SQUARE_SIZE
    return new_position
    
func grip_position(coord: Vector2) -> Vector2:
    var new_position := Vector2.ZERO
    new_position.x = (coord.x - SQUARE_SIZE) / SQUARE_SIZE
    new_position.y = (coord.y - SQUARE_SIZE) / SQUARE_SIZE
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