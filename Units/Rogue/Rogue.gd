extends "../../Unit.gd"

export (int) var damage := 4

enum {LOOKING_FOR_ENEMY, ATTACK}

var status := LOOKING_FOR_ENEMY
var target: Unit

func tick(_allies: Array, enemies: Array) -> bool:
    if enemies.size() > 0:
        target = search_abs_low_hp(enemies)
        if is_ready_to_attack():
            set_status(ATTACK)
        else:
            set_status(LOOKING_FOR_ENEMY)
#            $MoveComponent.move(target.grid.position)
            return false
            
    return true
    
func findTarget() -> Unit:
    return search_abs_low_hp(get_enemies())
    
func is_ready_to_attack() -> bool:
    var dist := grid_distance(target).abs()
    return dist.x + dist.y == 1
    
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
        target.take_damage(damage)
    else:
        set_status(LOOKING_FOR_ENEMY)
