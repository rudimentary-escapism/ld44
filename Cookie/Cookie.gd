extends Node2D

export (int) var max_hp := 50
var hp: int

func _ready():
    hp = max_hp
    $Label.text = str(hp) + " / " + str(max_hp)
    
func update_hp(delta: int):
    hp += delta
    $Label.text = str(hp) + " / " + str(max_hp)
    update_sprite(float(hp * 100) / max_hp)

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