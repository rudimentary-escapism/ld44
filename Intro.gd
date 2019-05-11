extends Control

signal ended

var state := 1

func _ready():
    $Hat/AnimationPlayer.play("New Anim")
    
func _input(event):
    if event is InputEventMouseButton:
        if event.is_pressed():
            mouse_clicked()
        
func mouse_clicked():
    match state:
        0:
            $UIText/UIText.text =\
"Cookie Commander, we were attacked!"
        1:
            $UIText/UIText.text =\
"""You need to build army but won't forget:
to make soldiers you need to sacrifice
your own pieces."""
        2:
            $UIText/UIText.text =\
"Don't waste yourself totally!\nGood luck, Commander!"
        _:
            emit_signal("ended")
    state += 1