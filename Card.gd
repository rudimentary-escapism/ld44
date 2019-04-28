extends Control

signal pressed(unit)

const offset = 100

var unit: Resource

func _ready():
    pass

func _on_Button_mouse_entered():
    $Button.rect_position.y -= offset


func _on_Button_mouse_exited():
    $Button.rect_position.y += offset

func set_title(title):
    $Button/Label.text = title

func _on_Button_pressed():
    emit_signal("pressed", unit)
    $Button.rect_position.y += offset
    visible = false


func _on_Cards_enabled():
    $Button.disabled = false


func _on_Cards_disabled():
    $Button.disabled = true
