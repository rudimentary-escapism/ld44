extends Control

signal selected(unit)
signal disabled
signal enabled

var warrior = preload("res://Units/Warrior.tscn")
var paladin = preload("res://Units/Paladin.tscn")
var priest = preload("res://Units/Priest.tscn")
var archer = preload("res://Units/Archer.tscn")

func _ready():
    generate()

func generate():
    randomize()
    for card in get_children():
        match randi() % 4:
            0:
                card.unit = warrior
                card.get_node("Button/Label").text = "Warrior"
            1:
                card.unit = paladin
                card.get_node("Button/Label").text = "Paladin"
            2:
                card.unit = priest
                card.get_node("Button/Label").text = "Priest"  
            3:
                card.unit = archer
                card.get_node("Button/Label").text = "Archer" 
        card.show()

func _on_Card_pressed(unit):
    emit_signal("selected", unit)


func _on_Game_fight_stage():
    emit_signal("disabled")


func _on_Game_buy_stage():
    generate()
    emit_signal("enabled")
