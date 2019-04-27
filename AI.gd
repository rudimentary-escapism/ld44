extends Node

var warrior := preload("res://Warrior.tscn")

func _ready():
    var coord := Vector2(5, 0)
    get_node("../Map").create_enemy(warrior.instance(), coord)
