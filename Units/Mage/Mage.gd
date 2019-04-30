extends "../../Unit.gd"

export (int) var damage := 2
export (PackedScene) var AOE

func tick(_allies: Array, _enemies: Array):
    pass

func _ready():
    var game = get_node("/root/Game")
    game.connect("buy_stage", self, "_on_Game_buy_stage")
    game.connect("fight_stage", self, "_on_Game_fight_stage")

func _on_Game_buy_stage():
    $CastSpeed.stop()
    
func _on_Game_fight_stage():
    $CastSpeed.start()

func _on_CastSpeed_timeout():
    $AnimatedSprite.play("damage")

func _on_AnimatedSprite_animation_finished():
    $AnimatedSprite.stop()
    $AnimatedSprite.frame = 0
    var enemies = get_enemies()
    if enemies.size() > 0:
        var enemy = search_nearest(enemies)
        cast_aoe(enemy, damage)
            
func cast_aoe(unit: Unit, damage: int):
    var aoe = AOE.instance()
    aoe.position = unit.position
    get_node("/root/Game").add_child(aoe)
    
    var enemies = get_enemies()
    var area = search_nearby(unit, enemies)
    for enemy in area:
        enemy.take_damage(damage)
