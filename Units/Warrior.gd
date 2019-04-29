extends "../Unit.gd"

export (int) var damage := 2

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
    return dist.x + dist.y == 1
    
func set_status(new_status):
    match new_status:
        ATTACK:
            if status != ATTACK:
                $AttackSpeed.start()
                status = new_status
        LOOKING_FOR_ENEMY:
            $AttackSpeed.stop()
            status = new_status

func _on_AttackSpeed_timeout():
    if is_instance_valid(target):
        target.take_damage(damage)
    else:
        set_status(LOOKING_FOR_ENEMY)
