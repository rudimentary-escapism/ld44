extends "../../Unit.gd"

export (int) var damage := 2
export (int) var heal := 2

enum {LOOKING_FOR_ENEMY, ATTACK}

var status := LOOKING_FOR_ENEMY
var target: Unit
var ally: Unit

func tick(allies: Array, enemies: Array) -> bool:
    if enemies.size() > 0:
        target = search_nearest(enemies)
        if is_ready_to_attack():
            set_status(ATTACK)
        else:
            set_status(LOOKING_FOR_ENEMY)
#            $MoveComponent.move(target.grid.position)
            return false
    
    if allies.size() > 0:
        ally = search_low_hp(allies)
    return true
    
func findTarget() -> Unit:
    return search_nearest(get_enemies())
    
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


func _on_HealSpeed_timeout():
    if is_instance_valid(ally):
        ally.take_damage(-heal)


func _on_AnimatedSprite_animation_finished():
    if is_instance_valid(target) && $AnimatedSprite.animation == "attack":
        target.take_damage(damage)
    else:
        set_status(LOOKING_FOR_ENEMY)


func _on_AnimatedSprite_frame_changed():
    if $AnimatedSprite.frame == 1:
        $AttackSound.play()
