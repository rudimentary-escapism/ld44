extends Node

class_name MoveComponent

onready var unit: Unit = get_parent()
onready var TweenNode := Tween.new()

func _ready():
    add_child(TweenNode)
    
func moveTo(target: Unit, map: Array) -> Array:
    var mmap := transformate(map)
    var path := build_path(unit.grid.position, target.grid.position, mmap)
    if path.size() != 0:
        var new_pos = path.pop_back()
        map[unit.grid.position.x][unit.grid.position.y] = null
        map[new_pos.x][new_pos.y] = unit
    
        TweenNode.interpolate_property(
            unit,
            "position",
            unit.position,
            unit.grid.grid2real(new_pos),
            0.8,
            Tween.TRANS_CUBIC,
            Tween.EASE_IN_OUT
        )
        TweenNode.start()
        
    return map
    
func transformate(map: Array) -> Array:
    var mmap = []
    for x in range(map.size()):
        mmap.append([])
        for y in range(map[x].size()):
            if map[x][y] == null:
                mmap[x].append(0)
            else:
                mmap[x].append(-1)
    return mmap
    
func build_path(from: Vector2, to: Vector2, mmap: Array) -> Array:
    mmap[from.x][from.y] = 1
    mmap[to.x][to.y] = 0
    mmap = wave(1, to, mmap)
    return backtrace(to, mmap, [])
    
func wave(value: int, to: Vector2, mmap: Array) -> Array:
    var next_wave = false
    for x in range(mmap.size()):
        for y in range(mmap[x].size()):
            if mmap[x][y] == value:
                
                if to.x == x && to.y == y:
                    return mmap
                    
                if x + 1 < mmap.size() && mmap[x + 1][y] == 0:
                        mmap[x + 1][y] = value + 1
                        next_wave = true
                        
                if x - 1 >= 0 && mmap[x - 1][y] == 0:
                    mmap[x - 1][y] = value + 1
                    next_wave = true
                        
                if y + 1 < mmap[x].size() && mmap[x][y + 1] == 0:
                    mmap[x][y + 1] = value + 1
                    next_wave = true
                        
                if y - 1 >= 0 && mmap[x][y - 1] == 0:
                    mmap[x][y - 1] = value + 1
                    next_wave = true
                    
    if next_wave:
        return wave(value + 1, to, mmap)
    else:
        return mmap
            
func backtrace(pos: Vector2, mmap: Array, path: Array) -> Array:
    var value: int = mmap[pos.x][pos.y]
    if value <= 1:
        return path
            
    path.append(pos)
    value = value - 1

    if pos.x + 1 < mmap.size() && mmap[pos.x + 1][pos.y] == value:
        return backtrace(Vector2(pos.x + 1, pos.y), mmap, path)
        
    if pos.x - 1 >= 0 && mmap[pos.x - 1][pos.y] == value:
        return backtrace(Vector2(pos.x - 1, pos.y), mmap, path)
        
    if pos.y + 1 < mmap[pos.x].size() && mmap[pos.x][pos.y + 1] == value:
        return backtrace(Vector2(pos.x, pos.y + 1), mmap, path)
        
    if pos.y - 1 >= 0 && mmap[pos.x][pos.y - 1] == value:
        return backtrace(Vector2(pos.x, pos.y - 1), mmap, path)
            
    return path
