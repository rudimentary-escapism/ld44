extends Node2D

var preview: Node2D
    
func preview_unit(unit: Resource, coord: Vector2):
    remove_preview()
    preview = unit.instance()
    preview.position = preview.real_position(coord)
    add_child(preview)
    
func remove_preview():
    if (preview != null):
        preview.queue_free()

func create_enemy(unit: Unit, coord: Vector2):
    unit.position = unit.real_position(coord)
    $Enemies.add_child(unit)
    
func create_ally(unit: Unit, coord: Vector2):
    unit.position = unit.real_position(coord)
    $Allies.add_child(unit)

func _on_WorldTimer_timeout():
    var allies = $Allies.get_children()
    var enemies = $Enemies.get_children()
    for ally in allies:
        ally.tick(allies, enemies)
        
    for enemy in $Enemies.get_children():
        enemy.tick(enemies, allies)
