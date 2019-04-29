extends "../../Unit.gd"

export (int) var damage := 2

func tick(_allies: Array, _enemies: Array):
    pass


func _on_CastSpeed_timeout():
    var enemies = get_enemies()
    if enemies.size() > 0:
        var enemy = search_nearest(enemies)
        var area = search_nearby(enemy, enemies)
        for _enemy in area:
            _enemy.take_damage(damage)