extends Unit

export (int) var damage := 2
export (int) var attack_range := 4

var Attack = preload("res://Units/Archer/Attack/Attack.tscn")

enum {LOOKING_FOR_ENEMY, ATTACK}

var status := LOOKING_FOR_ENEMY
var target: Unit

func tick(_allies: Array, enemies: Array) -> bool:
    if enemies.size() > 0:
        target = search_nearest(enemies)
        if is_ready_to_attack():
            set_status(ATTACK)
        else:
            set_status(LOOKING_FOR_ENEMY)
#            $MoveComponent.move(target.grid.position)
            return false
            
    return true
    
func findTarget() -> Unit:
    return search_nearest(get_enemies())
    
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
        $AttackSound.play()
        var attack = Attack.instance()
        attack.position = position
        attack.damage = damage
        attack.target = target
        get_node("/root/Game").add_child(attack)
    else:
        set_status(LOOKING_FOR_ENEMY)
