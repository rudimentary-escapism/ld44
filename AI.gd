extends Node

var warrior := preload("res://Units/Warrior.tscn")

func _ready():
    pass


func _on_Game_fight_stage():
    var coord := Vector2(5, 0)
    get_node("../Map").create_enemy(warrior.instance(), coord)
