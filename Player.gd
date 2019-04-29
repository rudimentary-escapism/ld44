extends Node

signal put_status
signal idle_status

onready var map := get_node("../Map")
export (int) var buy_cost = -1

const MIN_Y = 5

enum {IDLE, PUT}

var status := IDLE
var selected_unit: Unit

func _ready():
    set_status(IDLE)

func _input(event: InputEvent):
    match status:
        PUT:
            if event is InputEventMouseButton:
                selected_unit.position = event.position
                if selected_unit.grid_position.y >= MIN_Y && map.is_free(selected_unit.grid_position):
                    selected_unit.is_preview = false
                    remove_child(selected_unit)
                    map.create_ally(selected_unit, selected_unit.grid_position)
                    set_status(IDLE)

func _on_Cards_selected(unit):
    selected_unit = unit.instance()
    selected_unit.is_preview = true
    add_child(selected_unit)
    $Cookie.update_hp(buy_cost)
    set_status(PUT)

func set_status(_status):
    status = _status
    match _status:
        PUT:
            emit_signal("put_status")
        IDLE:
            emit_signal("idle_status")

func _on_Game_fight_stage():
    match status:
        PUT:
            selected_unit.queue_free()
            $Cookie.update_hp(-buy_cost)
            set_status(IDLE)
