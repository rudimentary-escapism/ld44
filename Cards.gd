extends CanvasLayer

signal selected(unit)
signal disabled
signal enabled

var warrior = preload("res://Units/Warrior/Warrior.tscn")
var paladin = preload("res://Units/Paladin/Paladin.tscn")
var priest = preload("res://Units/Priest/Priest.tscn")
var archer = preload("res://Units/Archer/Archer.tscn")
var rogue = preload("res://Units/Rogue/Rogue.tscn")
var mage = preload("res://Units/Mage/Mage.tscn")

var warrior_t = preload("res://Units/Warrior/Warrior.png")
var paladin_t = preload("res://Units/Paladin/Paladin.png")
var priest_t = preload("res://Units/Priest/Priest.png")
var archer_t = preload("res://Units/Archer/Archer.png")
var rogue_t = preload("res://Units/Rogue/Rogue.png")
var mage_t = preload("res://Units/Mage/Mage.png")

func _ready():
    generate()

func generate():
    randomize()
    for card in get_children():
        match randi() % 6:
            0:
                card.unit = warrior
                card.get_node("Button/Label").text = "Warrior"
                card.get_node("Button/Image").texture = warrior_t
                card.get_node("Button/Description").text =\
"""- Melee
- High hp"""
            1:
                card.unit = paladin
                card.get_node("Button/Label").text = "Paladin"
                card.get_node("Button/Image").texture = paladin_t
                card.get_node("Button/Description").text =\
"""- Melee
- Weak heal"""
            2:
                card.unit = priest
                card.get_node("Button/Label").text = "Priest" 
                card.get_node("Button/Image").texture = priest_t 
                card.get_node("Button/Description").text =\
"""- No attack
- Strong heal"""
            3:
                card.unit = archer
                card.get_node("Button/Label").text = "Archer"
                card.get_node("Button/Image").texture = archer_t 
                card.get_node("Button/Description").text =\
"""- Range"""  
            4:
                card.unit = rogue
                card.get_node("Button/Label").text = "Rogue" 
                card.get_node("Button/Image").texture = rogue_t 
                card.get_node("Button/Description").text =\
"""- Melee
- Attack
  weak
  target"""
            5:
                card.unit = mage
                card.get_node("Button/Label").text = "Mage"
                card.get_node("Button/Image").texture = mage_t
                card.get_node("Button/Description").text =\
"""- Range
- AOE"""
        card.show()

func _on_Card_pressed(unit):
    emit_signal("selected", unit)


func _on_Game_fight_stage():
    emit_signal("disabled")


func _on_Game_buy_stage():
    generate()
    emit_signal("enabled")
