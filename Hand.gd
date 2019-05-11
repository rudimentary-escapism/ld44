extends CanvasLayer

signal selected(unit)
signal disabled
signal enabled

onready var Cards := get_node("/root/Cards")

func _ready():
    set_new_hand()

func set_new_hand():
    for card in get_children():
        card.unit = Cards.get_random_unit()
        card.show()

func _on_Card_pressed(unit: Unit):
    emit_signal("selected", unit)


func _on_Game_fight_stage():
    emit_signal("disabled")


func _on_Game_buy_stage():
    set_new_hand()
    emit_signal("enabled")
