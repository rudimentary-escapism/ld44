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

func _ready():
    generate()

func generate():
    randomize()
    for card in get_children():
        match randi() % 6:
            0:
                card.set_unit(warrior)
            1:
                card.set_unit(paladin)
            2:
                card.set_unit(priest)
            3:
                card.set_unit(archer)
            4:
                card.set_unit(rogue)
            5:
                card.set_unit(mage)
        card.show()

func _on_Card_pressed(unit):
    emit_signal("selected", unit)


func _on_Game_fight_stage():
    emit_signal("disabled")


func _on_Game_buy_stage():
    generate()
    emit_signal("enabled")
