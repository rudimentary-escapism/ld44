extends "../../Unit.gd"

export (int) var damage := 2
export (int) var attack_range := 4

var arrow = preload("res://Units/Archer/Arrow.tscn")

enum {LOOKING_FOR_ENEMY, ATTACK}

var status := LOOKING_FOR_ENEMY
var target: Unit

func tick(allies: Array, enemies: Array):
    if enemies.size() > 0:
        target = search_nearest(enemies)
        if is_ready_to_attack():
            set_status(ATTACK)
        else:
            set_status(LOOKING_FOR_ENEMY)
            var new_pos = move(target)
            if !is_someone_there(allies, new_pos):
                set_grid_pos(new_pos)
    
func is_ready_to_attack() -> bool:
    var dist := grid_distance(target).abs()
    return dist.x + dist.y < attack_range
    
func set_status(new_status):
    match new_status:
        ATTACK:
            if status != ATTACK:
                $AnimatedSprite.play("attack")
                status = new_status
        LOOKING_FOR_ENEMY:
            $AnimatedSprite.play("default")
            status = new_status


func _on_AnimatedSprite_animation_finished():
    if is_instance_valid(target) && $AnimatedSprite.animation == "attack":
        var _arrow = arrow.instance()
        _arrow.position = position
        _arrow.damage = damage
        _arrow.target = target
        get_node("/root/Game").add_child(_arrow)
    else:
        set_status(LOOKING_FOR_ENEMY)
