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
const MIN_Y_PLAYER = 5

var grid_position: Vector2 setget set_grid_pos, get_grid_pos
var is_preview: bool

func _process(delta):
    update_z_index()
            
func set_grid_pos(coord: Vector2):
    var new_position := Vector2.ZERO
    new_position.x = coord.x * SQUARE_SIZE + SQUARE_SIZE
    new_position.y = coord.y * SQUARE_SIZE + SQUARE_SIZE
    new_position.x += OFFSET_X + LINE * coord.x
    new_position.y -= OFFSET_Y - LINE * coord.y
    position = new_position
    
func get_grid_pos() -> Vector2:
    var pos = position
    pos -= Vector2(GRID_OFFSET_X, GRID_OFFSET_Y)
    var new_position := Vector2.ZERO
    new_position.x = (pos.x - SQUARE_SIZE) / SQUARE_SIZE
    new_position.y = (pos.y - SQUARE_SIZE) / SQUARE_SIZE
    pos -= new_position * LINE
    new_position.x = (pos.x - SQUARE_SIZE) / SQUARE_SIZE
    new_position.y = (pos.y - SQUARE_SIZE) / SQUARE_SIZE
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

func grid_distance(unit: Unit) -> Vector2:
    return get_grid_pos() - unit.grid_position
    
func take_damage(damage: int):
    $HealthBar.value -= damage
    if ($HealthBar.value == 0):
        queue_free()

func move(target: Unit) -> Vector2:
    var dist := grid_distance(target)
    var new_pos := get_grid_pos()
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
        if unit.grid_position == coord:
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
    
func search_abs_low_hp(units: Array) -> Unit:
    var unit = null
    var value = 999
    for _unit in units:
        if value > _unit.get_node("HealthBar").value:
            value = _unit.get_node("HealthBar").value
            unit = _unit
    return unit
    
func update_z_index():
    z_index = int(get_grid_pos().y)
    
func _input(event: InputEvent):
    if event is InputEventMouseMotion && is_preview:
        var last_position = position
        position = event.position
        if get_grid_pos().y < MIN_Y_PLAYER:
            position.y = last_position.y
        recalc_grip_position()

func recalc_grip_position():
    set_grid_pos(get_grid_pos())
    
func search_nearby(unit: Unit, _units: Array) -> Array:
    var units = Array()
    for _unit in _units:
        var dist = unit.grid_distance(_unit)
        if dist.x < 2 && dist.y < 2:
            units.push_back(_unit)
    return units

func get_enemies() -> Array:
    if get_parent().name == "Enemies":
        return get_node("/root/Game/Map/Allies").get_children()
    else:
        return get_node("/root/Game/Map/Enemies").get_children()
        
func get_allies() -> Array:
    return get_parent().get_children()