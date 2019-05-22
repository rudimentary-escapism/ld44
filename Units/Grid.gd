extends Node

class_name Grid

const MIN_SIZE := 0
const MAX_SIZE := 9
const SQUARE_SIZE := 83
const OFFSET_X := 28
const OFFSET_Y := 0
const GRID_OFFSET_X := 68
const GRID_OFFSET_Y := 42
const LINE := 3
const MIN_Y_PLAYER = 5

onready var unit := get_parent()
var position: Vector2 setget set_pos, get_pos

            
func set_pos(real_pos: Vector2):
    unit.position = grid2real(real_pos)

func get_pos() -> Vector2:
    return real2grid(unit.position)
    
func real2grid(real_pos: Vector2) -> Vector2:
    real_pos -= Vector2(GRID_OFFSET_X, GRID_OFFSET_Y)
    var grid_pos := Vector2.ZERO
    grid_pos.x = (real_pos.x - SQUARE_SIZE) / SQUARE_SIZE
    grid_pos.y = (real_pos.y - SQUARE_SIZE) / SQUARE_SIZE
    real_pos -= grid_pos * LINE
    grid_pos.x = (real_pos.x - SQUARE_SIZE) / SQUARE_SIZE
    grid_pos.y = (real_pos.y - SQUARE_SIZE) / SQUARE_SIZE
    grid_pos.x = clamp(grid_pos.x, MIN_SIZE, MAX_SIZE)
    grid_pos.y = clamp(grid_pos.y, MIN_SIZE, MAX_SIZE)
    return grid_pos.ceil()
    
func grid2real(grid_pos: Vector2) -> Vector2:
    var real_pos := Vector2.ZERO
    real_pos.x = grid_pos.x * SQUARE_SIZE + SQUARE_SIZE
    real_pos.y = grid_pos.y * SQUARE_SIZE + SQUARE_SIZE
    real_pos.x += OFFSET_X + LINE * grid_pos.x
    real_pos.y -= OFFSET_Y - LINE * grid_pos.y
    return real_pos
    
func distance(coord: Vector2) -> Vector2:
    return get_pos() - coord
    
func get_map() -> Array:
    var map = []
    for x in range(MAX_SIZE + 1):
        map.append([])
        for _y in range(MAX_SIZE + 1):
            map[x].append(null)
            
    for unit in get_tree().get_nodes_in_group("unit"):
        var grid_pos = unit.grid.position
        map[grid_pos.x][grid_pos.y] = unit
    return map