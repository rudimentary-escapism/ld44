extends Node

class_name Cards

var list := [
    preload("res://Units/Warrior/Warrior.tscn"),
    preload("res://Units/Paladin/Paladin.tscn"),
    preload("res://Units/Priest/Priest.tscn"),
    preload("res://Units/Archer/Archer.tscn"),
    preload("res://Units/Rogue/Rogue.tscn"),
    preload("res://Units/Mage/Mage.tscn")
]

func _ready():
    randomize()
    
func get_random_unit() -> Unit:
    var index = randi() % list.size()
    return list[index].instance()
    
func get_warrior() -> Unit:
    return list[0].instance()
    
func get_paladin() -> Unit:
    return list[1].instance()
    
func get_priest() -> Unit:
    return list[2].instance()
    
func get_archer() -> Unit:
    return list[3].instance()
    
func get_rogue() -> Unit:
    return list[4].instance()
    
func get_mage() -> Unit:
    return list[5].instance()