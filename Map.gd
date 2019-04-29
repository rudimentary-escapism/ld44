extends Node2D

signal player_lost
signal ai_lost

onready var allies_cache = $Allies.duplicate()
        
func is_free(coord: Vector2) -> bool:
    for ally in $Allies.get_children():
        if ally.grid_position == coord:
            return false
    return true

func create_enemy(unit: Unit, coord: Vector2):
    unit.grid_position = coord
    unit.get_node("HealthBar").set_tint_progress("#e85555")
    $Enemies.add_child(unit)
    
func create_ally(unit: Unit, coord: Vector2):
    unit.grid_position = coord
    $Allies.add_child(unit)

func _on_WorldTimer_timeout():
    var allies = $Allies.get_children()
    var enemies = $Enemies.get_children()
    for ally in allies:
        ally.tick(allies, enemies)
        
    for enemy in $Enemies.get_children():
        enemy.tick(enemies, allies)
        
    if allies.size() == 0:
        emit_signal("player_lost")
    elif enemies.size() == 0:
        emit_signal("ai_lost")


func _on_Game_fight_stage():
    allies_cache = $Allies.duplicate()
    $WorldTimer.start()


func _on_Game_buy_stage():
    $WorldTimer.stop()
    for enemy in $Enemies.get_children():
        enemy.queue_free()
        
    $Allies.free()
    add_child(allies_cache)
        
