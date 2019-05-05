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
                priest.instance(), Vector2(4, 0)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(2, 4)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(7, 4)
            )
        2:
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(1, 4)
            )
            get_node("../Map").create_enemy(
                paladin.instance(), Vector2(4, 4)
            )
            get_node("../Map").create_enemy(
                paladin.instance(), Vector2(5, 4)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(8, 4)
            )
            get_node("../Map").create_enemy(
                mage.instance(), Vector2(4, 1)
            )
            get_node("../Map").create_enemy(
                priest.instance(), Vector2(5, 1)
            )
        3:
            get_node("../Map").create_enemy(
                rogue.instance(), Vector2(0, 1)
            )
            get_node("../Map").create_enemy(
                priest.instance(), Vector2(3, 1)
            )
            get_node("../Map").create_enemy(
                archer.instance(), Vector2(4, 1)
            )
            get_node("../Map").create_enemy(
                mage.instance(), Vector2(4, 0)
            )
            get_node("../Map").create_enemy(
                archer.instance(), Vector2(5, 1)
            )
            get_node("../Map").create_enemy(
                mage.instance(), Vector2(5, 0)
            )
            get_node("../Map").create_enemy(
                priest.instance(), Vector2(5, 0)
            )
            get_node("../Map").create_enemy(
                rogue.instance(), Vector2(9, 1)
            )
        4:
            get_node("../Map").create_enemy(
                rogue.instance(), Vector2(0, 1)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(1, 4)
            )
            get_node("../Map").create_enemy(
                priest.instance(), Vector2(3, 0)
            )
            get_node("../Map").create_enemy(
                paladin.instance(), Vector2(4, 4)
            )
            get_node("../Map").create_enemy(
                archer.instance(), Vector2(4, 1)
            )
            get_node("../Map").create_enemy(
                paladin.instance(), Vector2(5, 4)
            )
            get_node("../Map").create_enemy(
                archer.instance(), Vector2(5, 1)
            )
            get_node("../Map").create_enemy(
                priest.instance(), Vector2(6, 0)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(8, 4)
            )
            get_node("../Map").create_enemy(
                mage.instance(), Vector2(9, 1)
            )
        5:
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(0, 4)
            )
            get_node("../Map").create_enemy(
                rogue.instance(), Vector2(1, 1)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(3, 4)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(4, 4)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(5, 4)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(6, 4)
            )
            get_node("../Map").create_enemy(
                priest.instance(), Vector2(4, 0)
            )
            get_node("../Map").create_enemy(
                priest.instance(), Vector2(5, 0)
            )
            get_node("../Map").create_enemy(
                mage.instance(), Vector2(4, 1)
            )
            get_node("../Map").create_enemy(
                mage.instance(), Vector2(5, 1)
            )
            get_node("../Map").create_enemy(
                rogue.instance(), Vector2(8, 2)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(9, 4)
            )
        6:
            get_node("../Map").create_enemy(
                priest.instance(), Vector2(0, 0)
            )
            get_node("../Map").create_enemy(
                priest.instance(), Vector2(9, 0)
            )
            get_node("../Map").create_enemy(
                rogue.instance(), Vector2(0, 3)
            )
            get_node("../Map").create_enemy(
                rogue.instance(), Vector2(9, 3)
            )
            get_node("../Map").create_enemy(
                archer.instance(), Vector2(2, 2)
            )
            get_node("../Map").create_enemy(
                archer.instance(), Vector2(7, 2)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(3, 4)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(4, 4)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(5, 4)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(6, 4)
            )
            get_node("../Map").create_enemy(
                mage.instance(), Vector2(3, 0)
            )
            get_node("../Map").create_enemy(
                mage.instance(), Vector2(4, 0)
            )
            get_node("../Map").create_enemy(
                mage.instance(), Vector2(5, 0)
            )
            get_node("../Map").create_enemy(
                mage.instance(), Vector2(6, 0)
            )
            get_node("../Map").create_enemy(
                mage.instance(), Vector2(4, 1)
            )
            get_node("../Map").create_enemy(
                mage.instance(), Vector2(5, 1)
            )
        7:
            get_node("../Map").create_enemy(
                priest.instance(), Vector2(0, 4)
            )
            get_node("../Map").create_enemy(
                priest.instance(), Vector2(9, 4)
            )
            get_node("../Map").create_enemy(
                mage.instance(), Vector2(4, 0)
            )
            get_node("../Map").create_enemy(
                mage.instance(), Vector2(5, 0)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(1, 4)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(2, 4)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(3, 4)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(4, 4)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(5, 4)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(6, 4)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(7, 4)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(8, 4)
            )
            get_node("../Map").create_enemy(
                archer.instance(), Vector2(1, 3)
            )
            get_node("../Map").create_enemy(
                archer.instance(), Vector2(2, 3)
            )
            get_node("../Map").create_enemy(
                archer.instance(), Vector2(3, 3)
            )
            get_node("../Map").create_enemy(
                archer.instance(), Vector2(4, 3)
            )
            get_node("../Map").create_enemy(
                archer.instance(), Vector2(5, 3)
            )
            get_node("../Map").create_enemy(
                archer.instance(), Vector2(6, 3)
            )
            get_node("../Map").create_enemy(
                archer.instance(), Vector2(7, 3)
            )
            get_node("../Map").create_enemy(
                archer.instance(), Vector2(8, 0)
            )
        8:
            get_node("../Map").create_enemy(
                priest.instance(), Vector2(0, 0)
            )
            get_node("../Map").create_enemy(
                priest.instance(), Vector2(9, 0)
            )
            get_node("../Map").create_enemy(
                mage.instance(), Vector2(3, 0)
            )
            get_node("../Map").create_enemy(
                mage.instance(), Vector2(4, 0)
            )
            get_node("../Map").create_enemy(
                mage.instance(), Vector2(5, 0)
            )
            get_node("../Map").create_enemy(
                mage.instance(), Vector2(6, 0)
            )
            get_node("../Map").create_enemy(
                archer.instance(), Vector2(0, 3)
            )
            get_node("../Map").create_enemy(
                archer.instance(), Vector2(9, 3)
            )
            get_node("../Map").create_enemy(
                rogue.instance(), Vector2(0, 4)
            )
            get_node("../Map").create_enemy(
                rogue.instance(), Vector2(9, 4)
            )
            get_node("../Map").create_enemy(
                paladin.instance(), Vector2(1, 4)
            )
            get_node("../Map").create_enemy(
                paladin.instance(), Vector2(8, 4)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(2, 4)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(3, 4)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(4, 4)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(5, 4)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(6, 4)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(7, 4)
            )
            get_node("../Map").create_enemy(
                archer.instance(), Vector2(3, 3)
            )
            get_node("../Map").create_enemy(
                archer.instance(), Vector2(4, 3)
            )
            get_node("../Map").create_enemy(
                archer.instance(), Vector2(5, 3)
            )
            get_node("../Map").create_enemy(
                archer.instance(), Vector2(6, 3)
            )
        9:
            get_node("../Map").create_enemy(
                rogue.instance(), Vector2(0, 3)
            )
            get_node("../Map").create_enemy(
                rogue.instance(), Vector2(1, 3)
            )
            get_node("../Map").create_enemy(
                rogue.instance(), Vector2(8, 3)
            )
            get_node("../Map").create_enemy(
                rogue.instance(), Vector2(9, 3)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(3, 0)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(4, 0)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(5, 0)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(6, 0)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(6, 1)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(6, 2)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(6, 3)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(6, 4)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(5, 4)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(4, 4)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(3, 4)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(3, 3)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(3, 2)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(3, 1)
            )
            get_node("../Map").create_enemy(
                paladin.instance(), Vector2(7, 4)
            )
            get_node("../Map").create_enemy(
                priest.instance(), Vector2(4, 1)
            )
            get_node("../Map").create_enemy(
                priest.instance(), Vector2(5, 1)
            )
            get_node("../Map").create_enemy(
                mage.instance(), Vector2(4, 2)
            )
            get_node("../Map").create_enemy(
                mage.instance(), Vector2(5, 2)
            )
            get_node("../Map").create_enemy(
                archer.instance(), Vector2(4, 3)
            )
            get_node("../Map").create_enemy(
                archer.instance(), Vector2(5, 3)
            )
        10:
            get_node("../Map").create_enemy(
                priest.instance(), Vector2(0, 0)
            )
            get_node("../Map").create_enemy(
                priest.instance(), Vector2(9, 0)
            )
            get_node("../Map").create_enemy(
                rogue.instance(), Vector2(0, 1)
            )
            get_node("../Map").create_enemy(
                rogue.instance(), Vector2(9, 1)
            )
            get_node("../Map").create_enemy(
                paladin.instance(), Vector2(2, 1)
            )
            get_node("../Map").create_enemy(
                paladin.instance(), Vector2(3, 2)
            )
            get_node("../Map").create_enemy(
                paladin.instance(), Vector2(8, 1)
            )
            get_node("../Map").create_enemy(
                paladin.instance(), Vector2(7, 2)
            )
            get_node("../Map").create_enemy(
                priest.instance(), Vector2(2, 0)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(3, 4)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(4, 4)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(5, 4)
            )
            get_node("../Map").create_enemy(
                warrior.instance(), Vector2(6, 4)
            )
            get_node("../Map").create_enemy(
                archer.instance(), Vector2(3, 3)
            )
            get_node("../Map").create_enemy(
                archer.instance(), Vector2(4, 3)
            )
            get_node("../Map").create_enemy(
                archer.instance(), Vector2(5, 3)
            )
            get_node("../Map").create_enemy(
                archer.instance(), Vector2(6, 3)
            )
            get_node("../Map").create_enemy(
                archer.instance(), Vector2(4, 2)
            )
            get_node("../Map").create_enemy(
                archer.instance(), Vector2(5, 2)
            )
            get_node("../Map").create_enemy(
                mage.instance(), Vector2(3, 0)
            )
            get_node("../Map").create_enemy(
                mage.instance(), Vector2(4, 0)
            )
            get_node("../Map").create_enemy(
                mage.instance(), Vector2(5, 0)
            )
            get_node("../Map").create_enemy(
                mage.instance(), Vector2(6, 0)
            )
            get_node("../Map").create_enemy(
                mage.instance(), Vector2(3, 1)
            )
            get_node("../Map").create_enemy(
                mage.instance(), Vector2(4, 1)
            )
            get_node("../Map").create_enemy(
                mage.instance(), Vector2(5, 1)
            )
            get_node("../Map").create_enemy(
                mage.instance(), Vector2(6, 1)
            )
        11:
            get_node("/root/Game/Interface/Win").scale.y = 1
            get_tree().paused = true
#            get_tree().reload_current_scene()
