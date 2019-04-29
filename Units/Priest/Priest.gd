extends "../../Unit.gd"

export (int) var heal := 2

var ally: Unit

func tick(allies: Array, _enemies: Array):
    if allies.size() > 0:
        ally = search_low_hp(allies)

func _on_HealSpeed_timeout():
    if is_instance_valid(ally):
        $AnimatedSprite.play("heal")


func _on_AnimatedSprite_animation_finished():
    if is_instance_valid(ally) && $AnimatedSprite.animation == "heal":
        ally.take_damage(-heal)
    $AnimatedSprite.play("default")
