extends Control

func _ready():
    $Hat/AnimationPlayer.play("New Anim")
    
func _input(event):
    if event is InputEventMouseButton:
        get_tree().change_scene("res://Game.tscn")
