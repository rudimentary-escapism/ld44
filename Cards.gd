extends Control

signal selected(unit)
signal disabled
signal enabled

var warrior = preload("res://Units/Warrior.tscn")

func _ready():
    generate()

func generate():
    for card in get_children():
        card.unit = warrior
        card.show()

func _on_Card_pressed(unit):
    emit_signal("selected", unit)


func _on_Game_fight_stage():
    emit_signal("disabled")


func _on_Game_buy_stage():
    generate()
    emit_signal("enabled")
