extends Control

signal pressed(unit)

const offset = 150

var unit: Unit

func _ready():
    pass
    
func set_unit(_unit: Unit):
    unit = _unit
    $Button/Label.text = unit.name
    $Button/Image.texture = unit.get_image()
    $Button/Description.text = unit.description


func _on_Button_mouse_entered():
    $Button.rect_position.y -= offset

func _on_Button_mouse_exited():
    $Button.rect_position.y += offset

func _on_Button_pressed():
    emit_signal("pressed", unit)
    $Button.rect_position.y += offset
    visible = false

func _on_Cards_enabled():
    $Button.disabled = false


func _on_Cards_disabled():
    $Button.disabled = true
