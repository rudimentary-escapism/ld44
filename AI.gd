extends Node

var warrior := preload("res://Units/Warrior.tscn")

func _ready():
    var coord := Vector2(0, 0)
    get_node("../Map").create_enemy(warrior.instance(), coord)
