extends Node2D

class_name Unit

const MIN_SIZE := 0
const MAX_SIZE := 9
const SQUARE_SIZE := 83
const OFFSET_X := 28
const OFFSET_Y := 0
const GRID_OFFSET_X := 68
const GRID_OFFSET_Y := 42
const LINE := 3

func _process(delta):
    update_z_index()
            
func real_position(coord: Vector2) -> Vector2:
    var new_position := Vector2.ZERO
    new_position.x = coord.x * SQUARE_SIZE + SQUARE_SIZE
    new_position.y = coord.y * SQUARE_SIZE + SQUARE_SIZE
    new_position.x += OFFSET_X + LINE * coord.x
    new_position.y -= OFFSET_Y - LINE * coord.y
    return new_position
    
func grid_position(coord: Vector2) -> Vector2:
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
    return grid_position(position) - grid_position(coord)
    
func take_damage(damage: int):
    $HealthBar.value -= damage
    if ($HealthBar.value == 0):
        queue_free()

func move(target: Unit) -> Vector2:
    var dist := grid_distance(target.position)
    var new_pos := grid_position(position)
    if abs(dist.x) > abs(dist.y):
        if dist.x > 0:
            new_pos.x -= 1
        else:
            new_pos.x +=1
    else:
        if dist.y > 0:
            new_pos.y -= 1
        else:
            new_pos.y += 1
    return new_pos
    
func is_someone_there(units: Array, coord: Vector2) -> bool:
    for unit in units:
        if grid_position(unit.position) == coord:
            return true
    return false
    
func search_low_hp(units: Array) -> Unit:
    var unit = null
    var value = 1
    for _unit in units:
        var per =\
            float(_unit.get_node("HealthBar").value) /\
            _unit.get_node("HealthBar").max_value
        if value > per:
            value = per
            unit = _unit
    return unit
    
func update_z_index():
    z_index = grid_position(position).y