extends Node2D

signal lost

export (int) var max_hp := 50
var hp: int

func _ready():
    hp = max_hp
    $Label.text = format(hp, max_hp)
    
func format(hp: int, max_hp: int) -> String:
    return str(hp) + " / " + str(max_hp)
    
func update_hp(delta: int):
    hp += delta
    $Label.text = format(hp, max_hp)
    update_sprite(float(hp * 100) / max_hp)
    if hp <= 0:
        $Label.text = format(0, max_hp)
        emit_signal("lost")

func update_sprite(hp: float):
    toggle_sprite($Cookie100, hp > 75)
    toggle_sprite($Cookie75, hp <= 75 && hp > 50)
    toggle_sprite($Cookie50, hp <= 50 && hp > 25)
    toggle_sprite($Cookie25, hp <= 25)
        
func toggle_sprite(sprite: Sprite, show: bool):
    if show:
        sprite.show()
    else:
        sprite.hide()