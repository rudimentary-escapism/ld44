extends Node

var warrior = preload("res://Units/Warrior/Warrior.tscn")
var paladin = preload("res://Units/Paladin/Paladin.tscn")
var priest = preload("res://Units/Priest/Priest.tscn")
var rogue = preload("res://Units/Rogue/Rogue.tscn")
var mage = preload("res://Units/Mage/Mage.tscn")
var archer = preload("res://Units/Archer/Archer.tscn")

var _round = 0

func _ready():
    pass


func _on_Game_fight_stage():
    _round += 1
    match _round:
        1:
            get_node("../Map").create_enemy(
                priest.instance(), Vector2(0, 0)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(5, 2)
            )
        2:
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(5, 3)
            )
            get_node("../Map").create_enemy(
                paladin.instance(), Vector2(6, 3)
            )
            get_node("../Map").create_enemy(
                paladin.instance(), Vector2(4, 3)
            )
            get_node("../Map").create_enemy(
                priest.instance(), Vector2(4, 0)
            )
        3:
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(5, 3)
            )
            get_node("../Map").create_enemy(
                paladin.instance(), Vector2(6, 3)
            )
            get_node("../Map").create_enemy(
                paladin.instance(), Vector2(4, 3)
            )
            get_node("../Map").create_enemy(
                priest.instance(), Vector2(4, 0)
            )
        4:
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(5, 3)
            )
            get_node("../Map").create_enemy(
                paladin.instance(), Vector2(6, 3)
            )
            get_node("../Map").create_enemy(
                paladin.instance(), Vector2(4, 3)
            )
            get_node("../Map").create_enemy(
                priest.instance(), Vector2(4, 0)
            )
        5:
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(5, 3)
            )
            get_node("../Map").create_enemy(
                paladin.instance(), Vector2(6, 3)
            )
            get_node("../Map").create_enemy(
                paladin.instance(), Vector2(4, 3)
            )
            get_node("../Map").create_enemy(
                priest.instance(), Vector2(4, 0)
            )
        6:
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(5, 3)
            )
            get_node("../Map").create_enemy(
                paladin.instance(), Vector2(6, 3)
            )
            get_node("../Map").create_enemy(
                paladin.instance(), Vector2(4, 3)
            )
            get_node("../Map").create_enemy(
                priest.instance(), Vector2(4, 0)
            )
        7:
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(5, 3)
            )
            get_node("../Map").create_enemy(
                paladin.instance(), Vector2(6, 3)
            )
            get_node("../Map").create_enemy(
                paladin.instance(), Vector2(4, 3)
            )
            get_node("../Map").create_enemy(
                priest.instance(), Vector2(4, 0)
            )
        8:
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(5, 3)
            )
            get_node("../Map").create_enemy(
                paladin.instance(), Vector2(6, 3)
            )
            get_node("../Map").create_enemy(
                paladin.instance(), Vector2(4, 3)
            )
            get_node("../Map").create_enemy(
                priest.instance(), Vector2(4, 0)
            )
        9:
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(5, 3)
            )
            get_node("../Map").create_enemy(
                paladin.instance(), Vector2(6, 3)
            )
            get_node("../Map").create_enemy(
                paladin.instance(), Vector2(4, 3)
            )
            get_node("../Map").create_enemy(
                priest.instance(), Vector2(4, 0)
            )
        10:
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(5, 3)
            )
            get_node("../Map").create_enemy(
                paladin.instance(), Vector2(6, 3)
            )
            get_node("../Map").create_enemy(
                paladin.instance(), Vector2(4, 3)
            )
            get_node("../Map").create_enemy(
                priest.instance(), Vector2(4, 0)
            )
        11:
            get_tree().reload_current_scene()
